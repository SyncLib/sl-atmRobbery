-- Mechanic's Shop Menu (qb-menu) --
RegisterNetEvent('mk-atmRobbery:MechanicFrontPage', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Suspicious Mechanic',
            icon = 'fas fa-toolbox',
            isMenuHeader = true,
        },
        {
            header = 'Mechanic\'s Store',
            txt = 'Purchase useful tools',
            icon = 'fas fa-cash-register',
            params = {
                event = 'mk-atmRobbery:client:MechanicShopPage',
                args = {}
            }
        },
    })
end)

-- Mechanic's Shop Menu Purchase SubMenu (qb-menu) --
RegisterNetEvent('mk-atmRobbery:client:MechanicShopPage', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Return to main menu',
            icon = 'fas fa-chevron-left',
            params = {
                event = 'mk-atmRobbery:MechanicFrontPage',
                args = {}
            }
        },
        {
            header = 'RFID Disruptor',
            txt = 'Purchase for ($'..Config.RFIDPrice..')',
            icon = 'fas fa-wave-square',
            params = {
                isServer = true,
                event = 'mk-atmRobbery:server:PurchaseDisruptor',
                args = {}
            }
        },
    })
end)

RegisterNetEvent("cdn-syphoning:client:openShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "Syphoning Dealer", Config.SyphoningDealerShop)
end)