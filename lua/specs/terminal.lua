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
			require('bufterm').setuip({})
		end,
	},
	cmd = {'BufTermEnter', 'BufTermPrev', 'BufTermNext', 'terminal'}
}
