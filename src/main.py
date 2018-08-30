#! /usr/bin/env python3

'''If you are getting an error about file system codecs, 
use a python version below 3.7, preferably Python 3.6.
PyInstaller 3.3.1 does not support python 3.7 at the time
this was written.
'''

import os
import sys

print(__file__)

if getattr(sys, 'frozen', False):
    # running in a app bundle or executable
    application_path = os.path.dirname(sys.executable)
elif __file__:
    # running live
    application_path = os.path.dirname(os.path.realpath(__file__))

os.environ["PYSDL2_DLL_PATH"] = application_path + '/../Frameworks/sdl2'
print('PYSDL2_DLL_PATH='+'\"'+str(os.environ.get('PYSDL2_DLL_PATH', 'unset'))+'\"')

import pong

if __name__ == '__main__':
    sys.exit(pong.run())
