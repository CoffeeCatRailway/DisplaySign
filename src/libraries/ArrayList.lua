-- Initialization
local ArrayUtils = require("libraries.ArrayUtils")
local ArrayList = {array = {}}

function ArrayList:new(other)
  local self = {}
  self.__index = self

  if other then
    self.array = ArrayUtils:copy(other)
  else
    self.array = ArrayUtils:initArray(0)
  end

  -- Public methods
  function self:isEmpty()
    -- Check if array is empty
    if self:size() == 0 then
      return true
    end

    local nilCount = 0;
    for i = 1,self:size(),1 do
      if self:get(i) == nil then
        nilCount = nilCount + 1
      end
    end
    return nilCount == self:size()
  end

  function self:add(object)
    -- Add element to array
    self.array = ArrayUtils:copy(self.array, 1)
    self.array[self:size() + 1] = object
  end

  function self:get(index)
    -- Get element in array
    assert(type(index) == "number", "Index '" .. tostring(index) .. "' must be a integer!")
    assert(index >= 1 and index <= self:size(), "Index out of bounds! [" .. tostring(index) .. "," .. tostring(self:size()) .. "]")
    return self.array[index]
  end

  function self:remove(index)
    -- Remove element in array
    assert(type(index) == "number", "Index '" .. tostring(index) .. "' must be a integer!")

    local oldArray = ArrayUtils:copy(self.array)
    local newArray = ArrayUtils:initArray(self:size() - 1)
    for i = 1,self:size() - 1,1 do
      newArray[i] = oldArray[i >= index and i + 1 or i]
    end
    self.array = ArrayUtils:copy(newArray)
  end
  
  function self:set(index, object)
    -- Remove element in array at certain point
    assert(type(index) == "number", "Index '" .. tostring(index) .. "' must be a integer!")
    assert(index >= 1 and index <= self:size(), "Index out of bounds! [" .. tostring(index) .. "," .. tostring(self:size()) .. "]")
    self.array[index] = object
  end

  function self:size()
    -- Get size of self.array
    return #self.array
  end

  return self
end

-- Return
return ArrayList
