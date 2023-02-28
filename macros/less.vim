" Vim script to work like "less"
" Original Maintainer:	Bram Moolenaar <Bram@vim.org>
" Now Maintainer: Henry Limm
" Last Change:	2023 Jan 17

" Avoid loading this file twice, allow the user to define his own script.
if exists("loaded_less")
  finish
endif
let loaded_less = 1

" If not reading from stdin, skip files that can't be read.
" Exit if there is no file at all.
if argc() > 0
  let s:i = 0
  while 1
    if filereadable(argv(s:i))
      if s:i != 0
	sleep 3
      endif
      break
    endif
    if isdirectory(argv(s:i))
      echomsg "Skipping directory " . argv(s:i)
    elseif getftime(argv(s:i)) < 0
      echomsg "Skipping non-existing file " . argv(s:i)
    else
      echomsg "Skipping unreadable file " . argv(s:i)
    endif
    echo "\n"
    let s:i = s:i + 1
    if s:i == argc()
      quit
    endif
    next
  endwhile
endif

" we don't want 'compatible' here
if &cp
  setlocal nocp
endif

" enable syntax highlighting if not done already
if !get(g:, 'syntax_on', 0)
  syntax enable
endif

setlocal so=0
setlocal hlsearch
setlocal incsearch
nohlsearch
" Don't remember file names and positions
setlocal shada=
setlocal nows
" Inhibit screen updates while searching
let s:lz = &lz
setlocal lz

" Allow the user to define a function, which can set options specifically for
" this script.
if exists('*LessInitFunc')
  call LessInitFunc()
endif

" Used after each command: put cursor at end and display position
if &wrap
  noremap <buffer> <SID>L L0:redraw<CR>:file<CR>
  au VimEnter * normal! L0
else
  noremap <buffer> <SID>L Lg0:redraw<CR>:file<CR>
  au VimEnter * normal! Lg0
endif

" When reading from stdin don't consider the file modified.
au VimEnter * setlocal nomod

" Can't modify the text or write the file.
setlocal nomodifiable readonly

" Give help
noremap <buffer> h :call <SID>Help()<CR>
map <buffer> H h
fun! s:Help()
  echo "<Space>   One page forward          b         One page backward"
  echo "d         Half a page forward       u         Half a page backward"
  echo "<Enter>   One line forward          k         One line backward"
  echo "G         End of file               g         Start of file"
  echo "N%        percentage in file"
  echo "\n"
  echo "/pattern  Search for pattern        ?pattern  Search backward for pattern"
  echo "n         next pattern match        N         Previous pattern match"
  if &foldmethod != "manual"
  echo "\n"
    echo "zR        open all folds            zm        increase fold level"
  endif
  echo "\n"
  echo ":n<Enter> Next file                 :p<Enter> Previous file"
  echo "\n"
  echo "q         Quit                      v         Edit file"
  let i = input("Hit Enter to continue")
endfun

" Scroll one page forward
noremap <buffer> <script> <Space> :call <SID>NextPage()<CR><SID>L
map <buffer> <C-V> <Space>
map <buffer> f <Space>
map <buffer> <C-F> <Space>
map <buffer> <PageDown> <Space>
map <buffer> <kPageDown> <Space>
map <buffer> <S-Down> <Space>
" If 'foldmethod' was changed keep the "z" commands, e.g. "zR" to open all
" folds.
if &foldmethod == "manual"
  map <buffer> z <Space>
endif
map <buffer> <Esc><Space> <Space>
fun! s:NextPage()
  if line(".") == line("$")
    if argidx() + 1 >= argc()
      " Don't quit at the end of the last file
      return
    endif
    next
    1
  else
    exe "normal! \<C-F>"
  endif
endfun

" Re-read file and page forward "tail -f"
map <buffer> F :e<CR>G<SID>L:sleep 1<CR>F

" Scroll half a page forward
noremap <buffer> <script> d <C-D><SID>L
map <buffer> <C-D> d

" Scroll one line forward
noremap <buffer> <script> <CR> <C-E><SID>L
map <buffer> <C-N> <CR>
map <buffer> e <CR>
map <buffer> <C-E> <CR>
map <buffer> j <CR>
map <buffer> <C-J> <CR>
map <buffer> <Down> <CR>

" Scroll one page backward
noremap <buffer> <script> b <C-B><SID>L
map <buffer> <C-B> b
map <buffer> <PageUp> b
map <buffer> <kPageUp> b
map <buffer> <S-Up> b
map <buffer> w b
map <buffer> <Esc>v b

