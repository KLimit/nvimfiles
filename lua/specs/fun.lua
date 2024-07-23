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
		'NStefan002/2048.nvim',
		cmd = 'Play2048',
		config = true,
	},
	{
		'rktjmp/playtime.nvim',
		cmd = 'Playtime',
		config = function()
			require'playtime'.setup{}
			local set_hl = vim.api.nvim_set_hl
			set_hl(0, '@playtime.game.card.diamonds', {link='@playtime.game.card.diamonds.four_colors'})
			set_hl(0, '@playtime.game.card.clubs', {link='@playtime.game.card.clubs.four_colors'})
		end
	}
}
