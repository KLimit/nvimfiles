-- color schemes only
-- (and colorbuddy for now)
colorschemes = {
	{ 'n1ghtmare/noirblaze-vim' , enabled = false},
	{ 'paulfrische/reddish.nvim' },
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
		config = true,
	},
	{ 'savq/melange-nvim' },
	{ 'fenetikm/falcon' },
	{
		'rebelot/kanagawa.nvim',
		config = true,
	},
	{
		'ramojus/mellifluous.nvim',
		dependencies = 'rktjmp/lush.nvim',
		config = true,
	},
	{
		'bluz71/vim-moonfly-colors',
		name = 'moonfly',
	},
	{ url = 'https://git.sr.ht/~romainl/vim-bruin' },
	{
		url = 'https://git.sr.ht/~swalladge/paper.vim',
		pin = true,  -- 404 on the url
	},
	{ url = 'https://git.sr.ht/~swalladge/antarctic-vim' },
	{ 'heraldofsolace/nisha-vim' },
	{ 'aonemd/kuroi.vim' },
	{ 'hachy/eva01.vim' },
	{ 'rfunix/vim-greenisgood' },
	{ 'm-gail/northernlights.vim' },
	{ 'MeF0504/vim-shiki' },
	{ 'lunacookies/vim-substrata' },
	{ 'bratpeki/truedark-vim' },
	{ 'nyngwang/nvimgelion' },
}
local scheme = 'eva01'
for i, scheme in ipairs(colorschemes) do
	-- lazy.nvim recommends high priority for color schemes to load them early
	scheme.priority = 1000
	scheme.lazy = true
	if scheme.name == scheme then
		-- TODO: come up with a way to to set the colorscheme from here so that you
		-- don't have this as yet another instance of the string "eva01", etc.
		scheme.lazy = false
	end
end
return colorschemes
