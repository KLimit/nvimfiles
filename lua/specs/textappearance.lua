-- plugins that modify how text appears in a buffer/window
return {
	{
		-- also used by zen-mode.nvim
		'folke/twilight.nvim',
		config = true,
		cmd = {'Twilight', 'TwilightEnable', 'TwilightDisable'}
	},
	{
		'folke/zen-mode.nvim',
		config = true,
		cmd = 'ZenMode',
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		enabled = true,
		lazy = false,
		opts = {
			use_tresitter = true,
			show_current_context = true,
			show_current_context_start = true,
			show_trailing_blankline_indent = false,
			-- space_char_blankline = '░',
			-- show_first_indent_level = false,
		}
	},
	{
		'nyngwang/murmur.lua',
		event = 'VeryLazy',
		config = true,
	},
	{
		'asiryk/auto-hlsearch.nvim',
		event = 'VeryLazy',
		config = true,
	},
	{
		'm00qek/baleia.nvim',
	},
	{
		'nvchad/nvim-colorizer.lua',
		cmd = {
			'ColorizerAttachToBuffer',
			'ColorizerDetachFromBuffer',
			'ColorizerReloadAllBuffers',
			'ColorizerToggle',
		},
		config = true,
	},
	{
		'folke/todo-comments.nvim',
		dev = true,
		event = 'VeryLazy',
		config = {
			signs = false,
			highlight = {
				before = 'fg',
				keyword = 'wide_bg',
				after = 'fg',
				pattern = [[.*<(KEYWORDS)\s*:]],
				colon_in_wide = true,
			},
			keywords = {
				NOTE= {alt = { 'CONSIDER', 'INFO' }},
			},
		},
	},
	{
		'tzachar/highlight-undo.nvim',
		config = {
			hlgroup = 'HighlightUndo',
			duration = 300,
			keymaps = {
				{'n', 'u', 'undo', {}},
				{'n', '<C-r>', 'redo', {}},
			},
		},
		keys = {'u', '<C-r>'},
	},
}
