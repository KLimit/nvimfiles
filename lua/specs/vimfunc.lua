-- plugins that extend neovim features or provide vim-like functionality
return {
	{
		'windwp/nvim-autopairs',
		cond = false,
		event = 'VeryLazy',
		opts = {
			disable_filetype  = {'TelescopePrompt', 'hy'},
			check_ts = true,
			map_cr = true,
			map_c_w = true,
		},
	},
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		opts = {},
		config = true,
	},
	{
		'rmagatti/alternate-toggler',
		event = 'VeryLazy',
		opts = {
			alternates = {
				['=='] = '!=',
			},
		},
		keys = {
			{'<leader>t', ":lua require('alternate-toggler').toggleAlternate()<CR>"}
		},
	},
	{
		'matbme/JABS.nvim',
		config = true,
		cmd = 'JABSOpen',
	},
	{
		'Tummetott/reticle.nvim',
		event = 'VeryLazy',
		opts = {
			always_highlight_number = true,
		},
	},
	{
		'vim-scripts/ScrollColors',
		cmd = {'SCROLLCOLOR'},
	},
	{
		'jinfan/vim-randcolor',
		cmd = {'RandColorScheme'},
	},
	{
		'chrisgrieser/nvim-spider',
		event = 'VeryLazy',
		enabled = true,
		opts = {
			skipInsignificantPunctuation = false,
		},
		keys = {
			{'w', function() require('spider').motion('w') end, mode = {'n', 'o', 'x'}},
			{'e', function() require('spider').motion('e') end, mode = {'n', 'o', 'x'}},
			{'b', function() require('spider').motion('b') end, mode = {'n', 'o', 'x'}},
			{'ge', function() require('spider').motion('ge') end, mode = {'n', 'o', 'x'}},
		},
	},
	{
		'smoka7/hop.nvim',
		event = 'VeryLazy',
		opts = {uppercase_labels = true,},
		keys = {
			{'ff', function() require('hop').hint_words() end},
		},
	},
	{
		'sQVe/sort.nvim',
		config = true,
		cmd = 'Sort',
	},
	{
		'abecodes/tabout.nvim',
		opts = { },
		event = 'VeryLazy',
	},
	{
		'sindrets/winshift.nvim',
		opts = {},
		cmd = 'WinShift',
		keys = {
			{'<C-w>W', ":WinShift<CR>"}
		},
	},
	{
		'altermo/ultimate-autopair.nvim',
		event = 'VeryLazy',
		opts = {
			bs = {
				map = {'<bs>', '<C-w>'},
				cmap = {'<bs>', '<C-w>'},
			},
			fastwarp = {enable = false},
		},
	},
	{
		'jbyuki/venn.nvim',
		cmd = 'VBox',
	},
	{
		'tyru/capture.vim',
		cmd = 'Capture',
	},
	{
		'fredeeb/tardis.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		opts = { keymap = { commit = nil } },
		cmd = 'Tardis',
	},
	{'einfachtoll/didyoumean', lazy=false},
}
