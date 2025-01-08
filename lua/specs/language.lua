-- filetype-specific plugins
local iswindows = require'lib.iswindows'
return {
	{
		'emmanueltouzery/decisive.nvim',
		cond = false,
		ft = 'csv',
		setup = 'true',
	},
	{
		'hat0uma/csvview.nvim',
		ft = 'csv',
		config = true,
	},
	{
		'vim-scripts/indentpython.vim',
		ft = 'python',
		cond = false,
	},
	{
		'vim-scripts/Windows-Powershell-Syntax-Plugin',
		ft = 'ps1',
		cond = iswindows,
	},
	{
		'cespare/vim-toml',
		ft = 'toml',
	},
	{
		'm42e/trace32-practice.vim',
		ft = 'practice',
		cond = iswindows,
	},
	{
		'pedrohdz/vim-yaml-folds',
		ft = 'yaml',
	},
	{
		'rhysd/vim-fixjson',
		ft = 'json',
		config = function()
			vim.g.fixjson_fix_on_save = 0
		end,
	},
	{ 'sirtaj/vim-openscad' },
	{
		'luisjure/csound-vim',
		ft = 'csd',
	},
	{
		'hylang/vim-hy',
		ft = 'hy',
	},
}
