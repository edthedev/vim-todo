" =======================================================
" TODO Management 
" =======================================================


if !has('python')
	echo "Error: vim-todo requires vim compiled with +python"
		finish
	endif

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
