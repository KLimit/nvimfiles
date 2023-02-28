-- filetype-specific plugins
return {
	-- 'chrisbra/csv.vim'
	{
		'vim-scripts/indentpython.vim',
		ft = 'python',
	},
	{
		'vim-scripts/Windows-Powershell-Syntax-Plugin',
		ft = 'ps1',
	},
	{
		'cespare/vim-toml',
		ft = 'toml',
	},
	{
		'm42e/trace32-practice.vim',
		ft = 'practice',
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
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = function()
			require('nvim-treesitter.install').update({
				with_sync = true
			})
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		lazy = false,
		config = function()
			require('treesitter-context').setup()
		end
	},
}
