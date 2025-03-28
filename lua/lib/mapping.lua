local M = {}
-- TODO: make a factory to do make these shortcuts
-- To do this you need to know Lua getattr-type thing
function M.map(mode, lhs, rhs, opts)
	opts = opts or {}
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
function M.del_map(mode, lhs)
	opts = opts or {}
	vim.api.nvim_del_keymap(mode, lhs)
end
function M.bmap(mode, lhs, rhs, opts)
	-- buffer-local map
	opts = opts or {}
	vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
end
function M.del_bmap(mode, lhs)
	-- buffer-local unmap
	vim.api.nvim_buf_del_keymap(0, mode, lhs)
end
return M
