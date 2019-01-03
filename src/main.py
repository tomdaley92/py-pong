#! /usr/bin/env python3

import os
import sys

if getattr(sys, 'frozen', False):
    # running from app bundle or compiled executable
    APPLICATION_PATH = os.path.dirname(sys.executable)
elif __file__:
    # running with Python interpreter
    APPLICATION_PATH = os.path.dirname(os.path.realpath(__file__))
else:
    print("Unable to determine applicaion path")
    exit(1)

os.environ["PYSDL2_DLL_PATH"] = APPLICATION_PATH + '/../Frameworks/sdl2'
print('PYSDL2_DLL_PATH='+'\"'+str(os.environ.get('PYSDL2_DLL_PATH', 'unset'))+'\"')

if __name__ == '__main__':
    import pong
    sys.exit(pong.run())
