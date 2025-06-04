fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'squoogs (original resource by vipexv)'
description 'A forced first person with configurable options.'
version '2.6'

client_script 'main.lua'

server_script 'config.lua'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

