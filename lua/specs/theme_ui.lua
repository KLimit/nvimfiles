-- plugins that add to the UI or theme (including colorschemes)
return {
	{
		'nvim-tree/nvim-web-devicons',
	},
	{
		-- filenames in upper-right corner of window
		'b0o/incline.nvim',
		lazy = false,
		config = function()
			require('incline').setup({
				render = function(props)
					local a = vim.api
					local bufname = a.nvim_buf_get_name(props.buf)
					local res = bufname ~= '' and vim.fn.fnamemodify(bufname, ':t') or '[No Name]'
					if a.nvim_buf_get_option(props.buf, 'modified') then
						res = res .. ' [+]'
					end
					res = a.nvim_win_get_number(props.win) .. ' | ' .. res
					return res
				end,
				window = {
					margin = { vertical = 0, },
				},
				hide = {
					cursorline = true,
				},
				ignore = {
					unlisted_buffers = false,
					filetypes = {'NvimTree', 'no-neck-pain'},
					buftypes = {},
					wintypes = {},
				},
			})
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		enabled = true,
		lazy = false,
		dependencies = {'nvim-tree/nvim-web-devicons', lazy = true},
		config = function()
			require('lualine').setup({
				options = {
					globalstatus = true,
					-- the font Fairfax HD has Powerline symbols at a different code point
					section_separators = { left = '󿂰', right = '󿂲' },
					component_separators = { left = '│', right = '│' },
				},
				sections = {
					lualine_a = {{
						'buffers',
						mode = 4,
						icons_enabled = false,
						symbols = { modified = ' *', alternate_file = '#', directory = '🗁' }
					}},
					lualine_b = {
						{
							function()
								local branch = vim.b.gitsigns_head
								if branch then
									return vim.b.gitsigns_head
								else
									return ''
								end
							end,
							icon = '󿂠',
						},
						{
							'diff',
							source = function()
								local gitsigns = vim.b.gitsigns_status_dict
								if gitsigns then
									return {
										added = gitsigns.added,
										modified = gitsigns.changed,
										removed = gitsigns.removed,
									}
								end
							end
						},
						'diagnostics',
					},
					lualine_c = {
						{'aerial', dense = true,},
					},
					lualine_x = {
						'encoding',
						{
							'fileformat',
							symbols = { unix = '␊', dos = '␍␊', mac = '␍' }
						},
						{'filetype', icons_enabled = false},
					},
					lualine_y = {
						'location',
						'progress',
					},
					lualine_z = {
						{
							require('lazy.status').updates,
							cond = require('lazy.status').has_updates,
						},
						function()
							return os.date("%I:%M %p")
						end,
					},
				},
			})
		end
	},
	{
		'gorbit99/codewindow.nvim',
		config = function()
			local codewindow = require('codewindow')
			codewindow.setup({
				minimap_width = 10,
			})
			codewindow.apply_default_keybinds()
		end,
		keys = '<leader>m'
	},
	{
		'anuvyklack/windows.nvim',
		enabled = false,
		lazy = false,
		dependencies = {
			'anuvyklack/middleclass',
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require('windows').setup()
		end
	},
	{
		'echasnovski/mini.animate',
		enabled = true,
		lazy = false,
		config = function()
			local animate = require('mini.animate')
			animate.setup({
				cursor = {
					timing = animate.gen_timing.linear({duration = 200, unit = 'total'}),
					path = animate.gen_path.line(),
				},
				scroll = {
					enable = false,
				},
			})
		end
	},
	{
		'shortcuts/no-neck-pain.nvim',
		version = '*',
		config = function()
			require('no-neck-pain').setup({})
		end,
		cmd = {'NoNeckPain'}
	},
	{
		'hood/popui.nvim',
		enabled = false,
		lazy = false,
		config = function()
			vim.ui.select = require('popui.ui-overrider')
			vim.ui.input = require('popui.input-overrider')
			vim.api.nvim_set_keymap(
				'n', "<leader>'", ':lua require("popui.marks-manager")()<CR>',
				{noremap = true, silent = true}
			)
		end,
	},
	{
		'cpea2506/relative-toggle.nvim',
		event = 'VeryLazy',
	},
	{
		'm4xshen/smartcolumn.nvim',
		event = 'VeryLazy',
		opts = {scope = 'window'}
	},
}
