-- Initialization
local ArrayUtils = {}

function ArrayUtils:initArray(size, defaultIn)
  -- Initialize array
  local default = defaultIn or nil
  local array = {}
  for i = 1,size,1 do
    array[i] = default
  end
  return array
end

function ArrayUtils:copy(toCopy, sizeDiffIn)
  assert(type(toCopy) == "table", "Object to copy must be type 'table'!")
  local sizeDiff = sizeDiffIn or 0
  assert(type(sizeDiff) == "number", "Size difference must be a number")
  
  local size = #toCopy + sizeDiff
  local newArray = ArrayUtils:initArray(size)
  
  for i = 1,size,1 do
    newArray[i] = toCopy[i]
  end
  return newArray
end

-- Return
return ArrayUtils
