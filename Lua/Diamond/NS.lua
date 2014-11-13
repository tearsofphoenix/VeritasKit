local class = require("class")
local NS = {}

local Object = class:create("Object")

function Object:load()
	print("class Object load")
end

function Object:copy()
	return self:new()
end

NS.Object = Object

return NS