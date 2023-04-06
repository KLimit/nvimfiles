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
		'gaoDean/autolist.nvim',
		ft = {
			'markdown',
			'text',
			'tex',
			'plaintex',
		},
		config = function()
			local autolist = require('autolist')
			autolist.setup()autolist.create_mapping_hook("i", "<CR>", autolist.new)
			autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
			autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
			autolist.create_mapping_hook("n", "o", autolist.new)
			autolist.create_mapping_hook("n", "O", autolist.new_before)
			autolist.create_mapping_hook("n", ">>", autolist.indent)
			autolist.create_mapping_hook("n", "<<", autolist.indent)
			autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
			autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
			vim.api.nvim_create_autocmd("TextChanged", {
				pattern = "*",
				callback = function()
					vim.cmd.normal({autolist.force_recalculate(nil, nil), bang = false})
				end
			})
		end,
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
		cmd = {'SCROLL', 'COLOR'},
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
	},
}
