fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Free, open source atm robbery'
author 'Macky'
version '1.2'

server_scripts {
    'server/*.lua',
    '@qb-policejob/main.lua',
}

client_script 'client/*.lua'

shared_script 'config.lua'