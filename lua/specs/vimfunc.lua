-- plugins that extend neovim features or provide vim-like functionality
return {
	{
		'windwp/nvim-autopairs',
		event = 'VeryLazy',
		opts = {
			check_ts = true,
			map_cr = true,
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
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		config = true,
	},
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		config = true,
		enabled = false,
	},
	{
		'chentoast/marks.nvim',
		event = 'VeryLazy',
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
		'chrisgrieser/nvim-various-textobjs',
		event = 'VeryLazy',
		opts = {useDefaultKeymaps = true},
	},
	{
		'ibhagwan/smartyank.nvim',
		event = 'VeryLazy',
		clipboard = {enabled = true},
		tmux = {enabled = false},
	},
	{
		'mrjones2014/smart-splits.nvim',
		enabled = true,
		event = 'VeryLazy',
		opts = {
			ignored_filetypes = {
				'nofile',
				'quickfix',
				'prompt',
				'no-neck-pain',
			},
			cursor_follows_swapped_bufs = true,
		},
		keys = {
			{'<C-w>H', function() require'smart-splits'.swap_buf_left() end},
			{'<C-w>J', function() require'smart-splits'.swap_buf_down() end},
			{'<C-w>K', function() require'smart-splits'.swap_buf_up() end},
			{'<C-w>L', function() require'smart-splits'.swap_buf_right() end},
		},
	},
	{
		'Tummetott/reticle.nvim',
		event = 'VeryLazy',
		config = true,
	},
	{
		'Wansmer/treesj',
		dependencies = {'nvim-treesitter/nvim-treesitter'},
		opts = {
			use_default_keymaps = false,
		},
		keys = {
			{'<leader>j', function() require('treesj').join() end},
			{'<leader>s', function() require('treesj').split() end},
		},
		cmd = {'TSJToggle', 'TSJSplit', 'TSJJoin'},
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
			skipInsignificantPunctuation = true,
		},
		keys = {
			{'w', function() require('spider').motion('w') end, mode = {'n', 'o', 'x'}},
			{'e', function() require('spider').motion('e') end, mode = {'n', 'o', 'x'}},
			{'b', function() require('spider').motion('b') end, mode = {'n', 'o', 'x'}},
			{'ge', function() require('spider').motion('ge') end, mode = {'n', 'o', 'x'}},
		},
	},
	{
		'phaazon/hop.nvim',
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
		'chrisgrieser/nvim-early-retirement',
		config = true,
		event = 'VeryLazy',
		opts = { notificationOnAutoClose = true, }
	},
	{
		'nmac427/guess-indent.nvim',
		config = {
			auto_cmd = false,
		},
		cmd = 'GuessIndent',
	},
	{
		'darazaki/indent-o-matic',
		enabled = false,
		config = true,
		cmd = 'IndentOMatic',
	}
}
