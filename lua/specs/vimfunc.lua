-- plugins that extend neovim features or provide vim-like functionality
return {
	{
		'windwp/nvim-autopairs',
		lazy = false,
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
		lazy = false,
		config = function()
			require('nvim-surround').setup({})
		end
	},
	{
		'numToStr/Comment.nvim',
		lazy = false,
		config = function()
			require('Comment').setup()
		end,
		-- keys = {'gc'},
	},
	{
		'folke/which-key.nvim',
		lazy = false,
		config = function()
			require('which-key').setup {
			}
		end
	},
	{
		'chentoast/marks.nvim',
		lazy = false,
		config = function()
				require('marks').setup({
				})
		end,
	},
	{
		'rmagatti/alternate-toggler',
		lazy = false,
		config = function()
			require('alternate-toggler').setup({
				alternates = {
					['=='] = '!='
				},
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
		lazy = false,
		config = function()
			require('various-textobjs').setup({
				useDefaultKeymaps = true
			})
		end,
	},
	{
		'ibhagwan/smartyank.nvim',
		lazy = false,
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
	}
}
