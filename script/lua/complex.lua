--[[
获取文件名为模块名，并在注册到全局table中
若无return，require返回package.loaded[modname]
]]
-- 或者
-- module(..., package.seeall)

-- 模块设置
local modname = ...
local M = {}
_G[modname] = M
package.loaded[modname] = M


-- 导入段:
-- 声明从外界所需的东西
-- local sqrt = math.sqrt
M.i = {r = 0, i = 1}
function M.new( r, i )
	return {r =r, i=i}
end
M.i = M.new(0, 1)
function M.add( c1, c2 )
	return M.new(c1.r + c2.r, c1.i + c2.i)
end
function M.sub( c1, c2 )
	return M.new(c1.r - c2.r, c1.i - c2.i)
end
function M.mul( c1, c2 )
	return M.new(c1.r*c2.r - c1.i*c2.i,
		c1.r*c2.i + c1.r*c2.i)
end
local function inv( c )
	local n = c.r^2 + c.i^2
	return M.new(c.r/n, -c.i/n)
end
function M.div( c1, c2 )
	return M.mul(c1, inv(c2))
end


-- 切换局部环境，声明不再需要外部访问
setfenv(1, M)
