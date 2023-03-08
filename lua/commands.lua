-- miscellaneous collection of custom commands
local api = vim.api

api.nvim_create_user_command(
	'PyScript',
	function(args)
		local index = api.nvim_win_get_cursor(0)[1] - 1
		api.nvim_buf_set_lines(
			0,
			index,
			index,
			false,
			{
				'#!/usr/bin/env python3',
				'', '',
				'def main(*args, **kwargs):',
				'    return 0',
				'', '',
				'def mainargs(argv=None)',
				'    import argparse',
				'    pser = argparse.ArgumentParser()',
				'',
				'    args = pser.parse_args(argv)',
				'    return vars(args)',
				'', '',
				'if __name__ == "__main__":',
				'    import sys',
				'    sys.exit(main(**mainargs()))'
			}
		)
	end,
	{}
)
