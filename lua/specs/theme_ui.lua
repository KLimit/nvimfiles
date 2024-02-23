-- plugins that add to the UI or theme (including colorschemes)
local a = vim.api
local function sum(table)
	local _sum = 0
	for k, v in pairs(table) do
		_sum = _sum + v
	end
	return _sum
end
return {
	{ 'nvim-tree/nvim-web-devicons' },
	{
		-- filenames in upper-right corner of window
		'b0o/incline.nvim',
		lazy = false,
		opts = {
			render = function(props)
				local wininfo = vim.call('getwininfo', props.win)[1]
				local bufname = a.nvim_buf_get_name(props.buf)
				local res = bufname ~= '' and vim.fn.fnamemodify(bufname, ':t') or '[No Name]'
				if a.nvim_buf_get_option(props.buf, 'modified') then
					res = res .. ' [+]'
				end
				res = wininfo.winnr .. ' (' .. props.buf .. ') | ' .. res
				local config = require('incline.config')
				local extraspaces = wininfo.textoff + sum(config.window.padding) + sum(config.window.margin.horizontal)
				local line, col = unpack(a.nvim_win_get_cursor(props.win))
				if line == wininfo.topline and (wininfo.width - string.len(res) - extraspaces < col) then
					return ''
				end
				return res
			end,
			-- window = { margin = { vertical = 0 }, },
			hide = {
				cursorline = false,
			},
			ignore = {
				unlisted_buffers = false,
				filetypes = {'NvimTree', 'no-neck-pain', 'drex'},
				buftypes = {},
				wintypes = {},
			},
			highlight = {
				groups = {
				InclineNormal = {default=true,group='lualine_a_command'},
			}},
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		cond = true,
		lazy = false,
		dependencies = {'nvim-tree/nvim-web-devicons', lazy = true},
		opts = {
			options = {
				globalstatus = true,
				theme = vim.g.colors_name,
				-- the font Fairfax HD has Powerline symbols at a different code point
				section_separators = { left = '󿂰', right = '󿂲' },
				component_separators = { left = '│', right = '│' },
			},
			sections = {
				lualine_a = {
					{
						'mode',
						fmt = function(str) return str:sub(1, 1) end,
					},
					{
						'buffers',
						mode = 4,
						icons_enabled = false,
						symbols = { modified = ' *', alternate_file = '#', directory = '🗁' }
					},
				},
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
		},
	},
	{
		'gorbit99/codewindow.nvim',
		config = function()
			local codewindow = require('codewindow')
			codewindow.setup({
				minimap_width = 10,
				use_treesitter = true,
			})
			codewindow.apply_default_keybinds()
		end,
		keys = '<leader>m'
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
		end,
	},
	{
		'shortcuts/no-neck-pain.nvim',
		version = '*',
		config = true,
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
	{
		'ziontee113/icon-picker.nvim',
		dependencies = 'stevearc/dressing.nvim',
		opts = {disable_legacy_commands = true,},
		cmd = { 'IconPickerNormal', 'IconPickerYank' },
	},
	{
		'stevearc/dressing.nvim',
		opts = {
			select = { builtin = { min_width = { 50, 0.3 } } },
		}
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		cmd = 'Telescope',
	},
	{
		'echasnovski/mini.colors',
		-- lazy tries to look for a 'mini' module if you use config = true
		config = function()
			require'mini.colors'.setup()
		end,
		cmd = 'Colorscheme',
	},
	{
		'mawkler/modicator.nvim',
		enabled = true,
		event = 'VeryLazy',
		config = true,
	},
	{
		'freddiehaddad/feline.nvim',
		config = true,
		cond = false,
		lazy = false,
		-- event = 'VeryLazy',
	}
}
