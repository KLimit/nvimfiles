-- plugins that are directly related to treesitter
local iswindows = require'lib.iswindows'
return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = function()
			require('nvim-treesitter.install').update({
				with_sync = true
			})
		end,
		config = function()
			if iswindows() then
				-- vim.print(require'nvim-treesitter.install'.compilers)
				-- might be hacky, but specify use of zig compiler
				require'nvim-treesitter.install'.compilers = {'zig'}
			end
			require'nvim-treesitter.configs'.setup {
				ensure_installed = {
					'c',
					-- 'gitcommit',
					'json',
					'lua',
					'perl',
					'python',
					'query',
					'rust',
					'vim',
					'vimdoc',
				},
				highlight = {
					enable = true,
					disable = {'gitcommit'},
					additional_vim_regex_highlighting = false,
				},
				query_linter = {
					enable = true,
					use_virtual_text = true,
					lint_events = {"BufWrite", "CursorHold"},
				},
				textobjects = {
					enable = true,
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
							['as'] = {query = '@scope', query_group = 'locals', desc = 'select language scope'},
						},
						selection_modes = 'V',  -- line selection
						-- include_surrounding_whitespace = true,
					},
				},
			}
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		lazy = false,
		event = 'VeryLazy',
		opts = {
			max_lines = 3,
			multiline_threshold = 1,
			trim_scope = 'outer',
		}
	},
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		lazy = false,
		-- TODO: make all relevant plugins after nvim-treesitter like in colorscheme
		after = 'nvim-treesitter',
		requires = 'nvim-treesitter/nvim-treesitter',
	}
}
