vim.opt.guifont = 'Fairfax Hax HD:h12'
if vim.g.neovide then
	-- vim.g.neovide_remember_window_size = v:true
	vim.g.neovide_scale_factor=1.0
	vim.g.neovide_cursor_animation_length=0.03
	vim.g.neovide_cursor_trail_size = 0.6
	vim.g.neovide_cursor_unfocused_outline_width = 0.06
	vim.g.neovide_remember_window_size = false
	vim.g.neovide_fullscreen = false
	vim.g.neovide_padding_top = 9
	vim.g.neovide_padding_bottom = 9
	vim.g.neovide_padding_right = 9
	vim.g.neovide_padding_left = 9
	vim.g.neovide_no_idle = true
	vim.g.neovide_refresh_rate = 30
end
if vim.g.neoray then
	vim.o.guifont = 'FairfaxHaxHD:h12'
	vim.cmd('NeoraySet KeyFullscreen <>')
	vim.cmd('NeoraySet KeyZoomIn <C-=>')
	vim.cmd('NeoraySet KeyZoomOut <C-->')
end
