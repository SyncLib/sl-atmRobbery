Config = {}

-- Heist Config / Setup --
Config.HeistCooldown = (60000 * 1) -- 60 seconds * minutes
Config.RequiredPolice = 0 -- Required Police on duty

Config.RFIDPrice = 5000 -- RFID Disruptor Price
Config.ATMRequiredItem = 'rfid_disruptor' -- Required item for the Keypad Scrambler Hack

Config.ProgressBarInteger = 25000 -- Amount of time for all progress bars to complete

-- Ped Config --
Config.MechanicModel = `mp_m_waremech_01` -- Model of the Mechanic
Config.MechanicCoords = vector3(-1369.58, -332.6, 38.97) -- Vector3 coords for the Mechanic
Config.MechanicIcon = 'fas fa-wrench' -- Icon Target for the Mechanic
Config.MechanicLabel = 'Speak to Mechanic' -- Label Target for the Mechanic

-- ATM Config / Rewards --
Config.ATMProps = {
    'prop_atm_01',
	'prop_atm_02',
	'prop_atm_03',
	'prop_fleeca_atm',
}

Config.ATMIcon = 'fas fa-microchip' -- Icon Target for the ATM's
Config.ATMLabel = 'Setup RFID Disruptor' -- Label Target for the ATM's
Config.ATMLabelItem = 'rfid_disruptor' -- Required item for the Label to show on-thrid eye

Config.RewardMoney = math.random(2000, 8000) -- Amount of cash you receive from the ATM

Config.LuckyItem = 'cryptostick' -- Lucky Item Spawncode
Config.LuckyItemPossibility = math.random(1, 3) -- Lucky Item Possibility
Config.LuckyItemVariation = math.random(1, 3) -- Luck Item Variation