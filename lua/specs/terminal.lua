-- plugins that add functionality to neovim's terminal
return {
	{
		'samjwill/nvim-unception',
	},
	{
		'numtostr/navigator.nvim',
		enabled = false,
		config = function()
			require('Navigator').setup()
		end
	},
	{
		'boltlessengineer/bufterm.nvim',
		lazy = true,
		config = function()
			require('bufterm').setup({})
		end,
		cmd = {'BufTermEnter', 'BufTermPrev', 'BufTermNext', 'Terminal'},
		-- event = 'VeryLazy',
	},
}
