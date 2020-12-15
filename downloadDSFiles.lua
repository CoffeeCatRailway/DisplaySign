local os = require("os")

os.execute("del List.lua")
os.execute("del main.lua")

print("Downloading files...")
os.execute("wget https://github.com/CoffeeCatRailway/displaySign/blob/main/List.lua")
os.execute("wget https://github.com/CoffeeCatRailway/displaySign/blob/main/main.lua")