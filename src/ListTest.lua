local List = require("libraries.List")

local function printListContents(list)
  print("-Print list contents-")
  for i = 1,list:size(),1 do
    print(list:get(i))
  end
  print("-")
end

local list = List:new() -- Create new List

list:add(2) -- Add value 2
print("Add 2 to index 1: " .. list:get(1)) -- Get value 2 in first slot

list:add(1) -- Add value 1 to end of array, note: array size is 1
print("Add 1 to index 2: " .. list:get(2)) -- Get value 1 in second slot

list:add(4) -- Add value 4 to end of array again
print("Add 4 to index 3: " .. list:get(3)) -- Get value 4 in third slot

list:add(3) -- Add value 3 to end of array again
print("Add 3 to index 4: " .. list:get(4)) -- Get value 3 in fourth slot

list:set(3, 5)
print("Set index 3 to '5'")

list:remove(2)
print("Remove index 2")
printListContents(list)
