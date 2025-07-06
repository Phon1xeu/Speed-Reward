local lastGiven = 0

CreateThread(function()
    while true do
        Wait(500)

        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(veh, -1) == ped then
                local speed = GetEntitySpeed(veh) * 3.6
                if speed >= Config.MinimumSpeed then
                    local currentTime = GetGameTimer()
                    if currentTime - lastGiven >= Config.Interval then
                        lastGiven = currentTime
                        local vehNetId = VehToNet(veh)
                        TriggerServerEvent('speedReward:giveItem', speed, currentTime, vehNetId)
                    end
                end
            end
        end
    end
end)
