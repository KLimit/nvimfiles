-- default color scheme should not be lazy
colorschemes = {
	{
		'vim-scripts/ScrollColors',
		lazy = true,
		cmd = {'SCROLL', 'COLOR'},
	},
	{
		'n1ghtmare/noirblaze-vim',
		lazy = true,
	},
	{
		'paulfrische/reddish.nvim',
		lazy = true,
	},
	{
		'jesseleite/nvim-noirbuddy',
		lazy = true,
		dependencies = {'tjdevries/colorbuddy.nvim', branch = 'dev'},
		config = function()
			require('noirbuddy').setup({
				primary = 'crt-amber',
			})
		end,
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		lazy = true,
	},
	{
		'wuelnerdotexe/vim-enfocado',
		lazy = false,
		config = function()
			vim.g.enfocado_style = 'neon'
			vim.g.enfocado_plugins = {
				'aerial',
				'indent-blankline',
				'lspconfig',
				'lazy',
				'tree',
				'treesitter',
				'surround',
				'which-key',
			}
		end,
	},
	{
		'savq/melange-nvim',
		lazy = true,
	}
}
-- for i, scheme in ipairs(colorschemes) do
-- 	scheme.priority = 1000
return colorschemes
