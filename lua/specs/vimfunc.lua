-- plugins that extend neovim features or provide vim-like functionality
return {
	{
		'windwp/nvim-autopairs',
		lazy = true,
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
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require('nvim-surround').setup({})
		end
	},
	{
		'numToStr/Comment.nvim',
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require('Comment').setup()
		end,
		-- keys = {'gc'},
	},
	{
		'folke/which-key.nvim',
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require('which-key').setup {
			}
		end
	},
	{
		'chentoast/marks.nvim',
		lazy = true,
		event = 'VeryLazy',
		config = function()
				require('marks').setup({
				})
		end,
	},
	{
		'rmagatti/alternate-toggler',
		lazy = true,
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
		lazy = true,
		config = function()
			require('jabs').setup()
		end,
		cmd = 'JABSOpen',
	},
	{
		'chrisgrieser/nvim-various-textobjs',
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require('various-textobjs').setup({
				useDefaultKeymaps = true
			})
		end,
	},
	{
		'ibhagwan/smartyank.nvim',
		lazy = true,
		event = 'VeryLazy',
		clipboard = {enabled = true},
		tmux = {enabled = false},
	},
	{
		'gaoDean/autolist.nvim',
		lazy = true,
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
		lazy = true,
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
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require('reticle').setup()
		end,
	},
	{
		'Wansmer/treesj',
		dependencies = {'nvim-treesitter/nvim-treesitter'},
		lazy = true,
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
}
