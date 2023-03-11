-- Mechanic Model / Target --
CreateThread(function()
    local model = Config.MechanicModel
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(1000) end

    local Mechanic = CreatePed(0, model, Config.MechanicCoords -1.0, 24.41, 0.0, false, false)
    local ScenarioTable = { 'WORLD_HUMAN_TOURIST_MAP', 'WORLD_HUMAN_STAND_IMPATIENT', 'WORLD_HUMAN_DRUG_DEALER', 'WORLD_HUMAN_JANITOR' }
    local ScenarioRequest = math.random(1, #ScenarioTable)
    FreezeEntityPosition(Mechanic, true)
    SetEntityInvincible(Mechanic, true)
    SetEntityNoCollisionEntity(Mechanic, true)
    TaskStartScenarioInPlace(Mechanic, ScenarioTable[ScenarioRequest], -1, true)
    exports['qb-target']:AddTargetEntity(Mechanic, {
      options = {
        {
          type = 'client',
          event = 'mk-atmRobbery:MechanicFrontPage',
          icon = Config.MechanicIcon,
          label = Config.MechanicLabel
        }
      },
      distance = 2.5,
    })
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
