" pydoc.vim: pydoc viewer
" ======================
"
" Tries to open a pydoc file in a new window

if exists('g:loaded_pydoc')
	finish
endif
let g:loaded_pydoc = 1

function! pydoc#pydoc(obj) abort
	exec 'split new'
	exec 'r!python C:/Python27/Lib/pydoc.py ' . a:obj
endfunction

function! pydoc#hello()
	echo "hello"
endfunction
