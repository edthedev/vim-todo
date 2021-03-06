" =======================================================
" TODO Management 
" =======================================================

if !has('python')
	echo "Error: vim-todo requires vim compiled with +python"
		finish
endif

let s:path = expand('<sfile>:p:h')

python << endpython
import sys
import os
import vim
script_path = vim.eval('s:path')
lib_path = os.path.join(script_path, '..')
sys.path.insert(0, lib_path)
import vim_todo 
endpython


function! TodoSet(state)
let s:line = getline(line('.'))
let s:cleanline = substitute(s:line, "'", "''", "g")

python << endpython
args = {
	'line':vim.eval("s:cleanline"),
	'state':vim.eval("a:state"),
}
updated = vim_todo.set_todo(**args)
vim.command("let l:result = '%s'" % updated)
endpython
let l:cleanresult = substitute(l:result, "\'", "'", "g")
return l:cleanresult
endfunction

function! TodoToggle()
let s:line = getline(line('.'))
" let s:cleanline = escape(s:line, '''')
let s:cleanline = substitute(s:line, "'", "''", "g")
" line = vim.eval("substitute(getline(line('.')),\"'\", \"g\")")

python << endpython
line = vim.eval("s:cleanline")
print line
updated = vim_todo.toggle_todo(line)
vim.command("let l:result = '%s'" % updated)
endpython
let l:cleanresult = substitute(l:result, "\'", "'", "g")
return l:cleanresult
endfunction

function! TodoProgress()
python << endpython
# print dir(vim_todo)
this_file = vim.eval("bufname('%')")
progress_line = vim_todo.todo_progress([this_file])
vim.command("echom '%s'" % progress_line)
endpython
endfunction

" Quicklist all TODO lines in all open buffers.
function! TodoList()
	" Create a blank quicklist.
	cex []
	" Find all TODO items in all open buffers.
	bufdo vimgrepadd /TODO/ %
	" Open the quicklist, if it is not empty.
	cw
endfunction

" Map keyboard shortcuts by default.
if !exists('g:vim_todo_keys')
	let g:vim_todo_keys = 1
endif

if g:vim_todo_keys

	" Done / Todo
	" TODO: Could probably pass the captured group as an argument to
	" TodoToggle...
" TODO: Capture comment characters as a first group, and put them back at the
" front.
	:nnoremap <Leader>od :s/.*/\=TodoToggle()/<Cr>$
	:nnoremap <Leader>ol :call TodoList()<Cr>

	" List organizer progress of TODO / DONE / WAITING
	:nnoremap <Leader>op :call TodoProgress()<Cr>

	:nnoremap <Leader>ow :call TodoSet('WONT:')<Cr>
	" Sort file by completed vs TODO lines
	" :nnoremap <Leader>os :%!done_to_top<Cr>

	" Waiting 
	" ":nnoremap <Leader>ow :.!text-task-toggle -w<Cr>$

endif
