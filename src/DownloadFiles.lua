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
    end
    print("Deleted -> " .. path)
  end
end

local function mkdir(path)
  if not filesystem.exists(path) then
    print("Making directory -> " .. path)
    os.execute("mkdir " .. path)
  end
end

local function download(path, saveTo)
  local url = "wget https://raw.githubusercontent.com/CoffeeCatRailway/DisplaySign/main/src/"
  if saveTo == nil then
    print("Downloading -> '" .. path .. "'")
    os.execute(url .. path)
  else
    print("Downloading -> '" .. path .. "' to '" .. saveTo .. "'")
    local segments = filesystem.segments(saveTo)
    segments[#segments] = ""
    local saveToDirectory = segments[1]
    mkdir(saveToDirectory)

    if #segments > 1 then
      for i = 2,#segments,1 do
        saveToDirectory = saveToDirectory .. "/" .. segments[i]
        mkdir(saveToDirectory)
      end
    end

    os.execute(url .. path .. " " .. saveTo)
  end
end

-- Run
print("Deleting existing files...")
delete("ListTest.lua")
delete("libraries")
print("All existing files deleted!")

print("Downloading files...")
assert(component.isAvailable("internet"), "Requires internet card")
download("ListTest.lua")
download("libraries/List.lua", "libraries/List.lua")
download("libraries/ArrayUtils.lua", "libraries/ArrayUtils.lua")
print("All files downloaded!")

local args = {...}
if #args > 0 then
  print("Starting " .. args[1] .. "...")
  os.execute(args[1])
end
