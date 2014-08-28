#!/usr/bin/env  python
# vim: set fileencoding=utf-8:

from itertools import cycle
import re

TODO = 'TODO:'
TASK_STATES = [TODO, 'DONE:', 'WONT:','WAITING:'] 

def toggle_todo(line):

# Alternate to the next task state in the cycle.
    statecycle = cycle(TASK_STATES)
    next = statecycle.next()

    for state in TASK_STATES:
        current, next = next, statecycle.next()
#         print current
        replacer = re.compile(current, re.IGNORECASE)

        if current.lower() in line.lower():
            # Return the line with current replaced with next.
            return replacer.sub(next, line)

    # If we didn't do a replace, add a TODO at the beginning.
    prefix = ''
    if line.startswith('#'):
        line = line.lstrip('#')
        prefix += '#'

    todoer = re.compile('^', re.IGNORECASE)
    return prefix + todoer.sub(TODO + ' ', line, count = 1)

def list_todos(filelist):
    ''' List all TODO lines from a file. '''
#    count = 0
    interesting_lines = ['TODO']
    result_list = []
    for filename in filelist:
      # print arg
      f = open(filename, 'r')
      lines = f.readlines()
      f.close()
      for line in lines:
        for mark in interesting_lines:
          if mark in line:
            result_list.append(line.replace('\n', ''))
#           count += 1
    return result_list
#     print "Found %d TODO lines." % count

def todo_progress(filelist):
    DONE = 'done:'
    TODO = 'todo:'
    WAITING = 'waiting:'

    word_count = {}
    for filename in filelist:
        f = open(filename, 'r')
        content = f.readlines()
        f.close()
        done = 0
        todo = 0
        waiting = 0

        for line in content:
            low_line = line.lower()
            if TODO in low_line:
                todo+=1
            elif DONE in low_line:
                done+= 1
            elif WAITING in low_line:
                waiting += 1

    return "Completed: %d/%d" % (done, todo+waiting+done)
