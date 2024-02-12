MenuConfig = {}

MenuConfig.General = {
    menuOpenKey = 'F5', -- What key should open the menu?
    showReplaceVehicleCheckbox = true, -- Should users be given the option to replace vehicles?
    defaultReplaceVehicleCheckboxValue = true, -- What should the default value be for replace vehicles?
    showSpawnCodeInDescription = true, -- Should it show the spawn code in the description?
}

MenuConfig.Vehicles = {
    ["LEO"] = { -- Category name
        icon = "🚔", -- Leave blank for no category icon.
        vehicles = { -- Display names and spawncodes of each vehicle in the category.
            { 
                name = "Cruiser", -- The name of the vehicle you will see in the menu
                spawncode = "police", -- The spawncode of the vehicle
                livery = 1, -- The livery you wish to have applied when spawning the vehicle
                extras = {1}, -- Extras you want enabled when spawning the vehicle
                defaultFuel = 100.0, -- Default fuel for vehicle when spawned (Must end with a decimal)
            },
            { 
                name = "Unmarked Cruiser", -- The name of the vehicle you will see in the menu
                spawncode = "police4", -- The spawncode of the vehicle
                livery = 1, -- The livery you wish to have applied when spawning the vehicle
                extras = {1,2}, -- Extras you want enabled when spawning the vehicle
                defaultFuel = 80.0, -- Default fuel for vehicle when spawned (Must end with a decimal)
            },
            { 
                name = "Unmarked Cruiser", -- The name of the vehicle you will see in the menu
                spawncode = "police4", -- The spawncode of the vehicle
                livery = 1, -- The livery you wish to have applied when spawning the vehicle
                extras = {1,2,3}, -- Extras you want enabled when spawning the vehicle
                defaultFuel = 60.0, -- Default fuel for vehicle when spawned (Must end with a decimal)
            },
        }
    },
    ["SAFR"] = { -- Category name
        icon = "🚒", -- Leave blank for no category icon.
        vehicles = { -- Display names and spawncodes of each vehicle in the category.
            { 
                name = "Firetruck", -- The name of the vehicle you will see in the menu
                spawncode = "firetruk", -- The spawncode of the vehicle
                livery = 1, -- The livery you wish to have applied when spawning the vehicle
                extras = {1,2,3,4}, -- Extras you want enabled when spawning the vehicle
                defaultFuel = 60.0, -- Default fuel for vehicle when spawned (Must end with a decimal)
            },
        }
    }
}
