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
	-- {'2giosangmitom/nightfall.nvim'},
	{'NTBBloodbath/sweetie.nvim'},
	{'0xstepit/flow.nvim'},
}
-- lazy.nvim recommends high priority for color schemes to load them early
-- but only do so for the chosen scheme
local selected = vim.g.colors_name
for i, scheme_ in ipairs(colorschemes) do
	-- scheme_.lazy = true
	-- scheme_.event = 'VeryLazy'
	local altname = scheme_[1] or scheme_.url
	if scheme_.name == selected or string.find(altname, selected) then
		scheme_.priority = 1000
		scheme_.lazy = false
		return {scheme_}
	end
end
-- return colorschemes
