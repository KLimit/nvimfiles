local opt = vim.opt

local left = '%2{mode()} | %n %f%([%M%R%H%W]%)'
local right = '%y | %l:%c (%p%%)'
opt.statusline = left .. '%=' .. right .. ' '

-- lualine's layout
-- mode | buffers | aerial || encoding, newline, filetype | row:col  | percent | time
-- color changes based on mode
