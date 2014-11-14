require("VALayer")
local CG = require("CG")
local Rect = CG.Rect

local r1 = Rect.make(1, 1, 2, 2)
local r2 = Rect.make(1, 1, 2, 2)

print(r1.origin.x, r1.origin.y)

---[[
if r1 == r2 then
    print("Equal!", r1)
else
    assert("Error")
end

local r3 = Rect:make(1, 2, 2, 3)

assert(r1 ~= r3)
--]]