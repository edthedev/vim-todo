'''Unit tests for vim-todo'''
import unittest
import vim_todo

RAW_LINE = 'I will not do this.'
TODO_LINE = 'TODO: I will not do this.'
WONT = 'WONT:'
WONT_LINE = 'WONT: I will not do this.'


class TestToggleMethods(unittest.TestCase):
    ''' Test some toggle methods. '''

    def test_set_todo(self):
        ''' Confirm  set_todo works as expected. '''

        result = vim_todo.set_todo(TODO_LINE, WONT)
        self.assertEqual(result, WONT_LINE)
        
        result = vim_todo.set_todo(RAW_LINE, WONT)
        self.assertEqual(result, WONT_LINE)


if __name__ == '__main__':
    unittest.main()
