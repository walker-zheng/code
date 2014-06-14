local inp = assert(io.open(arg[1], "rb"))
local out = assert(io.open(arg[2], "wb"))

local data = inp:read("*all")
data = string.gsub(data, "%.", "=")
out:write(data)
assert(inp:close())
assert(out:close())
