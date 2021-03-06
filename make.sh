#!/usr/bin/env bash

# configurable items
APP_NAME="Pong" 
ENTRY_POINT="src/main.py"
ICON_PATH=./resources/$APP_NAME.icns
DIST_PATH='bin'
BUILD_ENV='benv'
WORK_PATH='temp'

# pre-liminary clean
rm -rf $DIST_PATH
rm -rf $BUILD_ENV

# build
python3 -m venv $BUILD_ENV
source $BUILD_ENV/bin/activate
pip install -r requirements.txt
pyinstaller -F -w -y -i $ICON_PATH --distpath $DIST_PATH --workpath $WORK_PATH -n $APP_NAME $ENTRY_POINT 
mkdir -p $DIST_PATH/$APP_NAME.app/Contents/Frameworks/sdl2
cp frameworks/sdl2/libSDL2.dylib $DIST_PATH/$APP_NAME.app/Contents/Frameworks/sdl2/libSDL2.dylib
cp src/Info.plist $DIST_PATH/$APP_NAME.app/Contents/Info.plist 

# clean leftover remnants
rm -f $APP_NAME.spec
rm -rf $WORK_PATH
deactivate $BUILD_ENV
rm -rf $BUILD_ENV
