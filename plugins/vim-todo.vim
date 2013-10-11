" =======================================================
" TODO Management 
" =======================================================
"  Probably should be it's own separate plugin...
" Done / Todo
map <Leader>od :.!text-task-toggle<Cr>$ 
map <Leader>d :.!text-task-toggle<Cr>$ 
map <Leader>ol :!text-list-todos %<Cr>

" Sort file by completed vs TODO lines
" :map <Leader>os :%!done_to_top<Cr>

" List organizer progress of TODO / DONE / WAITING
:map <Leader>op :!text-task-progress %<Cr>
" Waiting 
:map <Leader>ow :.!text-task-toggle -w<Cr>$ 



