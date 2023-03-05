-- QBCore Exports --

local QBCore = exports['qb-core']:GetCoreObject()

-- Remove Money from Player's Balance to Begin the Heist --
RegisterNetEvent('mk-atmRobbery:server:RemoveMoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney('bank', Config.InitiateHeistFee, 'Forged Black Card')
    Player.Functions.AddItem(Config.ATMKeypadScrambler, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ATMKeypadScrambler], 'add', 1)
end)

-- Add Money to Player's Balance Once Hack is Successful --
RegisterNetEvent('mk-atmRobbery:server:AddMoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local Possibility = Config.LuckyItemPossibility
    local Variation = Config.LuckyItemVariation

    if Possibility == Variation then
        Player.Functions.AddItem(Config.LuckyItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LuckyItem], 'add', 1)
        Player.Functions.AddMoney('cash', Config.RewardMoney, 'ATM withdrawl')
    else
        Player.Functions.AddMoney('cash', Config.RewardMoney, 'ATM withdrawl')
    end
end)

-- Remove Laptop (Life Invader) --
QBCore.Functions.CreateCallback('mk-atmRobbery:server:RemoveLaptop', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local LaptopScan = Player.Functions.GetItemByName(item)
    if LaptopScan then
        cb(true)
        Player.Functions.RemoveItem(Config.LifeInvaderVarHack, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LifeInvaderVarHack], 'remove', 1)
    else
        cb(false)
    end
end)

-- Remove Black Card (ATM) --
QBCore.Functions.CreateCallback('mk-atmRobbery:server:RemoveBlackCard', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BlackCardScan = Player.Functions.GetItemByName(item)
    if BlackCardScan then
        cb(true)
        Player.Functions.RemoveItem(Config.ATMKeypadScrambler, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ATMKeypadScrambler], 'remove', 1)
    else
        cb(false)
    end
end)

-- Police Amount On-Duty --
QBCore.Functions.CreateCallback('mk-atmRobbery:server:PoliceInteger', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayers(src)
    local PoliceInteger = 0

    for i = 1, #Player do
        local xPlayer = QBCore.Functions.GetPlayer(Player[i])
        if (xPlayer.PlayerData.job.name == "police" and xPlayer.PlayerData.job.onduty) then
            PoliceInteger = PoliceInteger + 1
        end
    end

    if PoliceInteger >= Config.RequiredPolice then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', src, ('Not enough police'), 'error')
    end
end)

-- On Resource Start (Console Notification) --
AddEventHandler('onResourceStart', function(resource)
    if (GetCurrentResourceName() ~= resource) then
        return
    end
    print(resource..' started successfully')
end)
