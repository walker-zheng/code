--[[
使用table实现数据结构
]]
--[[
队列
]]
function List.new(  )
    return {first = 0, last = -1}
end

function List.pushfront( list, value )
    local first = list.first - 1
    list.first  = first
    list[first] = values
end

function List.pushback( list, value )
    local last = list.last + 1
    list.last  = last
    list[last] = values
end

function List.popfront( list )
    local first = list.first
    if first > list.last then error("list is empty") end
    local value = list[first]
    list[first] =nil
    list.first  =first+1
end

function List.popback( list )
    local last  = list.last
    if list.first > last then error("list is empty") end
    local value = list[last]
    list[last]  =nil
    list.last   =last -1
end

--[[
multiset
]]
-- ref counter--
function insert( bag, element )
    bag[element] = (bag[element] or 0) + 1
end
-- ref counter++
function remove( bag, element )
    local count = bag[element]
    -- not nil and >1, return --c;else nil
    bag[element] = (count and count > 1) and count - 1 or nil
end

--[[
大字符串缓存栈，汉诺塔式
大字符串位于栈底，小字符串位于栈顶
]]
function addString( stack, s )
    stack[#stack + 1] = s
    for i =#stack - 1, 1,-1 do
		if #stack[i] > #stack[i+1] then break end
		stack[i]   =stack[i] .. stack[i+1]
		stack[i+1] = nil
    end
end

local t = {}
for line in io.lines() do
	if #line == 0 then break end
	t[#t+1]  = line .. "\n"
end
--[[  算法实现见 addString  ]]
local s = table.concat( t, "\n" ) .. "\n"


--[[
graph
]]
function readgraph(  )
	local graph = {}
	for line in io.lines() do
		local namefrom, nameto = string.match(line, "(%S+)%s+(%S+)")
		local from = name2node(graph, namefrom)
		local to   = name2node(graph, nameto)
		from.adj[to] = true
	end
	return graph
end
function name2node( graph, name )
	if not graph[name] then
		graph[name] ={name = name, adj = {}}
	end
	return graph[name]
end
