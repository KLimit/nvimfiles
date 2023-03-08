-- games in neovim?
return {
	{
		'rktjmp/shenzhen-solitaire.nvim',
		lazy = true,
		config = function()
			local Shenzhen = vim.api.nvim_create_augroup("Shenzhen", {clear = True})
			vim.api.nvim_create_autocmd({'FileType'}, {
				group = Shenzhen,
				pattern = "shenzhen-solitaire",
				callback = function()
					vim.cmd('IndentBlanklineDisable')
					vim.opt_local.colorcolumn = ''
					vim.keymap.set('n', ']]', ':ShenzhenSolitaireNextGame<CR>')
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
		lazy = true,
		config = function()
			require('zone').setup({
				style = 'treadmill',
				after = 60*5,
			})
		end,
	},
	{
		'Eandrju/cellular-automaton.nvim',
		lazy = true,
		config = function()
			vim.keymap.set('n', '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>')
		end,
		keys = '<leader>fml',
	},
	{
		'tamton-aquib/duck.nvim',
		lazy = true,
		config = function()
			local duck = require('duck')
			vim.keymap.set('n', '<leader>kit', function() duck.hatch('🐈') end, {})
			vim.keymap.set('n', '<leader>sus', function() duck.hatch('ඞ') end, {})
			vim.keymap.set('n', '<leader>duckd', function() duck.cook() end, {})
		end,
		keys = {'<leader>kit', '<leader>sus', '<leader>duckd'}
	},
}
