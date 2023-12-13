-- miscellaneous collection of custom commands
local api = vim.api

scripts = require('scriptutils')
pager = require'config.pager'

local commands = {
	{'SheBang', scripts.write_shebang, {nargs='?'}},
	{'PyScript', scripts.pyscript, {}},
	{'PerlScript', scripts.perlscript, {}},
	-- {'Trim', require'whitespace'.trim_whitespace, {}},
	{'PagerEnable', pager.enable, {}},
	{'PagerDisable', pager.disable, {}},
	{'PagerToggle', pager.toggle, {}},
}
for i, args in ipairs(commands) do
	api.nvim_create_user_command(unpack(args))
end
