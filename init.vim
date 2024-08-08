scriptencoding utf-8
" set mapleader before lazyplugins
let g:mapleader = ','
" set a global colorscheme variable for lazy to use
" NOTE: colors_name might not be a good variable name since it gets set by the
" colorscheme when set (or is supposed to be set)
let g:colors_name = 'flow'
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:netrw_banner = 0
set termguicolors  " not sure if this needs to be before loading plugins
if has('nvim')
	lua require('lazyplugins')
	lua require('maps')
	lua require('autocommands')
	lua require('commands')
	lua require('guis')
	lua require('config.statusline')
	" lua require('config.statusline')
endif
" set colorscheme after colorscheme plugins are loaded
execute 'colorscheme ' . g:colors_name

if has('persistent_undo')
	set undofile
endif
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
set backspace=indent,eol,start
set backup
set backupdir-=.
set belloff=all
set colorcolumn=80
set cursorline
set formatoptions+=tcqn
set ignorecase
set inccommand=nosplit
set incsearch
set iskeyword+=-
set iskeyword+=_
set laststatus=3
set list
set listchars+=trail:░,tab:│\ 
set nocursorcolumn
set noexpandtab
set nohlsearch
set nosmarttab
set nowrap
set number
set numberwidth=3
set relativenumber
set rulerformat=%4(%P%)
set scrolloff=3
set shiftwidth=0
set showtabline=1
set smartcase
set softtabstop=-1
set splitright
set tabstop=4
set termguicolors
set textwidth=80
set wildmenu

if has('win32')
	" shell
	" more than just setting shell to pwsh -- see shell-powershell
	let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
	let &shellcmdflag = '-NoLogo -noprofile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
	let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
	set shellquote= shellxquote=
endif
