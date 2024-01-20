scriptencoding utf-8
" set mapleader before lazyplugins
let g:mapleader = ','
" set a global colorscheme variable for lazy to use
" NOTE: colors_name might not be a good variable name since it gets set by the
" colorscheme when set (or is supposed to be set)
let g:colors_name = 'citruszest'
lua require('lazyplugins')
lua require('maps')
lua require('autocommands')
lua require('commands')
" load the colorscheme variable after lazy loads everything
execute 'colorscheme ' . g:colors_name
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

lua require('guis')

if has('win32')
	" shell
	" more than just setting shell to pwsh -- see shell-powershell
	let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
	let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
	let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
	let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	set shellquote=
	set shellxquote=
endif
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
