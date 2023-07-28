-- plugins that make neovim work a little more like an IDE
return {
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
		'lewis6991/gitsigns.nvim',
		enabled = false,
		config = true,
	},
	{
		-- code tree
		'stevearc/aerial.nvim',
		event = 'VeryLazy',
		opts = {
			layout = {
				default_direction = 'prefer_left',
			},
			close_automatic_events = {},
			post_jump_cmd = 'normal! zt',
			nerd_font = false,
			show_guides = true,
		},
	},
	{
		'timuntersberger/neogit',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			require('neogit').setup({
				disable_commit_confirmation = true,
				disable_insert_on_commit = false,
				sections = {
					untracked = { folded = true },
				}
			})
		end,
		cmd = 'Neogit',
	},
	{
		'rafcamlet/nvim-luapad',
		config = true,
		cmd = { 'Luapad', 'LuaRun' },
	},
	{
		'nvim-tree/nvim-tree.lua',
		enabled = false,
		dependencies = {'nvim-tree/nvim-web-devicons'},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		opts = {
			disable_netrw = true,
			view = {
				number = true,
				relativenumber = true,
				preserve_window_proportions = true,
			},
		},
		cmd = {
			'NvimTreeToggle',
			'NvimTreeFocus',
			'NvimTreeFindFile',
			'NvimTreeCollapse',
		},
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		enabled = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
		opts = {
			enable_diagnostics = false,
			sort_case_insensitive = true,
			default_component_configs = {
				indent = {
					expander_collapsed = '▼',
					expander_expanded = '▲',
				},
			}
		},
	},
	{
		'theblob42/drex.nvim',
		enabled = true,
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('drex.config').configure({
				hijack_netrw = true,
			})
		end,
		cmd = {
			'Drex',
			'DrexDrawerOpen',
			'DrexDrawerClose',
			'DrexDrawerToggle',
		},
	},
}
