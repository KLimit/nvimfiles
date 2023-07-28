-- make viewing help files more pager-like
local map = require('maps').bmap
local opt = vim.opt_local
map('n', 'j', '<C-E>')
map('n', 'k', '<C-Y>')
map('n', 'd', '<C-D>', {nowait=true})
map('n', 'u', '<C-U>')
map('n', '<C-K>', 'k', {noremap=true})
map('n', 'q', ':q<CR>', {nowait=true})
opt.cursorline = false
