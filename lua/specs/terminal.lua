-- plugins that add functionality to neovim's terminal
return {
	{
		'numtostr/navigator.nvim',
		enabled = false,
		opts = {},
	},
	{
		'numToStr/FTerm.nvim',
		opts = {
			cmd = 'pwsh -nologo',
		},
		keys = {
			{'<F12>', function() require("FTerm").toggle() end, mode = {'n', 't'}},
		},
	}
}
