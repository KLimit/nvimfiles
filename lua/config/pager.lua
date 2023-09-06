-- make viewing help files more pager-like
-- pager-like keymaps ant other configurations

local api = vim.api
local opt = vim.opt_local
local map = require('maps').bmap
local unmap = require('maps').del_bmap

local M = {}

M.keys = {
	{'j', '<C-E>'},
	{'k', '<C-Y>'},
	{'d', '<C-D>', {nowait=true}},
	{'u', '<C-U>'},
	{'<C-K>', 'k', {noremap=true}},
	{'q', ':q<CR>', {nowait=true}},
}

M.bufferstate = {}

local function get_bufferstate()
	local buf = api.nvim_get_current_buf()
	local bufstate = M.bufferstate[buf]
	if not bufstate then
		M.bufferstate[buf] = {}
	end
	return M.bufferstate[buf]
end

function M.enable()
	for i, mapping in ipairs(M.keys) do
		map('n', unpack(mapping))
	end
	local state = get_bufferstate()
	state.__enabled = true
	state.cursorline = opt.cursorline
	opt.cursorline = false
end

function M.disable()
	for i, mapping in ipairs(M.keys) do
		unmap('n', unpack(mapping))
	end
	local state = get_bufferstate()
	state.__enabled = false
	opt.cursorline = state.cursorline
end

function M.toggle()
	local state = get_bufferstate()
	if state.__enabled then
		M.disable()
	else
		M.enable()
	end
end

return M
