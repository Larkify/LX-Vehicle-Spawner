vehicleConfigTable = {}

local function handleVehicleSpawn(spawncode, replaceVehicle)
    RequestModel(spawncode)

    while not HasModelLoaded(spawncode) and IsModelInCdimage(spawncode) do
        Citizen.Wait(500)
    end

    if not IsModelInCdimage(spawncode) then
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringPlayerName("~r~Error: ~s~The vehicle could not be found, please check the spawn code.")
        EndTextCommandThefeedPostTicker(true, true)
        return
    end

    local playerPed = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(playerPed))
    local heading = GetEntityHeading(playerPed)
    
    if replaceVehicle then
        if IsPedInAnyVehicle(playerPed, true) then
            local currentVehicle = GetVehiclePedIsIn(playerPed, false)
            SetEntityAsMissionEntity(currentVehicle, true, true);  
            DeleteVehicle(currentVehicle)
            vehicle = CreateVehicle(spawncode, x + 4, y, z, heading, false, false)
        else
            vehicle = CreateVehicle(spawncode, x + 4, y, z, heading, false, false)
        end
    else
        vehicle = CreateVehicle(spawncode, x + 4, y, z, heading, false, false)
    end

    for i,v in pairs(vehicleConfigTable) do 
        if v.spawncode == spawncode then 
            SetVehicleLivery(vehicle, v.livery)
            SetVehicleFuelLevel(vehicle, v.defaultFuel)
            for _, extra in ipairs(v.extras) do 
                SetVehicleExtra(vehicle, extra, false)
            end
        end
    end

    SetVehicleAsNoLongerNeeded(vehicle)
    SetPedIntoVehicle(playerPed, vehicle, -1)
end

local mainMenu = MenuV:CreateMenu('LX Vehicle Spawner', 'Vehicle Categories', 'topright', 255, 0, 0, 'size-125', nil, 'menuv', 'main_menu', 'native')

local replaceVehicle;
if MenuConfig.General.showReplaceVehicleCheckbox then
    replaceVehicle = mainMenu:AddCheckbox({ label = 'Replace Vehicle', value = MenuConfig.General.defaultReplaceVehicleCheckboxValue })
end

local subMenu_index = 0
local vehicleSpawnButtons = {}

-- Collect the category names in the order they appear
local orderedCategories = {}
for categoryName in pairs(MenuConfig.Vehicles) do
    table.insert(orderedCategories, categoryName)
end

-- Sort the categories if necessary
table.sort(orderedCategories)

-- Create sub-menus and buttons
for _, categoryName in ipairs(orderedCategories) do
    subMenu_index = subMenu_index + 1
    local categoryInfo = MenuConfig.Vehicles[categoryName]
    local subMenu = MenuV:CreateMenu(categoryName, categoryName .. ' vehicles', 'topright', 255, 0, 0, 'size-125', nil, 'menuv', 'sub_menu_' .. subMenu_index, 'native')
    mainMenu:AddButton({ icon = categoryInfo.icon, label = categoryName, value = subMenu, description = 'View ' .. categoryName .. ' vehicles' })
    for _, vehicle in ipairs(categoryInfo.vehicles) do
        if MenuConfig.General.showSpawnCodeInDescription == true then 
            vehicleSpawnBtn = subMenu:AddButton({ icon = nil, label = vehicle.name, value = vehicle.spawncode, description = "Spawncode: " .. vehicle.spawncode })
        else
            vehicleSpawnBtn = subMenu:AddButton({ icon = nil, label = vehicle.name, value = vehicle.spawncode, description = "Press enter to spawn the vehicle selected"})
        end
        table.insert(vehicleSpawnButtons, vehicleSpawnBtn)

        vehicleConfigTable[vehicle.name] = {
            spawncode = vehicle.spawncode,
            livery = vehicle.livery,
            extras = vehicle.extras,
            defaultFuel = vehicle.defaultFuel
        }
        
    end
end

-- Register event handlers for buttons
for _, button in ipairs(vehicleSpawnButtons) do
    button:On('select', function(item)
        local replaceVeh;
        if not replaceVehicle then
            replaceVeh = MenuConfig.General.defaultReplaceVehicleCheckboxValue
        else
            replaceVeh = replaceVehicle.Value
        end

        handleVehicleSpawn(item.Value, replaceVeh)
    end)
end

-- Trigger to open the menu.
mainMenu:OpenWith('keyboard', MenuConfig.General.menuOpenKey)
