vim-todo
========
vim-todo_ is a Vim plugin that adds shortcuts 
to add and remove TODO: to lines in files.

.. _vim-todo: http://github.com/edthedev/vim-todo

Installation 
-----------------------------
This plugin is packaged for use with Vundle_.
This plugin requires Vim_ to be compiled with Python_ support.

.. _Vim: http://vim.org/about.php
.. _Python: http://python.org
.. _Vundle: https://github.com/gmarik/vundle/blob/master/README.md 

Install Vundle_ and then add 'edthedev/vim-rst' to your .vimrc.::

    Bundle 'edthedev/vim-todo'

Then, from within Vim, run BundleInstall.::

    :BundleInstall

Configuration
--------------

Enable the built in keyboard mappings with::

	let g:vim_todo_keys = 1

Keyboard Mappings
------------------

Default shortcut mappings are:

1. Toggle the current line between TODO, DONE, WAITING, and WONT.  A line with none of those will gain TODO: at the beginning.::

	<Leader>od 

2. List all TODO lines in the current buffer::

	<Leader>ol

3. Display completion count of TODO and DONE lines for the current buffer. i.e. Completed: 1/4::

    <Leader>op

Syntax Highlighting
--------------------
This syntax highlighting depends on very simple markdown-like checklists.

	Location 1, Person 1
		[ ] Item 1
		[ ] Item 2
		[x] Completed Item
	Location 2, Person 2
		[x] Completed Item
		[ ] Item 1
		[x] Completed Item

This plugin will automatically apply the syntax highlighting to files named `*.todo`.

The syntax highlighting is thanks to https://github.com/tomswartz07/vim-todo
