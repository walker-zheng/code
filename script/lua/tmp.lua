function digitBtn(digit)
    return Button{
        label=tostring(digit),
        action=function()
            add_to_display(digit)
        end}
end

do
    local oldOpen = io.open
    local access_OK = function(filename, mode)
    -- 访问权限检测
    end
    io.open =function(filename, mode)
        if access_OK(filename, mode) then
            return oldOpen(filename, mode)
        else
            return nil, "access denied"
        end
    end
end

Lib={
    foo=function ( x, y ) return x + y end,
    goo=function ( x, y ) return x - y end
}

local function foo (n)
    if n == 0 then
        return 1
    else
        return n * foo(n-1)
    end
end


function foo(n)
    if n>0 then return foo(n-1) end
end
-- return x[i].foo(x[j]+a*b, i+j)


--返回元素值的简单迭代器
function values(t)
    local i = 0
    return function() i=i+1;return t[i] end
end
t = {10, 20, 30}
for elem in values(t) do
    print(elem)
end

function allwords(  )
    local line = io.read()
    local pos = 1
    return function ()
        while line do
            local s, e = string.find(line, "%w+", pos)
            if s then
                pos = e + 1
                return string.sub(line, s, e)
            else
                line = io.read()
                pos = 1
            end
        end
        return nil
    end
end
for word in allwords() do
    print(word)
end



a={one, two, three}
for i,v in ipairs(a) do
    print(i, v)
end

function iter( a, i )
    local i = i + 1
    local v = a[i]
    if v then
        return i, v
    end
end


function ipairs( a )
    -- 迭代器，恒定状态，控制变量初值
    -- call iter(a,0) ==> 1,a[1]；call iter(a,1) ==> 2,a[1]；...
    return iter, a, 0
end

function pairs( t )
    -- 调用next(t,nil)时，返回第一组；没有时，返回nil
    return next, t, nil
end
for k, v in next, t do
-- 同pairs()
end

--[[
链表遍历
--]]
local function getnext( list, node )
    if not node then
        return list
    else
        return node.next
    end
end

function traverse( list )
    return getnext, list, nil
end

list=nil
for line in io.lines() do
    list={val=line, next=list}
end
for node in traverse(list) do
    print(node.val)
end

if not n then error("invalid input") end
n = assert(io.read("*number"), "invalid input")

co = coroutine.create(function () print("hi") end)
print(co)
print(coroutine.status(co))
coroutine.resume(co)


--[[
生产者消费者问题 & filter
--]]
function recv( prod )
    local status, value = coroutine.resume(prod)
    return value
end
function send( x )
    coroutine.yield(x)
end
function producer(  )
    return coroutine.create(function (  )
        while true do
            local x = io.read()
            send(x)
        end
    end)
end
function filter( prod )
    return coroutine.create(function (  )
        for line = 1, 100 do
            local x = recv(prod)
            x = string.format("%5d %s", line, x)
            send(x)
        end
    end)
end
function consumer( prod )
    while true do
        local x = recv(prod)
        io.write(x, "\n")
    end
end
p=producer()
f=filter(p)
consumer(f)

consumer(filter(producer()))

-- function test( n, a )
--     n = n or #a  --默认n取a的大小
--     print(n)
-- end
-- test(0, 3)

--[[
coroutine迭代器版全排列
]]
function permgen( a, n )
    n = n or #a
    if n <= 1 then
        -- printResult(a)
        coroutine.yield(a)
    else
        for i = 1, n do
            -- 将第i元素放到最后
            a[n], a[i] = a[i], a[n]
            -- 生成其余元素的排列
            permgen(a, n - 1)
            -- 恢复第i元素
            a[i], a[n] = a[n], a[i]
        end
    end
end
function permmutations( )
    -- wrap创建一个新协程，每当调用permgen，wrap唤醒一次这个协程
    -- wrap返回一个函数，而不是协程，也不返回错误码，当出错时会引发错误，无法检测协程状态
    return coroutine.wrap(function () permgen( a ) end)
end
-- function permmutations( a )
--     local co = coroutine.create(function (  ) permgen(a) end)
--     return function (  )
--         local code, res = coroutine.resume(co)
--         return res
--     end
-- end
function printResult( a )
    for i = 1, #a do
        io.write(a[i],  "")
    end
    -- sum = sum + 1
    -- io.write(\t\t\t, sum, \n)
    io.write("\n")
end
for p in permmutations{a, b, c} do
    printResult(p)
end

permgen({1,2,3,4})

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
host=www.w3.org
get(host, "/TR/html401/html40.txt")
dispatch()


--[[
自描述数据格式
执行数据文件，回调到Entry处理数据
]]
local authors = {}
function Entry( b ) authors[b[1]] = true end
dofile(data)
for name in pairs(authors) do
    print(name)
end
str='a\jij sij \\goto okhh'
print(string.format("%q", str))

--[[
require 加载原型
]]
function require( name )
    -- 是否加载
    if not package.loaded[name] then
        local loader = findloader(name)
        if loader == nil then
            error("unable to load module"  .. "name")
        end
        -- 标记&加载
        package.loaded[name] = true
        local res = loader(name)
        if res ~= nil then
            package.loaded[name] = res
        end
    end
    return package.loaded[name]
