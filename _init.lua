local g = {
	mapleader = ',',
	colors_name = 'citruszest',
	loaded_ruby_provider = 0,
	loaded_node_provider = 0,
	netrw_banner = 0,
}
vim.tbl_deep_extend({'force', vim.g, g)

local opts = {
	termguicolors = true,
	backup = true,
	autoindent = true,
	guifont = 'Fairfax Hax HD:h12',
	belloff = 'all',
	number = true,
	relativenumber = true,
	numberwidth = 3,
	nowrap = false,
	scrolloff = 3,
	incsearch = true,
	inccommand = 'nosplit',
	nohlsearch = false,
	ignorecase = true,
	smartcase = true,
	colorcolumn = 80,
	wildmenu = true,
	splitright = true,
	showtabline = 1,
	textwidth = 80,
	termguicolors = true,
	cursorline = true,
	nocursorcolumn = false,
	laststatus = 3,
	rulerformat = '%4(%P%)',
	tabstop = 4,
	shiftwidth = 0,
	softtabstop = -1,
	noexpandtab = false,
	nosmarttab = false,
	backspace = {'indent','eol','start'},
	list = true,
	formatoptions = {t = true, c = true, q = true, n = true},
	iskeyword = {'-', '_'},
	listchars = {trail = '░'}
}
local removes = {
	backupdir = {'.'},
}
vim.tbl_deep_extend({'force'}, vim.opt, opts)
for setting, to_remove in pairs(removes) do
	vim.opt[setting]:remove(to_remove)
