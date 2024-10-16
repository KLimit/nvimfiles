-- set textwidth to PEP8 standard
-- set auto comment wrapping, comment formatting w/ 'gq', recognizing numbered
-- lists
vim.bo.textwidth = 79
vim.bo.formatoptions = 'cqrn'
vim.g.python_indent = {
	open_paren = 'shiftwidth()',
	nested_paren = 'shiftwidth()',
	continue = 'shiftwidth()',
}
vim.bo.makeprg = 'pyflakes %:S'
