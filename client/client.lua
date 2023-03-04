-- QBCore Exports / Variables --

local QBCore = exports['qb-core']:GetCoreObject()

local RecentRobbery = 0, 0, 0
local JobInstance = false
local LifeInvaderInstance = false

-- Initial Heist Setup --
RegisterNetEvent('mk-atmRobbery:MechanicStartJob', function()
    QBCore.Functions.TriggerCallback('mk-atmRobbery:server:PoliceInteger', function(ReturnStatus)
        if ReturnStatus then
            if RecentRobbery == 0 or GetGameTimer() > RecentRobbery then
                TriggerServerEvent('mk-atmRobbery:server:RemoveMoney')
                QBCore.Functions.Notify('Locate the Manager\'s Office, connect your laptop and fill this card out', 'success' , 5000)
                RecentRobbery = GetGameTimer() + Config.HeistCooldown
                JobInstance = true
            else
                QBCore.Functions.Notify('I have no jobs available', 'error' , 5000)
            end
        end
    end)
end)

-- Life Invader Laptop (Var Hack) --
RegisterNetEvent('mk-atmRobbery:AdminControlPanel', function()
    if (JobInstance == true) then
        QBCore.Functions.TriggerCallback('mk-atmRobbery:server:RemoveLaptop', function(CheckItem)
            if CheckItem then
                QBCore.Functions.Progressbar('admin_credentials', 'Typing in admin credentials', 15000, false, true, {
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
                    JobInstance = false
                    exports['ps-ui']:VarHack(function(success)
                        if success then
                            TriggerEvent('mk-atmRobbery:LifeInvaderPing')
                        else
                            QBCore.Functions.Notify('Database breach failed', 'error' , 5000)
                        end
                    end, 5, 3) -- (Number of Blocks), Time (Seconds)
                end)
            else
                QBCore.Functions.Notify('Laptop required', 'error' , 5000)
            end
        end, Config.LifeInvaderVarHack)
    else
        QBCore.Functions.Notify('Speak with the mechanic to begin this robbery', 'error' , 5000)
    end
end)

-- Random ATM Location (1-8)
RegisterNetEvent('mk-atmRobbery:LifeInvaderPing', function()
    QBCore.Functions.Notify('Location pinged, on arrival insert your Black Card', 'success' , 5000)
    local IndexLocation = math.random(1, #Config.ATMLocations)
    local WaypointMarker = Config.ATMLocations[IndexLocation]
    Citizen.Wait(1000)

    SetNewWaypoint(WaypointMarker)
    LifeInvaderInstance = true
end)

-- ATM Black Card (Scrambler Hack) --
RegisterNetEvent('mk-atmRobbery:BlackCardScrambler', function()
    if (LifeInvaderInstance == true) then
        QBCore.Functions.TriggerCallback('mk-atmRobbery:server:RemoveBlackCard', function(CheckItem)
            if CheckItem then
                QBCore.Functions.Progressbar('atm_connecting_database', 'Inserting Black Card', 15000, false, true, {
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
                    LifeInvaderInstance = false
                    exports['ps-ui']:Scrambler(function(success)
                        if success then
                            QBCore.Functions.Progressbar('atm_grabing_cash', 'Grabing dispensed cash', 10000, false, true, {
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
                            QBCore.Functions.Notify('Pin incorrect', 'error' , 5000)
                        end
                    end, 'alphanumeric', 30, 0) -- (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
                end)
            else
                QBCore.Functions.Notify('Black card required', 'error' , 5000)
            end
        end, Config.ATMKeypadScrambler)
    else
        QBCore.Functions.Notify('Speak with the mechanic to begin this robbery', 'error' , 5000)
    end
end)

-- ATM Robbery Disptach Notification (ps-dispatch) --
function Dispatch()
    exports['ps-dispatch']:ATMRobbery()
end