--
-- Created by IntelliJ IDEA.
-- User: veritas
-- Date: 14/11/14
-- Time: 下午11:14
-- To change this template use File | Settings | File Templates.
--
local CG = require("CG.Base")

local Color = {}
local ColorMeta = {
    name = "Color",
    __call = function(r, g, b, a)
        if type(r) == "table" then
            return Color.make(r.r, r.g, r.b, r.a)
        else
            return Color.make(r, g, b, a)
        end
    end
}

setmetatable(Color, ColorMeta)

function Color:make(r, g, b, a)
    local color = {red = r, green = g, blue = b, alpha = a}
    return color
end

CG.Color = Color

return Color


