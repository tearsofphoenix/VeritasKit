--
-- Created by IntelliJ IDEA.
-- User: Mac003
-- Date: 14/11/14
-- Time: 下午2:58
-- To change this template use File | Settings | File Templates.
--
local CG = require("CG.Base")

local AffineTransform = {}
local metaAffineTransform = {
    __eq = function(t1, t2)
        return t1.a == t2.a and t1.b == t2.b and t1.c == t2.c
             and t1.d == t2.d and t1.tx == t2.tx and t1.ty == t2.ty
    end,
    __mul = function(t1, t2)
        return AffineTransform.make(t1.a * t2.a + t1.b * t2.c, t1.a * t2.b + t1.b * t2.d,
                                    t1.c * t2.a + t1.d * t2.c, t1.c * t2.b + t1.d * t2.d,
                                    t1.tx * t2.a + t1.ty * t2.c + t2.tx, t1.tx * t2.b + t1.ty * t2.d + t2.ty
                                    )
    end,
    __tostring = function(t)
        return string.format("{%f,%f,%f,%f,%f,%f}", t.a, t.b, t.c, t.d, t.tx, t.ty)
    end,
    translate = function(t, tx, ty)
        return AffineTransform.makeTranslation(tx, ty) * t
    end,
    scale = function(t, sx, sy)
        return AffineTransform.makeScale(sx, sy) * t
    end,
    rotate = function(t, angle)
        return AffineTransform.makeRotation(angle) * t
    end
}

AffineTransform.make = function(a, b, c, d, tx, ty)
    local t = {a=a, b=b, c=c, d=d, tx= tx, ty=ty }
    setmetatable(t, metaAffineTransform)
    return t
end

AffineTransform.makeTranslation = function(tx, ty)
    return AffineTransform.make(1, 0, 0, 1, tx, ty)
end

AffineTransform.makeScale = function(sx, sy)
    return AffineTransform.make(sx, 0, 0, sy, 0, 0)
end

AffineTransform.makeRotation = function(angle)
    local s = math.sin(angle)
    local c = math.cos(angle)
    return AffineTransform.make(c, s, -s, c, 0, 0)
end

AffineTransform.Identity = AffineTransform.make(1, 0, 0, 1, 0, 0)

CG.AffineTransform = AffineTransform

return AffineTransform

