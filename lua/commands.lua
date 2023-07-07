-- miscellaneous collection of custom commands
local api = vim.api

scripts = require('scriptutils')
api.nvim_create_user_command('SheBang', scripts.write_shebang, {nargs='?'} )
api.nvim_create_user_command( 'PyScript', scripts.pyscript, {} )
