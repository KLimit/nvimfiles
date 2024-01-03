-- using lazy.nvim

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- set mapleader before lazy to make sure mappings are what I want
vim.g.mapleader = ","

specs = 'specs'

require("lazy").setup(
	specs,
	{
		defaults = {
			lazy = true,
		},
		install = {
			missing = true,
			colorscheme = {vim.g.colors_name},
		},
		ui = {
			size = { width = 0.9, height = 0.9 },
			icons = {
				cmd = "⌘",
				config = "🔧",
				event = "⏰",
				ft = "🗁",
				init = "⚙",
				keys = "⌨",
				plugin = "🔌",
				runtime = "🖵",
				source = "🗎",
				start = "↳",
				task = "📌",
				lazy = "⏾",
			},
		},
		config = {
			checker = true,
			concurrency = 3,
		},
		dev = {
			path = '~/documents/nvim-plugins',
			fallback = true,
		},
	}
)
