
--[[ VA Test

local VA = require("VA.framework")
local NS = require("NS.framework")

local VALayer = VA.Layer
local l = VALayer:new()
print(l)

local dump = function(t)

    print("table: len:", #t)

    for k, v in pairs(t) do
        print(k, v)
    end

    print("--------------------\n")
end
local var = {1, 3, 5, 7, 9 }

dump(var)

NS.insertObjectAtIndex(var, "a", 2)

dump(var)


--]]

---[[ CG Test
local CG = require("CG.framework")

local m = CG.AffineTransform.make(1, 2, 3, 4, 5, 6)
print(m)

local i = CG.AffineTransform.Identity
print(i)

local c = m * i
print("c:", c)
c = i * m
print("c:", c)

assert(c == m)

c = m * m
print(c)
c = CG.AffineTransform.makeRotation(math.pi)
print(c)

--]]