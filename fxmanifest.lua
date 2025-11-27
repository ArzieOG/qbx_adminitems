fx_version 'cerulean'
game 'gta5'

author 'Arzie'
description 'QBOX Admin Items'
version '1.2.0'

ui_page 'html/index.html'

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}
