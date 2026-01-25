@echo off
setlocal

set MYDIR=%~dp0
set SOUNDS=%~1
set SOUND_DIR=%MYDIR%..\sounds\%SOUNDS%\
set CONFIG_DIR=%MYDIR%..\config\

rem echo sound path: %SOUND_DIR%
rem echo config dir: %CONFIG_DIR%
rem pause

if "X%SOUNDS%"=="X" (
    echo.
    echo Please specify sounds directory!
    echo.
    echo Usage:
    echo     %~n0 ^<Sound Directory^>
    echo.
    echo where
    echo     ^<Sound Directory^>
    echo     The base directory containing the sound files
    echo     ^(as specified in INI file^).
    goto :EOF
)


if not exist "%SOUND_DIR%" (
    echo.
    echo Sound directory
    echo     "%SOUND_DIR%"
    echo not found!
    echo.
    goto :EOF
)
pushd "%CONFIG_DIR%"
for /R %%I in (*.ini) do call :checkfiles "%%I"
popd

goto :EOF


:checkfiles
setlocal
set FILE_NAME=%~1
for /F %%J in ('findstr /R /C:"^Snd[0-9]*=" "%FILE_NAME%"') do (call :checkfile "%FILE_NAME%" "%%J")
endlocal
goto :EOF

:checkfile
setlocal
set FILE_NAME=%~1
set LINE=%~2
rem echo line: %LINE%
for /F "tokens=1,2* delims==" %%a in ("%LINE%") do (call :checksound "%FILE_NAME%" "%%b")
endlocal
goto :EOF

:checksound
setlocal
set FILE_NAME=%~1
set SOUND_FILE=%~2
set FULL_PATH=%SOUND_DIR%%SOUND_FILE%
rem echo file: %FILE_NAME%
rem echo sound file: %SOUND_FILE%
rem echo fullpath: "%FULL_PATH%"
if not exist "%FULL_PATH%" @echo "%SOUND_FILE%" "%FILE_NAME%" 
endlocal
goto :EOF

