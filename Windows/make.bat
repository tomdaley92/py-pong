REM configurable items
SETLOCAL
SET APP_NAME=Pong 
SET ENTRY_POINT=..\src\main.py
SET ICON_PATH=.resources\$APP_NAME.icns
SET DIST_PATH=bin
SET BUILD_ENV=venv
SET WORK_PATH=temp

REM pre-liminary clean
DEL /f /Q %DIST_PATH%
DEL /f /Q %BUILD_ENV%

REM build
python -m venv %BUILD_ENV%
CALL %BUILD_ENV%\Scripts\activate.bat
pip install -r ../requirements.txt
pyinstaller -F -w -y -i %ICON_PATH% --distpath %DIST_PATH% --workpath %WORK_PATH% -n %APP_NAME% %ENTRY_POINT%
 

REM clean leftover remnants
DEL /f /Q %APP_NAME%
DEL /f /Q %WORK_PATH%
REM %BUILD_ENV%\Scripts\deactivate.bat
echo here
DEL /f /Q %BUILD_ENV%
ENDLOCAL