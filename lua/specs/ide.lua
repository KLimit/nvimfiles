-- plugins that make neovim work a little more like an IDE
return {
	{
		-- (probably bloated) linter and stuff
		'dense-analysis/ale',
		enabled = false,
	},
	{
		'mfussenegger/nvim-lint',
		enabled = false,
		config=function()
			local lint = require('lint')
			-- lint.linters_by_ft = {
			-- 	python = {'C:/Python310/scripts/flake8.exe',}
			-- }
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		'tpope/vim-fugitive',
		enabled = true,
		cmd = {
				"G",
				"Git",
				"Gdiffsplit",
				"Gread",
				"Gwrite",
				"Ggrep",
				"GMove",
				"GDelete",
				"GBrowse",
				"GRemove",
				"GRename",
				"Glgrep",
				"Gedit",
		},
		ft = {"fugitive"}
	},
	{
		'sindrets/diffview.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewFileHistory",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
			"DiffviewLog",
		},
	},
	{
		'nvim-tree/nvim-tree.lua',
		enabled = false,
		dependencies = {'nvim-tree/nvim-web-devicons'},
		init = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		config = function()
			require('nvim-tree').setup({
				view = {
					number = true,
					relativenumber = true,
				}
			})
		end
	},
	{
		'lewis6991/gitsigns.nvim',
		enabled = false,
		config = function()
			require('gitsigns').setup()
		end
	},
	{
		-- code tree
		'stevearc/aerial.nvim',
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require('aerial').setup({
				layout = {
					default_direction = 'prefer_left',
				},
				close_automatic_events = {}
			})
		end,
	},
}
