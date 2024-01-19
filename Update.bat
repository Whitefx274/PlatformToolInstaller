@echo off
cd /D "%~dp0."
ECHO "######## Platform Tools Installer #######"
ECHO "##### This will update ADB/Fastboot #####"
ECHO "############## Systemwide ###############"
ECHO "#########################################"
:start
SET choice=
SET /p choice=Are you ready to update Platform Tools? (y/n): 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
ECHO "Invalid response"
ECHO.
GOTO start
:yes
del "C:\Program Files (x86)\AndroidSDK/*"
COPY * "C:\Program Files (x86)\AndroidSDK"
del "C:\Program Files (x86)\AndroidSDK\PlatformInstall.bat"
del "C:\Program Files (x86)\AndroidSDK\Update.bat"
setx Path "%PATH%;C:\Program Files (x86)\AndroidSDK"
ECHO.
ECHO.
ECHO "###################################"
ECHO "ADB and Fastboot has now been updated"
pause
exit
:no
pause
