-- filetype-specific plugins
return {
	{
		'chrisbra/csv.vim',
		ft = 'csv',
		init = function()
			local api = vim.api
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
		config = function()
			-- might be hacky, but specify use of zig compiler
			require'nvim-treesitter.install'.compilers = {'zig'}
			require'nvim-treesitter.configs'.setup {
				ensure_installed = {
					'c',
					'gitcommit',
					'json',
					'lua',
					'perl',
					'python',
					'query',
					'rust',
					'vim',
					'vimdoc',
				},
				highlight = { enable = false },
				query_linter = { enable = true, use_virtual_text = true, lint_events = {"BufWrite", "CursorHold"}},
			}
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		lazy = false,
		event = 'VeryLazy',
		config = function()
			require('treesitter-context').setup()
		end
	},
	{
		'nvim-treesitter/playground',
		enabled=true,
		cmd = 'TSPlaygroundToggle',
	}
}
