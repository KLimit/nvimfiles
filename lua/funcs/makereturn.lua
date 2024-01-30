-- make a `identifier = expression` into a `return expression`
local M = {}

local api = vim.api

-- try to capture very generally-shaped assignments
-- CONSIDER: if you want to support more languages, make a table of patterns
local assign_pattern = '[%w_]*%s*:?=%s*'
local assign_string = '= '


local return_pattern = 'return%s+'
local return_string = 'return '

-- substitute pat for sub on current line
local function sub_current_line(pat, sub)
	local line = api.nvim_get_current_line()
	local subbed = string.gsub(line, pat, sub)
	if line ~= subbed then
		api.nvim_set_current_line(subbed)
	end
end


M.make_return = function() sub_current_line(assign_pattern, return_string) end
M.make_assign = function() sub_current_line(return_pattern, assign_string) end

-- function M.make_return()
-- 	sub_current_line(assign_pattern, return_string)
-- end
--
-- function M.make_assign()
-- 	sub_current_line(return_pattern, assign_string)
-- end

function M.toggle()
	local line = api.nvim_get_current_line()
	if string.find(line, return_pattern) then
		M.make_assign()
	elseif string.find(line, assign_pattern) then
		M.make_return()
	end
end


return M
