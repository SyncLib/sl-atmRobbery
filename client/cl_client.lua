-- QBCore Exports / Variables --
local QBCore = exports['qb-core']:GetCoreObject()
local RecentRobbery = 0

-- Dispatch Funtion --
local function Dispatch() -- Uncomment either Dispatch System
    TriggerServerEvent('police:server:policeAlert', 'ATM Robbery') -- Default QBCore Dispatch
    -- exports['ps-dispatch']:atmRobbery() -- ps-dispatch
end

-- ATM RFID Disuptor (Scrambler Hack) --
RegisterNetEvent('sl-atmRobbery:UseDisruptor', function()
    if RecentRobbery == 0 or GetGameTimer() > RecentRobbery then
        QBCore.Functions.TriggerCallback('sl-atmRobbery:server:PoliceInteger', function(ReturnStatus)
            if ReturnStatus then
                QBCore.Functions.TriggerCallback('sl-atmRobbery:server:RemoveDisruptor', function(ItemChecks)
                    if ItemChecks then
                        QBCore.Functions.Progressbar('atm_connecting_disruptor', 'Plugging in disruptor', Config.ProgressBarInteger, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                        animDict = 'anim@gangops@facility@servers@',
                            anim = 'hotwire',
                            flags = 49,
                        }, {}, {}, function()
                            ClearPedTasks(PlayerPedId())
                            Dispatch()
                            RecentRobbery = GetGameTimer() + Config.HeistCooldown
                            exports['ps-ui']:Scrambler(function(success)
                                if success then
                                    print("success")
                                    QBCore.Functions.Progressbar('atm_grabing_cash', 'Grabing cash', Config.ProgressBarInteger, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                    animDict = 'oddjobs@shop_robbery@rob_till',
                                        anim = 'loop',
                                        flags = 17,
                                    }, {}, {}, function()
                                        ClearPedTasks(PlayerPedId())
                                        TriggerServerEvent('sl-atmRobbery:server:AddMoney')
                                    end)
                                else
                                    print("fail")
                                    QBCore.Functions.Notify('Pin incorrect', 'error' , 5000)
                                end
                            end, Config.ScramblerHackType, 30, 0) -- Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
                        end)
                    end
                end, Config.ATMRequiredItem)
            end
        end)
    else
        QBCore.Functions.Notify('Firewall breach detected, come back later', 'error' , 5000)
    end
end)