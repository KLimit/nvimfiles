-- plugins that add to the UI or theme (not including colorschemes)
local a = vim.api
local function sum(table)
	local _sum = 0
	for k, v in pairs(table) do
		_sum = _sum + v
	end
	return _sum
end
return {
	{ 'nvim-tree/nvim-web-devicons' },
	{
		'gorbit99/codewindow.nvim',
		config = function()
			local codewindow = require('codewindow')
			codewindow.setup({
				minimap_width = 10,
				use_treesitter = true,
			})
			codewindow.apply_default_keybinds()
		end,
		keys = '<leader>m'
	},
	{
		'echasnovski/mini.animate',
		cond = false,
		lazy = false,
		config = function()
			local animate = require('mini.animate')
			animate.setup({
				cursor = {
					timing = animate.gen_timing.linear({duration = 200, unit = 'total'}),
					path = animate.gen_path.line(),
				},
				scroll = {
					enable = false,
				},
			})
		end,
	},
	{
		'shortcuts/no-neck-pain.nvim',
		version = '*',
		config = true,
		cmd = {'NoNeckPain'}
	},
	{
		'hood/popui.nvim',
		enabled = false,
		lazy = false,
		config = function()
			vim.ui.select = require('popui.ui-overrider')
			vim.ui.input = require('popui.input-overrider')
			vim.api.nvim_set_keymap(
				'n', "<leader>'", ':lua require("popui.marks-manager")()<CR>',
				{noremap = true, silent = true}
			)
		end,
	},
	{
		'cpea2506/relative-toggle.nvim',
		event = 'VeryLazy',
	},
	{
		'm4xshen/smartcolumn.nvim',
		event = 'VeryLazy',
		opts = {scope = 'window'}
	},
	{
		'ziontee113/icon-picker.nvim',
		dependencies = 'stevearc/dressing.nvim',
		opts = {disable_legacy_commands = true,},
		cmd = { 'IconPickerNormal', 'IconPickerYank' },
	},
	{
		'stevearc/dressing.nvim',
		opts = {
			select = { builtin = { min_width = { 50, 0.3 } } },
		}
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		cmd = 'Telescope',
	},
	{
		'echasnovski/mini.colors',
		-- lazy tries to look for a 'mini' module if you use config = true
		config = function()
			require'mini.colors'.setup()
		end,
		cmd = 'Colorscheme',
	},
	{
		'mawkler/modicator.nvim',
		enabled = true,
		event = 'VeryLazy',
		config = true,
	},
}
