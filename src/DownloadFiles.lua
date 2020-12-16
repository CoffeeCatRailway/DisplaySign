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
  print("Making directory -> " .. path)
  os.execute("mkdir " .. path)
end

local function download(path, saveTo)
  local url = "wget https://raw.githubusercontent.com/CoffeeCatRailway/DisplaySign/main/src/"
  if saveTo == nil then
    print("Downloading -> '" .. path .. "'")
    os.execute(url .. path)
  else
    print("Downloading -> '" .. path .. "' to '" .. saveTo .. "'")
    local segments = filesystem.segments(saveTo)
    segments[#segments] = nil
    local saveToDirectory = segments[1]
    mkdir(saveToDirectory)

    if #segments > 1 then
      for i = 2,#segments,1 do
        saveToDirectory = saveToDirectory .. "/" .. segments[i]
        if not filesystem.exists(saveToDirectory) then
          mkdir(saveToDirectory)
        end
      end
    end

    os.execute(url .. path .. " " .. saveTo)
  end
end

-- Run
print("Deleting existing files...")

delete("ListTest.lua")
delete("libraries")

print("Downloading files...")
assert(component.isAvailable("internet"), "Requires internet card")
download("ListTest.lua")
download("libraries/List.lua libraries/List.lua")
download("libraries/ArrayUtils.lua libraries/ArrayUtils.lua")
