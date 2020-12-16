-- Initialization
local List = {size = 1, array = {}, default = nil}

function List:new(size, default)
	local self = {}

	self.size = size or 1
	self.array = {}

	-- Private methods
	local function initArray(diff, default)
		-- Initialize self.array
		self.default = default
		self.array = {}
		local newSize = self.size + diff
		for i = 1,newSize,1 do
			self.array[i] = self.default
		end
		return self.array
	end

	self.array = initArray(0, default or nil)

	-- Public methods
	function self:add(object, forceIn)
		-- Add element to array
		local force = forceIn or true
		local index = 0;

		-- Add if has empty space
		for i = 1,self.size,1 do
			if self.array[i] == nil then
				self.array[i] = object
			end
			index = index + 1
		end

		-- Add element to end of array
		if force and index == self.size then
			local oldArray = self.array
			local newArray = initArray(1, self.default)

			for i = 1,self.size,1 do
				newArray[i] = oldArray[i]
			end

			self.size = self.size + 1
			newArray[self.size] = object
			self.array = newArray
		end
	end

	function self:get(index)
		-- Get element in array
		assert(type(index) == "number", "Index '" .. tostring(index) .. "' must be a integer!")
		assert(index >= 1 or index <= self.size, "Index out of bounds! [1," .. tostring(self.size) .. "]")
		return self.array[index]
	end

	function self:getSize()
		-- Get size of array
		return self.size
	end

	return self
end

-- Return
return List