fx_version 'cerulean'
lua54 'yes'
game "gta5"

author "OK1ez"
description "MDT FOR PROJECT NXT"
version '1.0.0'

ui_page 'http://localhost:5173/'
-- ui_page 'html/index.html'

client_script "client/**/*"

server_script {
  '@oxmysql/lib/MySQL.lua',
  "server/**/*"
}

shared_script {
  '@ox_lib/init.lua',
  "shared/config.lua",
}

files {
  'locales/*.json',
  'html/**',
}

data_file 'DLC_ITYP_REQUEST' 'stream/prop_mdt_tablet.ytyp'

ox_lib 'locale'