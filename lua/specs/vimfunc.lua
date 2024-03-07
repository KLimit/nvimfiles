-- plugins that extend neovim features or provide vim-like functionality
return {
	{
		'windwp/nvim-autopairs',
		-- enabled = false,
		event = 'VeryLazy',
		config = function()
			local autopairs = require'nvim-autopairs'
			local Rule = require'nvim-autopairs.rule'
			local cond = require'nvim-autopairs.conds'
			autopairs.setup({
					check_ts = true,
					map_cr = true,
			})
		end,
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
		enabled = false,
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
		enabled = false,
		event = 'VeryLazy',
		opts = {useDefaultKeymaps = true},
	},
	{
		'ibhagwan/smartyank.nvim',
		enabled = false,
		event = 'VeryLazy',
		opts = {
			clipboard = {enabled = false},
			tmux = {enabled = false},
		},
	},
	{
		'mrjones2014/smart-splits.nvim',
		enabled = false,
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
		opts = {
			always_highlight_number = true,
		},
	},
	{
		'Wansmer/treesj',
		dependencies = {'nvim-treesitter/nvim-treesitter'},
		opts = {
			use_default_keymaps = false,
			langs = {
				python = {
					pattern_list = {split = {last_separator = true}},
					argument_list = {split = {last_separator = true}},
					parameters = {split = {last_separator = true}},
				},
			},
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
		'chrisgrieser/nvim-early-retirement',
		config = true,
		event = 'VeryLazy',
		opts = { notificationOnAutoClose = true, }
	},
	{
		'nmac427/guess-indent.nvim',
		opts = {
			auto_cmd = false,
		},
		cmd = 'GuessIndent',
	},
	{
		'darazaki/indent-o-matic',
		enabled = false,
		config = true,
		cmd = 'IndentOMatic',
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
		'chrisgrieser/nvim-puppeteer',
		dependencies = 'nvim-treesitter/nvim-treesitter',
		cond = false,
		lazy = false,  -- apparently, the plugin lazy-loads itself
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
	}
}
