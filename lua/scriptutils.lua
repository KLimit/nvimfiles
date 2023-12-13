local api = vim.api
local cattable = require'lib.cattable'

local shebang = '#!/usr/bin/env '

local M = {}

function M.write_shebang (exargs)
	local target = exargs.args
	if target == '' then target = 'python3' end
	api.nvim_buf_set_lines(0, 0, 0, false, {shebang .. target})
end

-- TODO: set filetype if not set for "script" functions

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
	local head = cattable(
		{shebang .. 'python3'},
		imports,
		{'', ''},
		main,
		{'', ''},
		mainargs
	)
	local tail = cattable(
		{'', ''},
		namemain
	)
	api.nvim_buf_set_lines( 0, 0, 0, false, head )
	api.nvim_buf_set_lines(0, -1, -1, false, tail)
end

function M.perlscript(exargs)
	local uses = {'use strict;', 'use warnings;'}
	local loop = {'while(<>) {', '\tprint;', '}'}
	api.nvim_buf_set_lines( 0, 0, 0, false,
		cattable({shebang .. 'perl'}, uses, {''}, loop)
	)
end

return M
