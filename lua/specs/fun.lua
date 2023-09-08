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
}
