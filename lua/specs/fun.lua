-- games in neovim?
return {
	{
		'tamton-aquib/zone.nvim',
		enabled = false,
		config = function()
			require('zone').setup({
				style = 'treadmill',
				after = 60*5,
			})
		end,
	},
	{
		'Eandrju/cellular-automaton.nvim',
		config = function()
			vim.keymap.set('n', '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>')
		end,
		cmd = 'CellularAutomaton',
		keys = '<leader>fml',
	},
	{
		'tamton-aquib/duck.nvim',
		enabled = false,
		opts = {},
	},
	{
		'jim-fx/sudoku.nvim',
		cmd = 'Sudoku',
		config = function()
			require('sudoku').setup({})
		end,
	},
	{
		'letieu/hacker.nvim',
		cmd = { 'HackFollow', 'Hack' },
		config = function()
			require('hacker').setup({
				filetype = 'python',
				speed = { min = 1, max = 1},
			})
		end,
	},
	{
		'seandewar/nvimesweeper',
		cmd = 'Nvimesweeper',
	},
	{
		'NStefan002/speedtyper.nvim',
		cmd = 'Speedtyper',
		config = true,
	},
	{
		'rktjmp/playtime.nvim',
		cmd = 'Playtime',
		config = function()
			require'playtime'.setup{fps=60}
			local set_hl = vim.api.nvim_set_hl
			local function hilink(tolink, target)
				set_hl(0, tolink, {link=target})
			end
			hilink('@playtime.game.card.diamonds', '@playtime.game.card.diamonds.four_colors')
			hilink('@playtime.game.card.clubs', '@playtime.game.card.clubs.four_colors')
			-- try to set playtime colors based on color scheme
			pcall(function()
				local colors = require(vim.g.colors_name .. '.colors').colors
				for group, fg in pairs{
					PlaytimeNormal = colors.fg,
					-- PlaytimeMuted = colors.fluo,
					PlaytimeWhite = colors.white,
					PlaytimeBlack = colors.black,
					PlaytimeRed = colors.red,
					PlaytimeGreen = colors.green,
					PlaytimeYellow = colors.yellow,
					PlaytimeOrange = colors.orange,
					PlaytimeBlue = colors.blue,
					PlaytimeMagenta = colors.purple,
					PlaytimeCyan = colors.cyan,
				} do
					set_hl(0, group, {fg=fg})
				end
			end)
		end
	}
}
