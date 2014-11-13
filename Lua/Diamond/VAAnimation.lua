local class   = require("class")
local NS = require("NS")
local VA = require("VA")

local Animation = class:inherit(NS.Object, "VA.Animation")

function Animation:animation( )
	return self:new()
end

function Animation:defaultValueForKey(key)
	
end

function Animation:setTimingFunction(newFunc)
	if self._timingFunction ~= newFunc then
		self._timingFunction = newFunc
	end
end

function Animation:timingFunction()
	return self._timingFunction
end

function Animation:setDelegate( newDelegate )
	if self._delegate ~= newDelegate then
		self._delegate = newDelegate
	end
end

function Animation:delegate()
	return self._delegate
end

function Animation:setRemovedOnCompletion( newVal )
	if self._removedOnCompletion ~= newVal then
		self._removedOnCompletion = newVal
	end
end

function Animation:isRemovedOnCompletion()
	return self._removedOnCompletion
end

VA.Animation = Animation

-- Property Animation
local PropertyAnimation = class:inherit(Animation, "VA.PropertyAnimation")

function PropertyAnimation:animationWithKeyPath( keyPath )
	local animation = self:new()
	animation:setKeyPath(keyPath)
	return animation
end

function PropertyAnimation:setKeyPath( keyPath )
	if self._keyPath ~= keyPath then
		self._keyPath = keyPath
	end
end

function PropertyAnimation:keyPath()
	return self._keyPath
end

function PropertyAnimation:setAdditive( additive )
	if self._additive ~= additive then
		self._additive = additive
	end
end

function PropertyAnimation:isAdditive()
	return self._additive
end

function PropertyAnimation:setCumulative(cumulative)
	if self._cumulative ~= cumulative then
		self._cumulative = cumulative
	end
end

function PropertyAnimation:isCumulative()
	return self._cumulative
end

function PropertyAnimation:setValueFunction(func)
	if self._valueFunction ~= func then
		self._valueFunction = func
	end
end

function PropertyAnimation:valueFunction()
	return self._valueFunction
end

VA.PropertyAnimation = PropertyAnimation

-- Basic Animation 
-- TODO

return Animation
