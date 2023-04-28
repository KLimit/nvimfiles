-- plugins that are directly related to treesitter
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
			-- might be hacky, but specify use of zig compiler
			require'nvim-treesitter.install'.compilers = {'zig'}
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
				highlight = { enable = true },
				query_linter = { enable = true, use_virtual_text = true, lint_events = {"BufWrite", "CursorHold"}},
			}
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		lazy = false,
		event = 'VeryLazy',
		config = function()
			require('treesitter-context').setup()
		end
	},
	{
		'nvim-treesitter/playground',
		cmd = {
			'TSPlaygroundToggle',
			'TSNodeUnderCursor',
			'TSHighlightCapturesUnderCursor',
		},
	},
}
