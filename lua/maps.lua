local map = require'lib.mapping'.map
local unmap = require'lib.mapping'.del_map

vim.g.mapleader = ','

if vim.fn.has('win32') == 1 then
	-- stupid bug or something
	map('n', '<C-z>', '')
end
-- Better to do plugin maps here or in the spec? In the spec, you can lazy-load
-- on keys, but you can also lazy load on the command.
-- If it makes sense to load on command, then map here. If there aren't default
-- commands to load on, map in the spec
-- NOTE: you may be able to use {opts} callback for some of these
-- Though, since a lot of these are lazy-loaded upon their commands, it might be
-- better to leave it like this
-- Keep the mapping more like "pure" vim
map('n', '<F3>', ':JABSOpen<CR>')
map('n', '<F4>', ':DrexDrawerToggle<CR>')
map('n', '<F5>', ':Neogit<CR>')
map('n', '<F8>', ':AerialToggle!<CR>')
map('n', '<F9>', ':NoNeckPain<CR>')
map('n', '<F10>', '', {callback=function() require('codewindow').toggle_minimap() end})
map('n', '<leader><tab>', 'za')
map('n', 'K', '')
map('n', ';;', ':')
map('n', ';l', ':lua ')
-- since these aren't plugins, we don't need to wrap them in an anonymous
map('n', '<leader>r', '', {callback = require'funcs.makereturn'.toggle})
-- map('n', '<leader>w', 'xph')
map('n', '<leader>w', '', {callback = require'funcs.swapchar'})

-- too lazy to learn how to use maps well
-- unmap('n', 'm')
