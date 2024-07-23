-- plugins that particularly pertain to statuslines and related concepts
-- separated from theme_ui since their specs can end up large
return {
	{
		'nvim-lualine/lualine.nvim',
		cond = false,
		lazy = false,
		dependencies = {'nvim-tree/nvim-web-devicons', lazy = true},
		opts = {
			options = {
				globalstatus = true,
				theme = vim.g.colors_name,
				-- the font Fairfax HD has Powerline symbols at a different code point
				section_separators = { left = '', right = '░' },
				component_separators = { left = '│', right = '│' },
			},
			sections = {
				lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
				lualine_b = {
					{
						'buffers',
						mode = 4,
						icons_enabled = false,
						symbols = { modified = ' +', alternate_file = '#', directory = '🗁' }
					},
				},
				lualine_c = {
					{'aerial', dense = true, colored = false},
				},
				lualine_x = {
					'encoding',
					{ 'fileformat', symbols = { unix = '␊', dos = '␍␊', mac = '␍' } },
					{'filetype', icons_enabled = false},
				},
				lualine_y = {
					'location',
					'progress',
				},
				lualine_z = {
					function()
						return os.date("%I:%M %p")
					end,
				},
			},
		},
	},
	{
		-- filenames in upper-right corner of window
		'b0o/incline.nvim',
		cond = false,
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
				}
			},
		},
	},
}
