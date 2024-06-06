-- filetype-specific plugins
local iswindows = require'lib.iswindows'
return {
	{
		'chrisbra/csv.vim',
		cond = false,
		ft = 'csv',
		init = function()
			local api = vim.api
			local g = vim.g
			g.csv_no_conceal = nil
			g.csv_highlight_column = nil
			g.csv_hiGroup = 'TabLineFill'
			for group, tolink in pairs{
				CSVColumnOdd = 'Normal',
				CSVColumnEven = 'Character',
				CSVDelimiter = 'Comment',
			} do
				api.nvim_set_hl(0, group, {link=tolink})
			end
			local csvarrange = api.nvim_create_augroup('CSVArrange', {clear=true})
			api.nvim_create_autocmd({'BufRead', 'BufWritePost'}, {
				group = csvarrange,
				pattern = '*.csv',
				command = "%ArrangeColumn",
			})
			api.nvim_create_autocmd({'BufWritePre'}, {
				group = csvarrange,
				pattern = '*.csv',
				command = "%UnArrangeColumn",
			})
		end,
	},
	{
		'emmanueltouzery/decisive.nvim',
		ft = 'csv',
		setup = 'true',
	},
	{
		'vim-scripts/indentpython.vim',
		ft = 'python',
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
