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
# TODO: Proect against quotes.. 
# updated = updated.replace('"', '\"')
# TODO: Figure out how to make the function return this...
# vim.command('return "%s"' % updated)
# Test here...
vim.command("let l:result = '%s'" % updated)
endpython
return l:result
" if l:something == 1
" "     return 'hi'
" else
" "     return 'bye'
" endif
endfunction

" Testing...

" command! -nargs=0 -range=1 TodoToggle call TodoToggle()

" Map keyboard shortcuts by default.
if !exists('g:vim_todo_map_keys')
	let g:vim_todo_map_keys = 1
endif

if g:vim_todo_map_keys

	" Done / Todo
""	nnoremap <Leader>od :.TodoToggle<Cr>$
	nnoremap <Leader>od :s/.*/\=TodoToggle()/<Cr>$

	" nnoremap <Leader>d :.!text-task-toggle<Cr>$
	nnoremap <Leader>ol :!text-list-todos %<Cr>

	" Sort file by completed vs TODO lines
	" :nnoremap <Leader>os :%!done_to_top<Cr>

	" List organizer progress of TODO / DONE / WAITING
	:nnoremap <Leader>op :!text-task-progress %<Cr>
	" Waiting 
	:nnoremap <Leader>ow :.!text-task-toggle -w<Cr>$

endif
