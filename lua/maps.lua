local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
local function bmap(mode, lhs, rhs, opts)
	opts = opts or {}
	vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
end
vim.g.mapleader = ','
if vim.fn.has('win32') then
	-- stupid bug or something
	map('n', '<C-z>', '')
end
-- NOTE: you may be able to use {opts} callback for some of these
-- Though, since a lot of these are lazy-loaded upon their commands, it might be
-- better to leave it like this
-- Keep the mapping more like "pure" vim
map('n', '<F3>', ':JABSOpen<CR>')
map('n', '<F5>', ':Neogit<CR>')
map('n', '<F8>', ':AerialToggle!<CR>')
map('n', '<F9>', ':NoNeckPain<CR>')
map('n', '<F10>', '', {callback=function() require('codewindow').toggle_minimap() end})
map('n', '<tab>', 'za')

return {
	map = map,
	bmap = bmap,
}
