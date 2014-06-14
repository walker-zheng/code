--[[
luasocket file download test
--]]

require("socket")

host ="orgmode.org"
function download( host, file )
    local c =assert(socket.connect(host, 80))
	local count = 0
    c:send("GET" .. file .. " HTTP/1.0\r\n\r\n")
    while true do
        local s, status, partial = c:receive(2^10)
        count = count + #(s or partial)
        -- io.write(s or partial)
        if status == "closed" then break end
    end
    c:close()
    print(file, count)
end

--[[
非阻塞读写
]]
threads = {}
function get( host, file )
    local co = coroutine.create(function (  )
        download(host, file)
    end)
    table.insert(threads, co)
end

function dispatch(  )
    local i = 1
    while true do
        --[[
        检测是否有线程
        --]]
        if threads[i] == nil then
            if threads[1] == nil then break end
            i = 1
        end
        local status, res = coroutine.resume(threads[i])
        if not res then
            table.remove(threads, i)
        else
            i = i + 1
        end
    end
end
get(host, "/worg/index.html")
get(host, "/features.html")
get(host, "/img/main.jpg")
dispatch()
