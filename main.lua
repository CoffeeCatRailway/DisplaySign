local List = require("List")

local newList = List:new(1, 0) -- Create new List
newList:add(2) -- Add value 2
print(newList:get(1)) -- Get value 2 in first slot

newList:add(3) -- Add value 3 to end of array, note: array size is 1
print(newList:get(2)) -- Get value 3 in second slot
