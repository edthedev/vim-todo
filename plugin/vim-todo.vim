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

function! TodoToggle()
python << endpython
line = vim.eval("getline(line('.'))")
updated = vim_todo.toggle_todo(line)
vim.command("let l:result = '%s'" % updated)
endpython
return l:result
endfunction

function! TodoList()
python << endpython
# print dir(vim_todo)
this_file = vim.eval("bufname('%')")
list_of_todos = vim_todo.list_todos([this_file])
for todo in list_of_todos:
	vim.command("echom '%s'" % todo)
endpython
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
	:nnoremap <Leader>ol :call TodoList()

	" nnoremap <Leader>d :.!text-task-toggle<Cr>$
	"nnoremap <Leader>ol :!text-list-todos %<Cr>

	" Sort file by completed vs TODO lines
	" :nnoremap <Leader>os :%!done_to_top<Cr>

	" List organizer progress of TODO / DONE / WAITING
	" ":nnoremap <Leader>op :!text-task-progress %<Cr>
	" Waiting 
	" ":nnoremap <Leader>ow :.!text-task-toggle -w<Cr>$

endif
