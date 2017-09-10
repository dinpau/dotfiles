#!/usr/bin/python3

import sys
import json
import subprocess
import os

dir_path=os.path.dirname(os.path.realpath(__file__))

MAX_TITLE_LENGTH = 45
    

def get_title():
    try:
        win_read = subprocess.check_output(['xdotool', 'getactivewindow',
            'getwindowname' ])
        win_title=win_read.decode('utf-8')
    except:
        win_title= ''
    return win_title
    #sys.stdout.write(spotify_status)


def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()


if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:

        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        # insert information into the start of the json, but could be anywhere
        # CHANGE THIS LINE TO INSERT SOMETHING ELSE
        title_string = format(get_title()).rstrip()
        if len(title_string) > MAX_TITLE_LENGTH:
            title_string = title_string[:MAX_TITLE_LENGTH-3] + '...' 
        if (title_string):
            j.insert(0, {'color' : '#87ceff',
                'full_text' : '{0}'.format(title_string) , 'name' : 'title'})
        # and echo back new encoded json
        print_line(prefix+json.dumps(j))
    else:
        j = json.loads(line)
        print_line(prefix+json.dumps(j))
