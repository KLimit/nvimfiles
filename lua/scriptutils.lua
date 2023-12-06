local M = {}
local api = vim.api

local shebang = '#!/usr/bin/env '

function M.write_shebang (exargs)
	local target = exargs.args
	if target == '' then target = 'python3' end
	api.nvim_buf_set_lines(0, 0, 0, false, {shebang .. target})
end

function M.pyscript(exargs)
	-- local index = api.nvim_win_get_cursor(0)[1] - 1
	local imports = {'import argparse', 'import sys'}
	local main = {'def main(*args, **kwargs):', '    return 0'}
	local mainargs = {
		'def mainargs(argv=None):',
		'    pser = argparse.ArgumentParser()',
		'    args = pser.parse_args(argv)',
		'    return vars(args)',
	}
	local namemain = {
		'if __name__ == "__main__":',
		'    sys.exit(main(**mainargs()))',
	}
	for i, chunk in ipairs({
		{shebang .. 'python3'},
		imports,
		{'', ''},
		main,
		{'', ''},
		mainargs,
		{'', ''},
		namemain,
	}) do
		api.nvim_buf_set_lines( 0, -1, -1, false, chunk )
	end
end

return M
