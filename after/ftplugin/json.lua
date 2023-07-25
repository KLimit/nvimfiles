local api = vim.api

vim.g.vim_json_conceal = 0
vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2

-- use the json python module for validation; it's reasonable to expect that
-- it's already there and if it encounters an error, it mentions where
local json = api.nvim_create_augroup("JSONValidate", {clear=true})
api.nvim_create_autocmd({"BufWritePre"}, {
	group = json,
	pattern = '*.json',
	callback = require('jsonvalidate').validate
})
