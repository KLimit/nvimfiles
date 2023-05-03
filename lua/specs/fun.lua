-- games in neovim?
return {
	{
		'rktjmp/shenzhen-solitaire.nvim',
		config = function()
			local Shenzhen = vim.api.nvim_create_augroup("Shenzhen", {clear = True})
			vim.api.nvim_create_autocmd({'FileType'}, {
				group = Shenzhen,
				pattern = "shenzhen-solitaire",
				callback = function()
					vim.cmd('IndentBlanklineDisable')
					vim.opt_local.colorcolumn = ''
					vim.keymap.set('n', ']]', ':ShenzhenSolitaireNewGame<CR>')
					vim.cmd('NoNeckPain')
				end
				-- command = "IndentBlanklineDisable",
			})
		end,
		cmd = {'ShenzhenSolitaireNewGame', 'ShenzhenSolitaireNextGame'}
	},
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
		config = function()
			local duck = require('duck')
			vim.keymap.set('n', '<leader>kit', function() duck.hatch('🐈') end, {})
			vim.keymap.set('n', '<leader>sus', function() duck.hatch('ඞ') end, {})
			vim.keymap.set('n', '<leader>duckd', function() duck.cook() end, {})
		end,
		keys = {'<leader>kit', '<leader>sus', '<leader>duckd'}
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
		'BooleanCube/keylab.nvim',
		requires = 'nvim-lua/plenary.nvim',
		cmd = { 'KeylabStart' },
		config = function()
			require('keylab').setup({
				LINES = 10,
				force_accuracy = true,
			})
		end,
	},
}
