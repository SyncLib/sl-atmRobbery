Config = {}

-- Heist Config / Setup --
Config.HeistCooldown = (60000 * 1) -- 60 seconds * minutes
Config.RequiredPolice = 1 -- Required Police on duty

Config.InitiateHeistFee = 2500 -- Money in your bank required to begin the job

Config.LifeInvaderVarHack = 'laptop' -- Required item for Life Invader Var Hack
Config.ATMKeypadScrambler = 'forgedblackcard' -- Required item for ATM Keypad Scrambler Hack

-- Ped Config --
Config.MechanicModel = `mp_m_waremech_01` -- Model of the Mechanic
Config.MechanicCoords = vector3(-1040.25, -238.45, 37.96) -- Vector3 coords for the Mechanic
Config.MechanicIcon = 'fas fa-piggy-bank' -- Icon Target for the Mechanic
Config.MechanicLabel = 'ATM Robbery ($'..Config.InitiateHeistFee..')' -- Label Target for the Mechanic

-- ATM Config / Rewards --
Config.ATMLocations = { -- 8 Random ATM Locations
        vector2(-273.33, -2024.22),
        vector2(289.37, -1256.79),
        vector2(147.49, -1036.13),
        vector2(-30.16, -723.38),
        vector2(-660.65, -854.36),
        vector2(-611.87, -705.46),
        vector2(285.37, 143.04),
        vector2(380.67, 322.87),
}

Config.RewardMoney = math.random(2000, 8000) -- Amount of cash you receive from the ATM

Config.LuckyItem = 'weapon_pistol' -- Lucky Item
Config.LuckyItemPossibility = math.random(1, 3) -- Lucky Item Possibility
Config.LuckyItemVariation = math.random(1, 3) -- Luck Item Variation
