local M = {}
-- TODO: make a factory to do make these shortcuts
-- To do this you need to know Lua getattr-type thing
function M.map(mode, lhs, rhs, opts)
	opts = opts or {}
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
function M.del_map(mode, lhs)
	opts = opts or {}
	vim.api.nvim_del_keymap(mode, lhs)
end
function M.bmap(mode, lhs, rhs, opts)
	-- buffer-local map
	opts = opts or {}
	vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
end
function M.del_bmap(mode, lhs)
	-- buffer-local unmap
	vim.api.nvim_buf_del_keymap(0, mode, lhs)
end

local map = M.map
local unmap = M.del_map

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

-- too lazy to learn how to use maps well
-- unmap('n', 'm')

return M
