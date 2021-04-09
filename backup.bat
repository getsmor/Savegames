@echo off
setlocal EnableDelayedExpansion
title Savegame Backup Tool

echo Please specify your backup location with the full address: 
echo (External USB Drive is recommended!)
set /p setlocation=

cls

set NAME="gamenames.txt"
set /a c=0
echo Supported Games:
echo ------------------
FOR /F "tokens=1 usebackq" %%i in (%NAME%) do (
    set /a c=c+1
    echo %%i
)

echo ------------------

set LOCATION="gamelocations.txt"
set /a d=0
FOR /F "tokens=1 usebackq" %%i in (%LOCATION%) do (
    set /a d=d+1
    set path=%%i
    if exist !path! (
        Xcopy !path! %setlocation% /e /y
    ) else (
        echo No files found
    )
)
pause
endlocal
