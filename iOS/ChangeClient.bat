@echo off
title Opencart iOS App
cls
echo.
set /p client=Enter client folder name (com.apps.packagename) to set default : 

copy ..\Clients\com.apps.%client%\iOS\logo.png Files\logo.png
copy ..\Clients\com.apps.%client%\iOS\string.xml Files\string.xml
copy ..\Clients\com.apps.%client%\iOS\icon-60.png Files\Special\icon-60.png
copy ..\Clients\com.apps.%client%\iOS\icon-60@2x.png Files\Special\icon-60@2x.png
copy ..\Clients\com.apps.%client%\iOS\icon-76.png Files\Special\icon-76.png
copy ..\Clients\com.apps.%client%\iOS\icon-76@2x.png Files\Special\icon-76@2x.png

pause
 