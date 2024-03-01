-- QBCore Exports / Variables --
local QBCore = exports['qb-core']:GetCoreObject()
local RecentRobbery = 0, 0, 0

-- ATM RFID Disuptor (Scrambler Hack) --
RegisterNetEvent('mk-atmRobbery:UseDisruptor', function()
    if RecentRobbery == 0 or GetGameTimer() > RecentRobbery then
        QBCore.Functions.TriggerCallback('mk-atmRobbery:server:PoliceInteger', function(ReturnStatus)
            if ReturnStatus then
                QBCore.Functions.TriggerCallback('mk-atmRobbery:server:RemoveDisruptor', function(ItemChecks)
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
                            atmRobbery()
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
                                        TriggerServerEvent('mk-atmRobbery:server:AddMoney')
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

-- ATM Robbery Disptach Notification (ps-dispatch) --
function Dispatch()
    exports['ps-dispatch']:ATMRobbery()
end