-- color schemes only
-- (and colorbuddy for now)
colorschemes = {
	{ 'n1ghtmare/noirblaze-vim' , enabled = false},
	{ 'paulfrische/reddish.nvim' },
	{
		'jesseleite/nvim-noirbuddy',
		enabled = false,
		dependencies = { 'tjdevries/colorbuddy.nvim', branch = 'dev', },
		config = function()
			require('noirbuddy').setup({
				preset = 'crt-amber',
			})
		end,
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
	},
	{
		'wuelnerdotexe/vim-enfocado',
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
	{ 'savq/melange-nvim' },
	{
		'olivercederborg/poimandres.nvim',
		config = function()
			require('poimandres').setup({})
		end,
	},
	{ 'savq/melange-nvim' },
	{ 'fenetikm/falcon' },
	{
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup({})
		end,
	},
	{
		'ramojus/mellifluous.nvim',
		dependencies = 'rktjmp/lush.nvim',
		config = function()
			require('mellifluous').setup({})
		end,
	},
	{
		'bluz71/vim-moonfly-colors',
		name = 'moonfly',
	},
	{ url = 'https://git.sr.ht/~romainl/vim-bruin' },
	{ url = 'https://git.sr.ht/~swalladge/paper.vim' },
	{ url = 'https://git.sr.ht/~swalladge/antarctic-vim' },
	{ 'heraldofsolace/nisha-vim' },
	{ 'aonemd/kuroi.vim' },
	{ 'hachy/eva01.vim' },
	{ 'rfunix/vim-greenisgood' },
	{ 'm-gail/northernlights.vim' },
	{ 'MeF0504/vim-shiki' },
	{ 'lunacookies/vim-substrata' },
	{ 'bratpeki/truedark-vim' },
}
for i, scheme in ipairs(colorschemes) do
	-- lazy.nvim recommends high priority for color schemes to load them early
	scheme.priority = 1000
	-- I profiled several times; it's cheap to not lazy-load these (~0.5ms)
	scheme.lazy = false
end
return colorschemes
