-- ATM Targeting / Polyzones --

-- Maze Bank Arena ATM --
exports['qb-target']:AddBoxZone('atmRobbery-MazeBankArena-1', vector3(-273.33, -2024.22, 30.15), 1.0, 0.2, {
	name = 'atmRobbery-MazeBankArena-1',
	heading = 70,
	debugPoly = false,
}, {
	options = {
		{
            event = 'mk-atmRobbery:BlackCardScrambler',
			icon = 'fas fa-hdd',
			label = 'Insert Black Card',
			item = 'forgedblackcard',
		},
	},
	distance = 2.5
})

-- Starwberry Gas Station ATM --
exports['qb-target']:AddBoxZone('atmRobbery-GasStation-2', vector3(289.37, -1256.79, 29.44), 1.0, 0.2, {
	name = 'atmRobbery-GasStation-2',
	heading = 0,
	debugPoly = false,
}, {
	options = {
		{
            event = 'mk-atmRobbery:BlackCardScrambler',
			icon = 'fas fa-hdd',
			label = 'Insert Black Card',
			item = 'forgedblackcard',
		},
	},
	distance = 2.5
})

-- Legion Square Fleeca ATM --
exports['qb-target']:AddBoxZone('atmRobbery-Fleeca-3', vector3(147.49, -1036.13, 29.34), 1.0, 0.2, {
	name = 'atmRobbery-Fleeca-3',
	heading = 70,
	debugPoly = false,
}, {
	options = {
		{
            event = 'mk-atmRobbery:BlackCardScrambler',
			icon = 'fas fa-hdd',
			label = 'Insert Black Card',
			item = 'forgedblackcard',
		},
	},
	distance = 2.5
})

-- Union Depository ATM --
exports['qb-target']:AddBoxZone('atmRobbery-Depository-4', vector3(-30.16, -723.38, 44.23), 1.0, 0.2, {
	name = 'atmRobbery-Gas-4',
	heading = 70,
	debugPoly = false,
}, {
	options = {
		{
            event = 'mk-atmRobbery:BlackCardScrambler',
			icon = 'fas fa-hdd',
			label = 'Insert Black Card',
			item = 'forgedblackcard',
		},
	},
	distance = 2.5
})

-- Little Seoul ATM --
exports['qb-target']:AddBoxZone('atmRobbery-LittleSeoul-5', vector3(-660.65, -854.36, 24.48), 1.0, 0.2, {
	name = 'atmRobbery-LittleSeoul-5',
	heading = 70,
	debugPoly = false,
}, {
	options = {
		{
            event = 'mk-atmRobbery:BlackCardScrambler',
			icon = 'fas fa-hdd',
			label = 'Insert Black Card',
			item = 'forgedblackcard',
		},
	},
	distance = 2.5
})

-- Palomino Ave ATM --
exports['qb-target']:AddBoxZone('atmRobbery-PalominoAve-6', vector3(-611.87, -705.46, 31.24), 1.0, 0.2, {
	name = 'atmRobbery-PalominoAve-6',
	heading = 90,
	debugPoly = false,
}, {
	options = {
		{
            event = 'mk-atmRobbery:BlackCardScrambler',
			icon = 'fas fa-hdd',
			label = 'Insert Black Card',
			item = 'forgedblackcard',
		},
	},
	distance = 2.5
})

-- Vinewood Blvd ATM --
exports['qb-target']:AddBoxZone('atmRobbery-VinewoodBlvd-7', vector3(285.37, 143.04, 104.17), 1.0, 0.2, {
	name = 'atmRobbery-VinewoodBlvd-7',
	heading = 250,
	debugPoly = false,
}, {
	options = {
		{
            event = 'mk-atmRobbery:BlackCardScrambler',
			icon = 'fas fa-hdd',
			label = 'Insert Black Card',
			item = 'forgedblackcard',
		},
	},
	distance = 2.5
})

-- Clinton Ave 24/7 ATM --
exports['qb-target']:AddBoxZone('atmRobbery-ClintonAve-8', vector3(380.67, 322.87, 103.57), 0.5, 0.5, {
	name = 'atmRobbery-ClintonAve-8',
	heading = 75,
	debugPoly = false,
}, {
	options = {
		{
            event = 'mk-atmRobbery:BlackCardScrambler',
			icon = 'fas fa-hdd',
			label = 'Insert Black Card',
			item = 'forgedblackcard',
		},
	},
	distance = 2.5
})

-- Ped / Life Invader Targeting --

-- Mechanic Model / Target --
CreateThread(function()
    local model = Config.MechanicModel
    RequestModel(model)
    while not HasModelLoaded(model) do
      Citizen.Wait(0)
    end
    local mechanic = CreatePed(0, model, Config.MechanicCoords -1, 29.79, 0.0, true, false)
    FreezeEntityPosition(mechanic, true)
    SetEntityInvincible(mechanic, true)
    exports['qb-target']:AddTargetEntity(mechanic, {
      options = {
        {
          type = 'client',
          event = 'mk-atmRobbery:MechanicStartJob',
          icon = Config.MechanicIcon,
          label = Config.MechanicLabel
        }
      },
      distance = 2.5,
    })
end)

-- Life Invader Laptop (VAR HACK) --
exports['qb-target']:AddCircleZone('insert_laptop', vector3(-1052.73, -231.15, 43.57), 0.8, { 
  name = 'insert_laptop', 
    }, {
        options = {
        {
          type = 'client',
          event = 'mk-atmRobbery:AdminControlPanel',
          icon = 'fas fa-laptop',
          label = 'Setup Laptop',
          item = 'laptop'
        },
    },
    distance = 2.5
})
