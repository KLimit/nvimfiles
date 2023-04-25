-- plugins that extend neovim features or provide vim-like functionality
return {
	{
		'windwp/nvim-autopairs',
		event = 'VeryLazy',
		config = function()
			require('nvim-autopairs').setup({
				check_ts = true,
				map_cr = true,
			})
		end
	},
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		config = function()
			require('nvim-surround').setup({})
		end
	},
	{
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		config = function()
			require('Comment').setup()
		end,
		-- keys = {'gc'},
	},
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		config = function()
			require('which-key').setup {
			}
		end
	},
	{
		'chentoast/marks.nvim',
		event = 'VeryLazy',
		config = function()
				require('marks').setup({
				})
		end,
	},
	{
		'rmagatti/alternate-toggler',
		event = 'VeryLazy',
		config = function()
			toggler = require('alternate-toggler')
			toggler.setup({
				alternates = {
					['=='] = '!='
				},
				vim.keymap.set('n', '<leader>t', toggler.toggleAlternate)
			})
		end,
	},
	{
		'matbme/JABS.nvim',
		config = function()
			require('jabs').setup()
		end,
		cmd = 'JABSOpen',
	},
	{
		'chrisgrieser/nvim-various-textobjs',
		event = 'VeryLazy',
		config = function()
			require('various-textobjs').setup({
				useDefaultKeymaps = true
			})
		end,
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
		config = function()
			require('smart-splits').setup({
				ignored_filetypes = {
					'nofile',
					'quickfix',
					'prompt',
					'no-neck-pain',
				},
				tmux_integration = false,
				disable_tmux_nav_when_zoomed = false,
			})
		end
	},
	{
		'Tummetott/reticle.nvim',
		event = 'VeryLazy',
		config = function()
			require('reticle').setup()
		end,
	},
	{
		'Wansmer/treesj',
		dependencies = {'nvim-treesitter/nvim-treesitter'},
		cmd = {'TSJToggle', 'TSJSplit', 'TSJJoin'},
		keys = {'<leader>j', '<leader>s'},
		config = function()
			local treesj = require('treesj')
			treesj.setup({
				use_default_keymaps = false,
			})
			vim.keymap.set('n', '<leader>j', treesj.join)
			vim.keymap.set('n', '<leader>s', treesj.split)
		end,
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
		config = function()
			skipInsignificantPunctuation = true
			vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
			vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
			vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
			vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
		end
	},
	{
		'phaazon/hop.nvim',
		event = 'VeryLazy',
		config = function()
			local hop = require('hop')
			hop.setup({uppercase_labels = true,})
			local directions = require('hop.hint').HintDirection
			-- vim.keymap.set('', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end)
			-- vim.keymap.set('', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end)
			-- vim.keymap.set('', 't', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end)
			-- vim.keymap.set('', 'T', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end)
			vim.keymap.set('', 'ff', function() hop.hint_words() end)
		end,
	},
	{
		'sQVe/sort.nvim',
		config = function()
			require('sort').setup({})
		end,
		cmd = 'Sort',
	}
}
