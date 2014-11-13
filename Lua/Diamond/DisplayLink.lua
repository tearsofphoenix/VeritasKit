local VA = require("VA")
local class = require("class")
local NS = require("NS")

local DisplayLink = class:inherit(NS.object, "VA.DisplayLink")

function DisplayLink:displayLinkWithTargetSelector( target, selector )
	local link = self:new()
	link._target = target
	link._selector = selector
	return link
end

function DisplayLink:addToRunLoopForMode( runloop, mode )
	-- TODO
end

function DisplayLink:removeFromRunLoopForMode( runloop, mode )
	-- TODO
end

function DisplayLink:invalidate(  )
	-- TODO
end

function DisplayLink:timestamp(  )
	-- TODO
end

function DisplayLink:duration( )
	-- TODO
end

function DisplayLink:setPaused( paused )
	if self._paused ~= paused then
		self._paused = paused
	end
end

function DisplayLink:isPaused( )
	return self._paused
end

function DisplayLink:setFrameInterval( framInterval )
	if self._framInterval ~= framInterval then
		self._framInterval = framInterval
	end
end

function DisplayLink:framInterval( )
	return self._framInterval
end

VA.DisplayLink = DisplayLink

return DisplayLink