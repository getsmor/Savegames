@echo off
setlocal EnableDelayedExpansion
title Savegame Backup Tool

echo Please specify your backup location with the full address: 
echo (External USB Drive is recommended!)
set /p setlocation=

set nameCounter=1
for /f %%x in (gamenames.txt) do (
  set "nameLine_!nameCounter!=%%x"
  set /a nameCounter+=1
)

set locationCounter=1
for /f %%x in (gamelocations.txt) do (
  set "locationLine_!locationCounter!=%%x"
  set /a locationCounter+=1
)

echo %locationLine_1%
echo %nameLine_1%

if exist %locationLine_1% (
   xcopy %locationLine_1% %setlocation% /E /y
) else (
   echo %nameLine_1% Not Found!
)
pause