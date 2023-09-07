-- Electronics Dealer Model / Target --
CreateThread(function()
    local model = Config.ElectronicsDealerModel
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(1000) end

    local ElectronicsDealer = CreatePed(0, model, Config.ElectronicsDealerCoords -1.0, 24.41, 0.0, false, false)

    -- Define a list of possible scenarios --
    local ScenarioTable = { 
        'WORLD_HUMAN_TOURIST_MAP',
        'WORLD_HUMAN_STAND_IMPATIENT',
        'WORLD_HUMAN_DRUG_DEALER',
        'WORLD_HUMAN_JANITOR'
    }
    local ScenarioRequest = math.random(1, #ScenarioTable)

    FreezeEntityPosition(ElectronicsDealer, true)
    SetEntityInvincible(ElectronicsDealer, true)
    SetEntityNoCollisionEntity(ElectronicsDealer, true)
    TaskStartScenarioInPlace(ElectronicsDealer, ScenarioTable[ScenarioRequest], -1, true)

    -- Add qb-target to ElectronicsDealer Ped --
    exports['qb-target']:AddTargetEntity(ElectronicsDealer, {
        options = {
        {
            type = 'client',
            event = 'mk-atmRobbery:client:ElectronicsMenu',
            icon = Config.ElectronicsDealerIcon,
            label = Config.ElectronicsDealerLabel
        }
        },
        distance = 2.5,
    })
end)

-- Electronics Dealer Menu (qb-menu) --
RegisterNetEvent('mk-atmRobbery:client:ElectronicsMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Electronics Dealer',
            icon = 'fas fa-server',
            isMenuHeader = true,
        },
        {
            header = 'Electronics Store',
            txt = 'Purchase useful electronics',
            icon = 'fas fa-cash-register',
            params = {
                event = 'mk-atmRobbery:client:openShop',
                args = {}
            }
        },
    })
end)

RegisterNetEvent('mk-atmRobbery:client:openShop', function()
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'Electronics Dealer', Config.ElectronicsDealerShop)
end)

-- RFID Disruptor (SCRAMBLER HACK) --
exports['qb-target']:AddTargetModel(Config.ATMProps,  {
	options = {
		{
		type = 'client',
		event = 'mk-atmRobbery:UseDisruptor',
		icon = Config.ATMIcon,
		label = Config.ATMLabel,
		item = Config.ATMLabelItem,
		},
	},
	distance = 2.5,
})