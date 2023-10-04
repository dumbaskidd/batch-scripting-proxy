@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    echo Please click yes when prompted.
    timeout 4 >nul /nobreak
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
:: delete script after getting admin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )

echo Setting JavaW.exe Priority To Realtime...
timeout 2 >nul /nobreak
wmic process where name="javaw.exe" CALL setpriority "realtime"
cls
echo Set JavaW.exe Priority To idle Successfully!
timeout 2 >nul /nobreak
echo Setting svchost.exe Priority To idle
timeout 2 >nul /nobreak
wmic process where name="svchost.exe" CALL setpriority "idle"
cls
echo Set svchost.exe Priority To idle Successfully!
timeout 2 >nul /nobreak
echo Setting msedge.exe Priority To idle...
timeout 2 >nul /nobreak
wmic process where name="msedge.exe" CALL setpriority "idle"
cls
echo Set msedge.exe Priority To idle Successfully!
timeout 2 >nul /nobreak
echo Setting chrome.exe Priority To idle...
timeout 2 >nul /nobreak
wmic process where name="chrome.exe" CALL setpriority "idle"


