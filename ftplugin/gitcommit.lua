local opt = vim.opt_local
-- need to load syntax first; doesn't seem to be affected by putting "syntax on"
-- above "filetype plugin on" in init.vim
vim.cmd('syntax on')
opt.foldmethod = 'syntax'
opt.foldlevel = 1
opt.foldenable = true
-- vim.cmd({
-- 	range = {untrackedline},
-- 	cmd = 'foldclose',
-- })
local function folduntracked()
	local untrackedline = vim.fn.search('^# Untracked files:')
	vim.api.nvim_win_set_cursor(0, {1, 0})
	vim.cmd({
		range = {untrackedline},
		cmd = 'foldclose',
	})
end
folduntracked()
