-- Initialize
local os = require("os")
local component = require("component")

assert(component.isAvailable("filesystem"), "Requires filesystem to run")
local filesystem = require("filesystem")


-- Functions
local function delete(path)
  if filesystem.exists(path) then
    local success, msg = filesystem.remove(path)
    if not success then
      print(msg)
    else
      print("Deleted existing -> " .. path)
    end
  end
end

local function mkdir(path)
  delete(path)
  if not filesystem.exists(path) then
    print("Making directory -> " .. path)
    os.execute("mkdir " .. path)
  end
end

local function download(path)
  delete(path)
  local url = "wget https://raw.githubusercontent.com/CoffeeCatRailway/DisplaySign/main/src/"
  
  print("Downloading -> '" .. path .. "'")
  local segments = filesystem.segments(path)
  segments[#segments] = ""
  local saveToDirectory = segments[1] .. "/"
  mkdir(saveToDirectory)

  if #segments > 2 then
    for i = 2,#segments,1 do
      saveToDirectory = saveToDirectory .. segments[i] .. "/"
      mkdir(saveToDirectory)
    end
  end

  os.execute(url .. path .. " " .. path)
end

-- Run
print("Downloading files...")
assert(component.isAvailable("internet"), "Requires internet card")
download("ListTest.lua")
download("libraries/List.lua")
download("libraries/ArrayUtils.lua")
print("All files downloaded!")

local args = {...}
if #args > 0 then
  print("Starting " .. args[1] .. "...")
  os.execute(args[1])
end
