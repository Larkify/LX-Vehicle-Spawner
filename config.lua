MenuConfig = {}

MenuConfig.General = {
    menuOpenKey = 'F5', -- What key should open the menu?
    showReplaceVehicleCheckbox = true, -- Should users be given the option to replace vehicles?
    defaultReplaceVehicleCheckboxValue = true -- What should the default value be for replace vehicles?
}

MenuConfig.Vehicles = {
    ["LEO"] = { -- Category name
        icon = "🚔", -- Leave blank for no category icon.
        vehicles = { -- Display names and spawncodes of each vehicle in the category.
            { name = "Cruiser", spawncode = "police" },
            { name = "Unmarked Cruiser", spawncode = "police4" },
            { name = "Bike", spawncode = "policeb" },
        }
    },
    ["SAFR"] = { -- Category name
        icon = "🚒", -- Leave blank for no category icon.
        vehicles = { -- Display names and spawncodes of each vehicle in the category.
            { name = "Firetruck", spawncode = "firetruk" }, -- Title and spawncode for category items.
        }
    }
}