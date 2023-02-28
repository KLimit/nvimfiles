-- plugins that modify how text appears in a buffer/window
return {
	{
		-- also used by zen-mode.nvim
		'folke/twilight.nvim',
		lazy = true,
		config = function()
			require('twilight').setup({})
		end,
		cmd = {'Twilight', 'TwilightEnable', 'TwilightDisable'}
	},
	{
		'folke/zen-mode.nvim',
		config = function()
			require('zen-mode').setup({})
		end,
		cmd = 'ZenMode',
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		enabled = true,
		lazy = false,
		config = function()
			require('indent_blankline').setup {
				use_tresitter = true,
				show_current_context = true,
				show_current_context_start = true,
				show_trailing_blankline_indent = false,
				-- space_char_blankline = '░',
				-- show_first_indent_level = false,
			}
		end,
	},
	{
		'nyngwang/murmur.lua',
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require('murmur').setup({})
		end,
	},
	{
		'asiryk/auto-hlsearch.nvim',
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require('auto-hlsearch').setup()
		end,
	},
	{
		'm00qek/baleia.nvim',
		lazy = true,
	}
}
