fx_version 'cerulean'
game 'gta5'

author 'larkx (Larkify)'
description 'LX Vehicle Spawner allows users to spawn in vehicles from a menu built in MenuV.'
version '1.0'

client_scripts {
    '@menuv/menuv.lua',
    'client.lua'
}

shared_scripts {
    'config.lua'
}

dependencies {
    'menuv'
}