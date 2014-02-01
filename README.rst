vim-todo
========

vim-todo_ is a Vim plugin that adds shortcuts 
to add and remove TODO: to lines in files.

.. _vim-todo: http://github.com/edthedev/vim_todo

Configuration
--------------

Enable the built in keyboard mappings with:

	let g:vim_todo_keys = 1

Keyboard Mappings
------------------

Default shortcut mappings:

	<Leader>od - Toggle the current line.
		A line with TODO: or DONE: 
			will become the other.
		A line with neither will gain TODO:
	
	<Leader>ol - List all TODO lines
		in the current buffer.