" Scroll half a page backward
noremap <buffer> <script> u <C-U><SID>L
noremap <buffer> <script> <C-U> <C-U><SID>L

" Scroll one line backward
noremap <buffer> <script> k <C-Y><SID>L
map <buffer> y k
map <buffer> <C-Y> k
map <buffer> <C-P> k
map <buffer> <C-K> k
map <buffer> <Up> k

" Redraw
noremap <buffer> <script> r <C-L><SID>L
noremap <buffer> <script> <C-R> <C-L><SID>L
noremap <buffer> <script> R <C-L><SID>L

" Start of file
noremap <buffer> <script> g gg<SID>L
map <buffer> < g
map <buffer> <Esc>< g
map <buffer> <Home> g
map <buffer> <kHome> g

" End of file
noremap <buffer> <script> G G<SID>L
map <buffer> > G
map <buffer> <Esc>> G
map <buffer> <End> G
map <buffer> <kEnd> G

" Go to percentage
noremap <buffer> <script> % %<SID>L
map <buffer> p %

" Search
noremap <buffer> <script> / H$:call <SID>Forward()<CR>/
if &wrap
  noremap <buffer> <script> ? H0:call <SID>Backward()<CR>?
else
  noremap <buffer> <script> ? Hg0:call <SID>Backward()<CR>?
endif

fun! s:Forward()
  " Searching forward
  noremap <buffer> <script> n H$nzt<SID>L
  if &wrap
    noremap <buffer> <script> N H0Nzt<SID>L
  else
    noremap <buffer> <script> N Hg0Nzt<SID>L
  endif
  cnoremap <buffer> <silent> <script> <CR> <CR>:cunmap <buffer> <lt>CR><CR>zt<SID>L
endfun

fun! s:Backward()
  " Searching backward
  if &wrap
    noremap <buffer> <script> n H0nzt<SID>L
  else
    noremap <buffer> <script> n Hg0nzt<SID>L
  endif
  noremap <buffer> <script> N H$Nzt<SID>L
  cnoremap <buffer> <silent> <script> <CR> <CR>:cunmap <buffer> <lt>CR><CR>zt<SID>L
endfun

call s:Forward()
cunmap <buffer> <CR>

" Quitting
noremap <buffer> q :q<CR>

" Switch to editing (switch off less mode)
map <buffer> v :silent call <SID>End()<CR>
fun! s:End()
  setlocal ma
  if exists('s:lz')
    let &lz = s:lz
  endif
  unmap <buffer> h
  unmap <buffer> H
  unmap <buffer> <Space>
  unmap <buffer> <C-V>
  unmap <buffer> f
  unmap <buffer> <C-F>
  unmap <buffer> z
  unmap <buffer> <Esc><Space>
  unmap <buffer> F
  unmap <buffer> d
  unmap <buffer> <C-D>
  unmap <buffer> <CR>
  unmap <buffer> <C-N>
  unmap <buffer> e
  unmap <buffer> <C-E>
  unmap <buffer> j
  unmap <buffer> <C-J>
  unmap <buffer> b
  unmap <buffer> <C-B>
  unmap <buffer> w
  unmap <buffer> <Esc>v
  unmap <buffer> u
  unmap <buffer> <C-U>
  unmap <buffer> k
  unmap <buffer> y
  unmap <buffer> <C-Y>
  unmap <buffer> <C-P>
  unmap <buffer> <C-K>
  unmap <buffer> r
  unmap <buffer> <C-R>
  unmap <buffer> R
  unmap <buffer> g
  unmap <buffer> <
  unmap <buffer> <Esc><
  unmap <buffer> G
  unmap <buffer> >
  unmap <buffer> <Esc>>
  unmap <buffer> %
  unmap <buffer> p
  unmap <buffer> n
  unmap <buffer> N
  unmap <buffer> q
  unmap <buffer> v
  unmap <buffer> /
  unmap <buffer> ?
  unmap <buffer> <Up>
  unmap <buffer> <Down>
  unmap <buffer> <PageDown>
  unmap <buffer> <kPageDown>
  unmap <buffer> <PageUp>
  unmap <buffer> <kPageUp>
  unmap <buffer> <S-Down>
  unmap <buffer> <S-Up>
  unmap <buffer> <Home>
  unmap <buffer> <kHome>
  unmap <buffer> <End>
  unmap <buffer> <kEnd>
endfun

" vim: sw=2
