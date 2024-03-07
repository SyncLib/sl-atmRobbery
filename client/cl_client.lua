-- QBCore Exports / Variables --
local QBCore = exports['qb-core']:GetCoreObject()
local RecentRobbery = 0

-- Dispatch Funtion --
local function Dispatch() -- Uncomment either Dispatch System
    TriggerServerEvent('police:server:policeAlert', 'ATM Robbery') -- Default QBCore Dispatch
    -- exports['ps-dispatch']:atmRobbery() -- ps-dispatch
end

-- ATM RFID Disuptor (Scrambler Hack) --
RegisterNetEvent('mk-atmRobbery:UseDisruptor', function()
    local Player = PlayerPedId()
    local Position = GetEntityCoords(Player)
    for i = 1, #Config.ATMProps do
        local atmObject = GetClosestObjectOfType(Position.x, Position.y, Position.z, 1.0, Config.ATMProps[i], false, false, false)
        local atmPos = GetEntityCoords(atmObject)
        local Distance = #(Position - atmPos)

        if Distance < Config.InteractionDistance then
            if RecentRobbery == 0 or GetGameTimer() > RecentRobbery then
                QBCore.Functions.TriggerCallback('mk-atmRobbery:server:PoliceInteger', function(ReturnStatus)
                    if ReturnStatus then
                        QBCore.Functions.TriggerCallback('mk-atmRobbery:server:RemoveDisruptor', function(ItemChecks)
                            if ItemChecks then
                                local drillObject = CreateObject(GetHashKey('hei_prop_heist_drill'), GetEntityCoords(PlayerPedId()), true, false, false)
                                AttachEntityToEntity(drillObject, atmObject, -1, 0.0, -0.2, 2.0, 0.0, 0.0, 0.0, true, true, true, false, 2, true)

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
                                            QBCore.Functions.Progressbar('atm_grabbing_cash', 'Grabbing cash', Config.ProgressBarInteger, false, true, {
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
                                                DeleteEntity(drillObject)
                                                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 1)
                                                TriggerServerEvent('mk-atmRobbery:server:AddMoney')
                                            end)
                                        else
                                            print("fail")
                                            PlaySoundFrontend(-1, "FAILURE", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
                                            ClearPedTasks(PlayerPedId())
                                            DeleteEntity(drillObject)
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
                DeleteEntity(drillObject)
            end
        end
    end
end)