end


--[[
oo特性
类的定义、继承等
]]
Account = {balance = 0}

function Account:new( o )
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
function Account:deposit( v )
    self.balance = self.balance + v
end
function Account:withdraw( v )
    if v > self.balance then error("insufficient funds") end
    self.balance = self.balance - v
end

SpecialAccount = Account:new()              -- 继承
s = SpecialAccount:new{limit = 1000.00}     -- 实例化
s:deposit(100.00)
function SpecialAccount:withdraw(v)
    if v - self.balance >= self:getLimit() then
        error("insufficient funds")
    end
end
function SpecialAccount:getLimit(  )
    return self.limit or 0
end
function s:getLimit()
    return self.balance * 0.10
end

--[[
弱引用
]]
a = {}
b = {__mode = k}
setmetatable(a, b)      -- a的key是弱引用
key = {}
a[key] = 1
key = {}
a[key] = 2
collectgarbage()        -- 强制回收
for i,v in pairs(a) do
    print(v)
end


tbl = {alpha, beta, gamma, delta}
sortFunc = function(a, b) return b < a end
table.sort(tbl, sortFunc)
print(table.concat(tbl, "", ""))


lines ={one = 10, two = 20, three = 30}
a     = {}
for n in pairs(lines) do a[#a+1] = n end
for i,v in ipairs(a) do print(i, v) end


--[[
string
]]
table.sort( a, function ( a, b )
    return string.lower(a) < string.lower(b)
end )
s = "[aijsdifjsidjf]"
print(string.sub(s, 2, -2))
i = 90
print(string.char(i, i+1, i+2))
print(string.byte("abc", 2, -1))
print(string.format("pi = % .4f", math.pi))

--pattern matching
s    = "hello world"
i, j = string.find(s, "hello")
print(i, j)
date = "2014年06月 8日 12:00:38"
d    = string.match(date, "%d+:%d+:%d+")
print(d)
str  = "alll xlll aii"
s    = string.gsub(str, "l", "x", 2)
x = string.gsub("hello world", "(%w+)", "%1 %1")
y = string.gsub("hello world from Lua", "(%w+)%s*(%w+)", "%2 %1")
z = string.gsub("$name-$version.tar.gz", "%$(%w+)", {name= "lua", version= "5.1"})
print(s, "\n", x, "\n", y, "\n", z)
t = {}
s = "from=world, to=Lua"
for k, v in string.gmatch(s, "(%w+)=(%w+)") do
    t[k] = v
end
-- 块匹配
s = "a: 1*(2+3)=<hh>ddc{ok}"
print(string.gsub(s, "%b()", ""), string.gsub(s, "%b<>", ""))
print(string.gsub("hello lua!", "%a", "%0%0-"))
print(string.gsub("hello lua!", "(.)(.)", "%2%1"))

-- 替换 获取变量值
function expend( s )
    return (string.gsub(s, "$(%w+)", function ( n )
        return tostring(_G[n])
    end))
end
print(expend("print=$print; a=$a"))

--[[
io
]]
local f = assert(io.open(filename, "r"))
local t = f:read("*all")
f:close()
-- io.stdin,io.stdout,io.stderr
io.stderr:write(msg)
local tmp = io.input()      -- save old
io.input("newinput")        -- open new file
io.input():close()          -- close current file
io.input(tmp)               -- restore old file
-- 指定每次读取大小
local BUFSIZE = 2^13
local lines, rest = file:read(BUFSIZE, "*line")


-- get file size by seek
function fsize( file )
    local curr = file:seek()
    local size = file:seek("end")
    file:seek("set", curr)
    return size
end

-- date & time
for k,v in pairs(os.date("*t")) do
    print(k,v)
end
print(os.date("%a %b %c -- %H:%M:%S -- %x %X %"))

-- os
print(so.getenv("HOME"))
function mkdir( dir )
    os.os.execute("mkdir " .. dir)
end
-- os.exit()
os.setlocale("ISO-8859-1", "collate")

function test_traceback(  )
    for level =1,math.huge do
        local info = debug.getinfo(level, "nSlufL")
        if not info then break end
        if info.what == "C" then
            print(level, "C function")
        else
            for k,v in pairs(info) do
                print(k,v)
            end
            print("\n")
            -- print(string.format("[%s]:[%d] ", info.short_src, info.currentline))
        end
    end
end


-- sethook counter profiling
Countors = {}
Names    = {}
local function hook(  )
    local f = debug.getinfo(2, "f").func
    if Countors[f] == nil then
        Countors[f] = 1
        Names[f]    = debug.getinfo(2, "Sn")
    else
        Countors[f] = Countors[f] + 1
    end
end
function getname( func )
    local n = Names[func]
    if n.what == "C" then
        return n.name
    end
    local cl = string.format("[%s]:%s", n.short_src, n.linedefined)
    if n.namewhat ~= "" then
        return string.format("%s (%s)", cl, n.name)
    else
        return cl
    end
end
local f = assert(loadfile("bsearch.lua"))
debug.sethook(hook, "c")
f()
debug.sethook()
for func,count in pairs(Countors ) do
    print(getname(func), count)
end

