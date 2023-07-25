local M = {}

function M.validate (exargs)
	-- use vim.json to validate by trying to encode the current buffer
	local content = vim.api.nvim_buf_get_lines(0, 0, -1, true)
	content = table.concat(content, '\n')
	vim.json.decode(content)
end

return M
