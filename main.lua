local config = require 'config'

local CreateThread = CreateThread
local Wait = Wait
local SetFollowVehicleCamViewMode = SetFollowVehicleCamViewMode
local IsControlJustPressed = IsControlJustPressed
local IsControlJustReleased = IsControlJustReleased
local GetVehicleClass = GetVehicleClass
local SetFollowPedCamViewMode = SetFollowPedCamViewMode

if config.options.vehicle then
    lib.onCache('vehicle', function(vehicle)
        if not vehicle then return end
        local vehicleClass = GetVehicleClass(vehicle)
        if vehicleClass == 8 or vehicleClass == 13 then return end -- only proceed if vehicle is not a bike
        CreateThread(function()
            while vehicle do
                Wait(1)
                if cache.weapon then                         -- only if player is both in a vehicle and armed do we proceed
                    if IsControlJustPressed(0, 25) then      -- right mouse button pressed
                        SetFollowVehicleCamViewMode(3)
                    elseif IsControlJustReleased(0, 25) then -- right mouse button released
                        SetFollowVehicleCamViewMode(0)
                    end
                end
            end
        end)
    end)
end

if config.options.forcedFirst then
    lib.onCache('weapon', function(weapon)
        if not weapon then return end
        CreateThread(function()
            while weapon do
                Wait(1)
                if IsPlayerFreeAiming(cache.playerId) then -- only if player is aiming do we force them into first person
                    SetFollowPedCamViewMode(3)
                else
                    -- if not aiming, set back to third person
                    SetFollowPedCamViewMode(0)
                end
            end
        end)
    end)
end

if config.options.bike then
    lib.onCache('vehicle', function(vehicle)
        CreateThread(function()
            local vehicleClass = GetVehicleClass(vehicle)
            if vehicleClass ~= 8 and vehicleClass ~= 13 then return end -- early return if vehicle is not a bike
            while vehicle do
                Wait(1)
                if cache.weapon then
                    if IsControlJustPressed(0, 25) then      -- right mouse button pressed
                        SetCamViewModeForContext(2, 3)
                    elseif IsControlJustReleased(0, 25) then -- right mouse button released
                        SetCamViewModeForContext(2, 0)
                    end
                end
            end
        end)
    end)
end