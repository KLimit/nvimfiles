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

-- setup plugins
-- plugins should be a table (list with plugin spec) or string (lua module name
-- that contains a plugin spec)
-- opts (optional configuration)
require("lazy").setup(
	"specs",
	{
		defaults = {
			lazy = true,
		},
		install = {
			missing = true,
			colorscheme = {'moonfly'},
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
	}
)
