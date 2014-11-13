local CG = {}

-- Point

local Point = {}

local metaPoint = {
    __eq = function (p1, p2)
        return p1.x == p2.x and p1.y == p2.y
    end,
    __tostring = function (p)
        return string.format("{%f,%f}", p.x, p.y)
    end
}

Point.make = function (x1, y1)
	local p = {x = x1, y = y1}
	setmetatable(p, metaPoint)
    return p
end

Point.Zero = Point.make(0, 0)

CG.Point = Point

-- Size

local Size = {}
local metaSize = {
    __eq = function (s1, s2)
        return s1.width == s2.width and s1.height == s2.height
    end,
    __tostring = function (s)
        return string.format("{%f, %f}", s.width, s.height)
    end
}

Size.make = function (w, h)
    local s = {width = w, height = h }
    setmetatable(s, metaSize)
    return s
end

Size.Zero = Size.make(0, 0)

CG.Size = Size


-- Rect

local Rect = {}
local metaRect = {
    __eq = function (rect1, rect2)
        return (rect1.origin == rect2.origin
                and rect1.size == rect2.size)
    end,
    __tostring = function(r)
        return string.format("{%s,%s}", tostring(r.origin), tostring(r.size))
    end,
}

Rect.make = function (x, y, w, h)
    local r = {origin = Point.make(x, y), size = Size.make(w, h) }
    setmetatable(r, metaRect)
    return r
end

function Rect:getMinX()
    return self.origin.x
end

Rect.Zero = Rect.make(0, 0, 0, 0)

CG.Rect = Rect

return CG