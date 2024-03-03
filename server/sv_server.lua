-- QBCore Exports --
local QBCore = exports['qb-core']:GetCoreObject()

-- Add Money to Player's Balance Once Hack is Successful / Un-Successful --
RegisterNetEvent('mk-atmRobbery:server:AddMoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local Possibility = Config.LuckyItemPossibility
    local Variation = Config.LuckyItemVariation

    --if Possibility == Variation then
        Player.Functions.AddItem(Config.LuckyItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LuckyItem], 'add', 1)
        Player.Functions.AddMoney('cash', Config.RewardMoney, 'ATM withdrawl')
    --else
        --Player.Functions.AddMoney('cash', Config.RewardMoney, 'ATM withdrawl')
    --end
end)

-- Remove RFID Disruptor on-third eye of an ATM --
QBCore.Functions.CreateCallback('mk-atmRobbery:server:RemoveDisruptor', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DisruptorScan = Player.Functions.GetItemByName(item)
    if DisruptorScan then
        cb(true)
        Player.Functions.RemoveItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', 1)
    else
        cb(false)
    end
end)

-- Police Amount On-Duty --
QBCore.Functions.CreateCallback('mk-atmRobbery:server:PoliceInteger', function(source, cb)
    local src = source
    local copsOnDuty = 0

    local Players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(Players) do
        if v and v.PlayerData.job.type == 'leo' and v.PlayerData.job.onduty then
            copsOnDuty += 1
        end
    end
    copsOnDuty = copsOnDuty

    if copsOnDuty >= Config.RequiredPolice then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', src, ('Not enough police'), 'error')
    end
end)