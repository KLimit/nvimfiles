-- color schemes only
-- (and colorbuddy for now)
colorschemes = {
	{ 'n1ghtmare/noirblaze-vim' , enabled = false},
	{ 'paulfrische/reddish.nvim' },
	{
		'rose-pine/neovim',
		name = 'rose-pine',
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
	-- {
	-- 	url = 'https://git.sr.ht/~swalladge/paper.vim',
	-- 	pin = true,  -- 404 on the url
	-- },
	-- { url = 'https://git.sr.ht/~swalladge/antarctic-vim' },
	{ 'heraldofsolace/nisha-vim' },
	{ 'aonemd/kuroi.vim' },
	{ 'hachy/eva01.vim' },
	{ 'rfunix/vim-greenisgood' },
	{ 'm-gail/northernlights.vim' },
	{ 'MeF0504/vim-shiki' },
	{ 'lunacookies/vim-substrata' },
	{ 'bratpeki/truedark-vim' },
	{ 'nyngwang/nvimgelion' },
	{ 'everblush/nvim', name = 'everblush' },
	{
		'zootedb0t/citruszest.nvim',
		opts = {
			option = {transparent = true},
			-- #404040 is the "visual" color; don't want to load the palette
			style = {
				ColorColumn = {bg = "#404040"},
				PmenuSbar = {fg = "#232323"},
				MatchParen = {reverse = true},
			},
			-- PmenuSbar
		}
	},
	{ 'ishan9299/modus-theme-vim' },
	{ 'cryptomilk/nightcity.nvim' },
	{
		'scottmckendry/cyberdream.nvim',
		opts = {
			transparent = true,
			italic_comments = true,
		}
	},
	{ 'lighthaus-theme/vim-lighthaus' },
	{
		'slugbyte/lackluster.nvim',
		opts = {
			tweak_syntax = {comment = 0x555555},
			tweak_background = {normal = 'none'}
		}
	},
}
-- this is the scheme to use
for i, scheme_ in ipairs(colorschemes) do
	-- lazy.nvim recommends high priority for color schemes to load them early
	scheme_.lazy = true
	scheme_.event = 'VeryLazy'
	if scheme_.name == vim.g.colors_name then
		-- TODO: come up with a way to to set the colorscheme from here so that you
		-- don't have this as yet another instance of the string "eva01", etc.
		scheme_.priority = 1000
		scheme_.lazy = false
	end
end
return colorschemes
