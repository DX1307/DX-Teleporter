fx_version 'adamant'

game 'gta5'

description 'Easy marker teleporter | Horst'

version '1.0'


lua54 'yes'
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
 
  '@es_extended/locale.lua',
  'client.lua',

}

server_scripts {
  'server.lua'
}