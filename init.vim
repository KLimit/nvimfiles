scriptencoding utf-8
" set mapleader before lazyplugins
let g:mapleader = ','
lua require('lazyplugins')
lua require('maps')
lua require('autocommands')
lua require('commands')
" high-level operational stuff
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:netrw_banner = 0
if has('persistent_undo')
	set undofile
endif
set backup
set backupdir-=.
if &modifiable
	set fileencoding=utf-8
endif
if has('syntax')
	syntax on
endif
if has('filetype')
	filetype indent plugin on
endif
set autoindent
" gui (possibly neovide-specific)
set guifont=Fairfax\ Hax\ HD:h12

if exists("g:neovide")
	" let g:neovide_remember_window_size = v:true
	let g:neovide_scale_factor=1.0
	let g:neovide_cursor_animation_length=0.03
	let g:neovide_cursor_trail_size = 0.6
	let g:neovide_cursor_unfocused_outline_width = 0.06
	let g:neovide_remember_window_size = v:false
	let g:neovide_fullscreen = v:false
	let g:neovide_padding_top = 9
	let g:neovide_padding_bottom = 9
	let g:neovide_padding_right = 9
	let g:neovide_padding_left = 9
	let g:neovide_no_idle = v:true
	let g:neovide_refresh_rate = 30
endif
if exists("g:neoray")
	set guifont=FairfaxHaxHD:h12
	NeoraySet KeyFullscreen <>
	NeoraySet KeyZoomIn <C-=>
	NeoraySet KeyZoomOut <C-->
endif
" appearance
colorscheme eva01
" shell
" more than just setting shell to pwsh -- see shell-powershell
let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote=
set shellxquote=
" ui/nav/function
set belloff=all
set number
set relativenumber
set numberwidth=3
set nowrap
set scrolloff=3
set incsearch
set inccommand=nosplit
set nohlsearch
set ignorecase
set smartcase
set colorcolumn=80
set wildmenu
set splitright
set showtabline=1
set textwidth=80
set termguicolors
set cursorline
set nocursorcolumn
" statusline/tabline/winbar
set laststatus=3
set rulerformat=%4(%P%)
" entry
set tabstop=4
set shiftwidth=0
set softtabstop=-1
set noexpandtab
set nosmarttab
set backspace=indent,eol,start
set formatoptions+=tcqn
set iskeyword+=-
set iskeyword+=_
set list
set listchars+=trail:░
