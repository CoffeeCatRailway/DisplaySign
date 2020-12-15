local os = require("os")

os.execute("del List.lua")
os.execute("del main.lua")

print("Downloading files...")
os.execute("wget https://raw.githubusercontent.com/CoffeeCatRailway/displaySign/main/List.lua")
os.execute("wget https://raw.githubusercontent.com/CoffeeCatRailway/displaySign/main/main.lua")