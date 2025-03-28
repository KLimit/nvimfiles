-- swap current character with next character

local api = vim.api
-- abcdefg
local function swapchar()
	local row, col = unpack(api.nvim_win_get_cursor(0))
	local line = api.nvim_get_current_line()
	-- lua strings are 1-indexed; col from nvim_win_get_cursor is 0-indexed
	col = col + 1
	-- a b -- b a
	local ab = line:sub(col, col+1)
	local ba = ab:reverse()
	line = line:sub(1, col-1) .. ba .. line:sub(col+2, -1)
	api.nvim_set_current_line(line)
end

return swapchar
