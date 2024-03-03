<br />
  <h3 align="center">ATM ROBBERY</h3>

  <p align="center">
    Free, open source atm robbery using the QBCore Framework
    <br />
    <br />
    <a href="https://youtu.be/MQqkcDOHATU">Showcase</a>
  </p>
</p>

## Prerequisites

* [QBCore Framework](https://github.com/qbcore-framework)
* [ps-ui](https://github.com/Project-Sloth/ps-ui)
* [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch) (optional `cl_client.lua`)

## Installation

* Download ZIP
* Drag and drop into `[standalone]` remove `-main` from file name
* Restart your server

## qb-core > shared > items.lua
```lua
    rfid_disruptor               = { name = 'rfid_disruptor', label = 'RFID Disruptor', weight = 2000, type = 'item', image = 'rfid_disruptor.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'A Disruptor used to breach ATM firewalls' },
```

## ps-dispatch > client > alerts.lua
```lua
local function atmRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = locale('atmrobbery'),
        codeName = 'signrobbery',
        code = '10-10',
        icon = 'fab fa-artstation',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'leo'}
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('atmRobbery', atmRobbery)
```

## ps-dispatch > shared > config.lua
```lua
    ['atmrobbery'] = {
        radius = 0,
        sprite = 427,
        color = 26,
        scale = 1.5,
        length = 2,
        sound = 'robberysound',
        offset = false,
        flash = false
    },
```

## ps-dispatch > locales > en.json
```lua
  "atmrobbery": "ATM Robbery",
```
