local class = require("class")
local NS = require("NS")
local VA = require("VA")
local CG = require("CG")

local Layer = class:inherit(NS.Object, "VA.Layer")

function Layer:layer()
   return self:new() 
end

function Layer:initWithLayer( layer )
	local instance = self:new()
	instance._presentationLayer = layer
	return instance
end

function Layer:presentationLayer( )
	return self._presentationLayer
end

function Layer:modelLayer( )
	return self._modelLayer
end

Layer.defaultValueForKey = function (key)
	
end

Layer.needsDisplayForKey = function ( key )

end

function Layer:shouldArchiveValueForKey( )
	
end

function Layer:setBounds( bounds )
	if not CG.RectEqualtoRect(self._bounds, bounds) then
		self._bounds = bounds
	end
end

function Layer:bounds( )
	return self._bounds
end



VA.Layer = Layer

return Layer
