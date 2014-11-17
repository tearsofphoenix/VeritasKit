--
-- Created by IntelliJ IDEA.
-- User: Mac003
-- Date: 14/11/14
-- Time: 上午11:54
-- To change this template use File | Settings | File Templates.
--
local NS = require("NS.Base")
local Class = require("NS.Class")

local Object = Class:create("Object")

function Object:load()
    print("class Object load")
end

function Object:copy()
    return self:new()
end

NS.Object = Object
