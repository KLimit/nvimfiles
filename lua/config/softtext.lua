local opt = vim.opt_local
local map = vim.keymap
-- we want soft wrapping
opt.wrap = true
-- don't want nvim to insert EOLs on its own
opt.textwidth = 0
opt.wrapmargin = 0
-- want to wrap on word boundaries
opt.linebreak = true
-- make the continued line easier to understand
opt.breakindent = true
opt.showbreak = "¶"
-- colorcolumn is annoying if you aren't using it
opt.colorcolumn = {0}
-- Would like to be able to jump lines with j and k the same as usual
map.set('n', 'j', 'gj', {buffer=true})
map.set('n', 'k', 'gk', {buffer=true})
-- since j and k move to soft lines, [count]j doesn't work for lines anymore
-- turning relno off makes it easier to jump to lines again
opt.relativenumber = false
opt.number = true
-- Would be nice to have spellchecking
opt.spell = true
opt.spelllang = 'en_us'
