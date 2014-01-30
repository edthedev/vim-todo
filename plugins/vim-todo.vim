" =======================================================
" TODO Management 
" =======================================================

if !has('python')
	echo "Error: vim-todo requires vim compiled with +python"
		finish
endif

let s:path = expand('<sfile>:p:h')

python << EOF

import sys
import os
import vim
script_path = vim.eval('s:path')
lib_path = os.path.join(script_path, '..')
sys.path.insert(0, lib_path)
import vim_todo 
# vim_todo.hello_world()
EOF

function! VimTodoHello()
python << EOF
vim_todo.hello_world()
EOF
endfunction



" Map keyboard shortcuts by default.
if !exists('g:vim_todo_map_keys')
	let g:vim_todo_map_keys = 1
endif

if g:vim_todo_map_keys

	" Done / Todo
	nnoremap <Leader>od :.!text-task-toggle<Cr>$
	" nnoremap <Leader>d :.!text-task-toggle<Cr>$
	nnoremap <Leader>ol :!text-list-todos %<Cr>

	" Sort file by completed vs TODO lines
	" :nnoremap <Leader>os :%!done_to_top<Cr>

	" List organizer progress of TODO / DONE / WAITING
	:nnoremap <Leader>op :!text-task-progress %<Cr>
	" Waiting 
	:nnoremap <Leader>ow :.!text-task-toggle -w<Cr>$

endif
