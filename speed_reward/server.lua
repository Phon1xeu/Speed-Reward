RegisterServerEvent('speedReward:giveItem', function(speed, clientTime, netVeh)
    local src = source
    local ped = GetPlayerPed(src)

    if not IsPedInAnyVehicle(ped, false) then
        DropPlayer(src, '[Anti-Trigger] Attempted to trigger reward while not in vehicle.')
        return
    end

    local veh = GetVehiclePedIsIn(ped, false)

    if GetPedInVehicleSeat(veh, -1) ~= ped then
        DropPlayer(src, '[Anti-Trigger] Attempted to trigger reward while not driving.')
        return
    end

    local currentSpeed = GetEntitySpeed(veh) * 3.6
    if math.floor(currentSpeed) < Config.MinimumSpeed then
        DropPlayer(src, '[Anti-Trigger] Attempted to fake speed reward below allowed limit.')
        return
    end

    local serverTime = GetGameTimer()
    if math.abs(serverTime - clientTime) > Config.Interval + 250 then
        DropPlayer(src, '[Anti-Trigger] Reward triggered outside allowed timing.')
        return
    end

    exports.ox_inventory:AddItem(src, Config.RewardItem, Config.Quantity)
end)
