scriptencoding utf-8
lua require('lazyplugins')
lua require('autocommands')
lua require('commands')
" lua require('aerial')
" high-level operational stuff
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
if has('filetype')
	filetype indent plugin on
endif
set autoindent
if has('syntax')
	syntax on
endif
if has('persistent_undo')
	set undofile
endif
set backup
set backupdir-=.
if &modifiable
	set fileencoding=utf-8
endif
" gui (possibly neovide-specific)
" set guifont=3270SemiNarrow\ NF:h10
" set guifont=Liga\ SFMono\ Nerd\ Font:h10
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
endif
" appearance
" colorscheme rose-pine
" colorscheme oxocarbon
colorscheme moonfly
"shell
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
set nofoldenable
set termguicolors
set cursorline
set nocursorcolumn
let g:netrw_banner = 0
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
" keys
if has('win32')
	" stupid stupid stupid
	nmap <C-z> <Nop>
endif
let g:mapleader = ","
nmap <F3> :JABSOpen<CR>
nmap <F5> :Neogit<CR>
nmap <F8> :AerialToggle!<CR>
" nmap <F9> :ZenMode<CR>
nmap <F9> :NoNeckPain<CR>
nmap <F10> :lua require('codewindow').toggle_minimap()<CR>
" nmap <Leader>s :lua require('alternate-toggler').toggleAlternate()<CR>
" imap <C-e> <C-o>:BulletDemote<cr>

" augroup Shenzhen
" 	autocmd!
" 	autocmd FileType shenzhen-solitaire setlocal colorcolumn=
" 	autocmd FileType shenzhen-solitaire :IndentBlanklineDisable
" augroup end

""" PLUGIN SETTINGS
" bullets.vim settings
let g:bullets_set_mappings = 1
" csv.vim settings
if exists("g:csv_no_conceal")
	unlet g:csv_no_conceal
endif
if exists("g:csv_highlight_column")
	unlet g:csv_highlight_column
endif
let g:csv_hiGroup='TabLineFill'
" augroup CSV_Editing
" 	autocmd!
" 	autocmd BufRead,BufWritePost *.csv :%ArrangeColumn
" 	autocmd BufWritePre *.csv :%UnArrangeColumn
" 	autocmd FileType csv setlocal colorcolumn=
" augroup end
hi link CSVColumnOdd Normal
hi link CSVColumnEven Character
hi link CSVDelimiter Comment
" ALE settings
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'python': ['autopep8', 'autoflake', 'black']
\}
let g:ale_linters = {
\	'python': ['pycodestyle', 'flake8', 'pylint', 'pydocstyle'],
\	'json': ['jsonlint']
\	}
let g:ale_lint_on_text_changed='normal'
