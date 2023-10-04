@echo off
echo Prioridades de Vluzzy By Sense1
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo espera...
    echo requeriendo privilegios.
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

echo Setting Discord.exe Priority To idle...
timeout 2 >nul /nobreak 
wmic process where name="Discord.exe" CALL setpriority "idle"
cls
echo Set Discord.exe Priority To idle Successfully!
cls
echo Setting Lightshot.exe Priority To idle...
timeout 2 >nul /nobreak 
wmic process where name="Lightshot.exe" CALL setpriority "idle"
cls
echo Set Lightshot.exe Priority To idle Successfully!
cls
echo Setting Discord.exe Priority To idle...
timeout 2 >nul /nobreak
wmic process where name="Discord.exe" CALL setpriority "idle"
cls
echo Set Discord.exe Priority To idle Successfully!
cls
echo Setting Spotify.exe Priority To idle...
timeout 2 >nul /nobreak
wmic process where name="Spotify.exe" CALL setpriority "idle"
cls
echo Set Spotify.exe Priority Successfully!
cls
echo Setting StartMenu.exe Priority To idle...
timeout 2 >nul /nobreak
wmic process where name="StartMenu.exe" CALL setpriority "idle"
cls
echo Set StartMenu.exe Priority Successfully!
cls
echo Setting TimerResolution.exe Priority To realtime...
timeout 2 >nul /nobreak
wmic process where name="TimerResolution.exe" CALL setpriority "realtime"
cls
echo Set TimerResolution.exe Priority Successfully!
cls
echo Setting TimerTool.exe Priority To realtime...
timeout 2 >nul /nobreak
wmic process where name="TimerTool.exe" CALL setpriority "realtime"
cls
echo Set TimerTool.exe Priority Successfully!
cls
echo Setting opera.exe Priority To idle...
timeout 2 >nul /nobreak
wmic process where name="opera.exe" CALL setpriority "idle"
cls
echo Set opera.exe Priority Successfully!
cls
echo Setting opera_crashreporter.exe Priority To idle...
timeout 2 >nul /nobreak
wmic process where name="opera_crashreporter.exe" CALL setpriority "idle"
cls
echo Set opera_crashreporter.exe Priority Successfully!
cls
echo Setting Brave.exe Priority To idle...
timeout 2 >nul /nobreak
wmic process where name="Brave.exe" CALL setpriority "idle"
cls
echo Set Brave.exe Priority Successfully!
cls
echo Setting firefox.exe Priority To idle...
timeout 2 >nul /nobreak
wmic process where name="firefox.exe" CALL setpriority "idle"
cls
echo Set firefox.exe Priority Successfully!
cls
echo Setting Antimicro.exe Priority To high...
timeout 2 >nul /nobreak
wmic process where name="Antimicro.exe" CALL setpriority "high"
cls
echo Set Antimicro.exe Priority Successfully!