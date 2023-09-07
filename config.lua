Config = {}

-- Heist Config / Setup --
Config.HeistCooldown = (60000 * 1) -- 60 seconds * minutes
Config.RequiredPolice = 1 -- Required Police on duty

Config.ATMRequiredItem = 'rfid_disruptor' -- Required item for the Keypad Scrambler Hack

Config.ProgressBarInteger = 25000 -- Amount of time for all progress bars to complete

-- Ped Config --
Config.ElectronicsDealerModel = `a_m_y_bevhills_01` -- Model of the Electronics Dealer
Config.ElectronicsDealerCoords = vector3(-1369.58, -332.6, 38.97) -- Vector3 coords for the Electronics Dealer
Config.ElectronicsDealerIcon = 'fas fa-server' -- Icon Target for the Electronics Dealer
Config.ElectronicsDealerLabel = 'Speak to Electronics Dealer' -- Label Target for the Electronics Dealer

-- ATM Config / Rewards --
Config.ATMProps = {
    'prop_atm_01',
	'prop_atm_02',
	'prop_atm_03',
	'prop_fleeca_atm',
}

Config.ElectronicsDealerShop = {
    label = "Electronics Dealer",
    slots = 1,
    items = {
        [1] = {
            name = "rfid_disruptor",
            price = 2500,
            amount = 5,
            type = "item",
            slot = 1,
        },
    }
}

Config.ATMIcon = 'fas fa-microchip' -- Icon Target for the ATM's
Config.ATMLabel = 'Setup RFID Disruptor' -- Label Target for the ATM's
Config.ATMLabelItem = 'rfid_disruptor' -- Required item for the Label to show on-thrid eye

Config.RewardMoney = math.random(2000, 6000) -- Amount of cash you receive from the ATM

Config.ScramblerHackType = 'alphanumeric' -- (alphabet, numeric, alphanumeric, greek, braille, runes)

Config.LuckyItem = 'cryptostick' -- Lucky Item Spawncode
Config.LuckyItemPossibility = math.random(1, 3) -- Lucky Item Possibility
Config.LuckyItemVariation = math.random(1, 3) -- Luck Item Variation