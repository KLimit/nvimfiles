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
		disable = true,
		event = 'VeryLazy',
		opts = {
			ignored_filetypes = {
				'nofile',
				'quickfix',
				'prompt',
				'no-neck-pain',
			},
			tmux_integration = false,
			disable_tmux_nav_when_zoomed = false,
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
			{'ff', function() require('hop.hint').hint_words() end},
		},
	},
	{
		'sQVe/sort.nvim',
		config = true,
		cmd = 'Sort',
	}
}
