--
-- Created by IntelliJ IDEA.
-- User: Mac003
-- Date: 14/11/14
-- Time: 上午11:53
-- To change this template use File | Settings | File Templates.
--
local NS = {}

NS.NotFound = -1

-- get index of object in array
NS.indexOfObject = function(array, obj)
    for k, v in pairs(array) do
        if v == obj then
            return k
        end
    end

    return NS.NotFound
end

-- insert object at index
NS.insertObjectAtIndex = function(array, obj, idx)
    local len = #array
    local tmpArray = {}
    for i = idx, len  do
        tmpArray[i + 1] = array[i]
    end

    array[idx] = obj

    for k, v in pairs(tmpArray) do
        array[k] = v
    end
end

return NS

