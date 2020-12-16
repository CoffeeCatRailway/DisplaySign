-- Initialize
local os = require("os")
local component = require("component")

assert(component.isAvailable("filesystem"), "Requires filesystem to run")
local fileSys = require("filesystem")

-- Functions
local function delete(path)
  if fileSys.exists(path) then
    local success, msg = fileSys.remove(path)
    if not success then
      print(msg)
    end
  print("Deleted -> " .. path)
  end
end

-- Run
print("Deleting existing files...")

delete("ListTest.lua")
delete("libraries")

print("Downloading files...")
assert(component.isAvailable("os"), "Requires os to run")
assert(component.isAvailable("internet"), "Requires internet card")
os.execute("wget https://raw.githubusercontent.com/CoffeeCatRailway/displaySign/main/src/ListTest.lua")
os.execute("wget https://raw.githubusercontent.com/CoffeeCatRailway/displaySign/main/src/libraries/List.lua")
os.execute("wget https://raw.githubusercontent.com/CoffeeCatRailway/displaySign/main/src/libraries/ArrayUtils.lua")