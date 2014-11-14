local NS = require("NS.Base")

local Class = { __globalClasses = {} }

function Class:create(name)
	local newClass = {name = name, _loaded = false}
    Class.__globalClasses[name] = newClass

	return newClass
end

function Class:getClassByName(name)
	return Class.__globalClasses[name]
end

function Class:inherit(baseClass, name)

    local new_class = {name = name}
    local class_mt = { __index = new_class }

    function new_class:alloc()
        print("new of class", name, "\n")
        local newinst = {}
        setmetatable( newinst, class_mt )
        return newinst
    end

    function new_class:init()
        return self
    end

    function new_class:new()
        return self:alloc():init()
    end

    if nil ~= baseClass then
        setmetatable( new_class, { __index = baseClass } )
    end

    -- Implementation of additional OO properties starts here --

    -- Return the class object of the instance
    function new_class:class()
        return new_class
    end
    function new_class:self()
    	return new_class
    end
    -- Return the super class object of the instance
    function new_class:superClass()
        return baseClass
    end

    -- Return true if the caller is an instance of theClass
    function new_class:isKindOfClass( theClass )

        local cur_class = new_class

        while ( nil ~= cur_class ) do
            if cur_class == theClass then
                return true
            else
                cur_class = cur_class:superClass()
            end
        end

        return false
    end

    return new_class
end

NS.Class = Class

return Class
