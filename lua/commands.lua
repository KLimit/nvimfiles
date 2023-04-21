-- miscellaneous collection of custom commands
local api = vim.api

local shebang = '#!/usr/bin/env '

function write_shebang (exargs)
	local target = exargs.args
	if target == '' then target = 'python3' end
	api.nvim_buf_set_lines(0, 0, 0, false, {shebang .. target})
end
api.nvim_create_user_command('SheBang', write_shebang, {nargs='?'} )

function pyscript(exargs)
	-- local index = api.nvim_win_get_cursor(0)[1] - 1
	local main = {'def main(*args, **kwargs):', '    return 0'}
	local mainargs = {
		'def mainargs(argv=None):',
		'    import argparse',
		'    pser = argparse.ArgumentParser()',
		'',
		'    args = pser.parse_args(argv)',
		'    return vars(args)',
	}
	local namemain = {
		'if __name__ == "__main__":',
		'    import sys',
		'    sys.exit(main(**mainargs()))',
	}
	for i, chunk in ipairs({
		{shebang .. 'python3'},
		main,
		{'', ''},
		mainargs,
		{'', ''},
		namemain,
	}) do
		api.nvim_buf_set_lines( 0, -1, -1, false, chunk )
	end
end

api.nvim_create_user_command( 'PyScript', pyscript, {} )
