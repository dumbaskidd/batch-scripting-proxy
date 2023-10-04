@echo off
mode 800
color 9
:menu
CLS
:::__   _______ _      _   __   ___ _____   _______   _______  _     _   _ _____ _____ _   _ _____   _____ _    _ _____ _____ _____ ___________  ______  ___  _____  _   __
:::\ \ / /_   _| |    | |  \ \ / ( )  ___| |  ___\ \ / /  __ \| |   | | | /  ___|_   _| | | |  ___| |_   _| |  | |_   _|_   _|_   _|  ___| ___ \ | ___ \/ _ \/  __ \| | / /
::: \ V /  | | | |    | |   \ V /|/\ `--.  | |__  \ V /| /  \/| |   | | | \ `--.  | | | | | | |__     | | | |  | | | |   | |   | | | |__ | |_/ / | |_/ / /_\ \ /  \/| |/ / 
::: /   \  | | | |    | |    \ /    `--. \ |  __| /   \| |    | |   | | | |`--. \ | | | | | |  __|    | | | |/\| | | |   | |   | | |  __||    /  |  __/|  _  | |    |    \ 
:::/ /^\ \_| |_| |____| |____| |   /\__/ / | |___/ /^\ \ \__/\| |___| |_| /\__/ /_| |_\ \_/ / |___    | | \  /\  /_| |_  | |   | | | |___| |\ \  | |   | | | | \__/\| |\  \
:::\/   \/\___/\_____/\_____/\_/   \____/  \____/\/   \/\____/\_____/\___/\____/ \___/ \___/\____/    \_/  \/  \/ \___/  \_/   \_/ \____/\_| \_| \_|   \_| |_/\____/\_| \_/
                                                                                                                                                                                                                                                                                                                                          
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo [96m===============================================================================
:menu
echo.  Press 1 to apply EXCLUSIVE MOUSE TWEAKS
echo.  Press 2 to apply EXCLUSIVE CONTROLLER TWEAKS
echo.  Press 3 to RESTART YOUR PC 
echo.  Press 4 to FIX SYSTEM ERRORS
echo.  Press 5 to GAIN MORE STORAGE SPACE
echo ===============================================================================
set /p userinp= ^> Enter Your Option: 
if [%userinp%]==[] echo.&echo Invalid User Input&echo.&pause&goto :menu
if %userinp% gtr 5 echo.&echo Invalid User Selection&echo.&pause&goto :menu
if %userinp%==1 goto :opt1
if %userinp%==2 goto :opt2
if %userinp%==3 goto :opt3
if %userinp%==4 goto :opt4
if %userinp%==5 goto :opt5
goto :eof

:opt1
cls
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "RestorePoint" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"
pause
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /F /V "MouseDataQueueSize" /T REG_DWORD /d "20"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /F /V "MouseDataQueueSize" /T REG_DWORD /d "20"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters" /F /V "TCPNoDelay" /T REG_DWORD /d "1"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /F /V "Win32PrioritySeparation" /T REG_DWORD /d "42"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /F /V "HwSchMode" /T REG_DWORD /d "2"
bcdedit /deletevalue useplatformclock
bcdedit /deletevalue useplatformtick
bcdedit /set hypervisorlaunchtype off
"%~dp0\SetTimerResolutionService.exe" -install
pause
goto :menu

:opt2
cls
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "RestorePoint" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"
pause
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /F /V "HwSchMode" /T REG_DWORD /d "2"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters" /F /V "TCPNoDelay" /T REG_DWORD /d "1"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /F /V "Win32PrioritySeparation" /T REG_DWORD /d "40"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MMCSS" /F /V "Start" /T REG_DWORD /d 4
for /f %%a in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr /l "USB\VID_"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" -ot reg -actn setowner -ownr "n:Administrators"
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" -ot reg -actn ace -ace "n:Administrators;p:full"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 00000000 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendEnabled /t REG_BINARY /d 00 /f
)
for /f %%a in ('wmic PATH Win32_USBHub GET DeviceID ^| findstr /l "USB\ROOT_HUB"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" -ot reg -actn setowner -ownr "n:Administrators"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f
)

bcdedit /deletevalue allowedinmemorysettings 
bcdedit /deletevalue avoidlowmemory 
bcdedit /deletevalue bootems 
bcdedit /deletevalue bootlog  
bcdedit /deletevalue bootmenupolicy 
bcdedit /deletevalue bootux 
bcdedit /deletevalue configaccesspolicy 
bcdedit /deletevalue configflags 
bcdedit /deletevalue debug  
bcdedit /deletevalue disableelamdrivers  
bcdedit /deletevalue ems 
bcdedit /deletevalue extendedinput  
bcdedit /deletevalue firstmegabytepolicy 
bcdedit /deletevalue forcefipscrypto 
bcdedit /deletevalue forcelegacyplatform 
bcdedit /deletevalue graphicsmodedisabled 
bcdedit /deletevalue halbreakpoint 
bcdedit /deletevalue highestmode  
bcdedit /deletevalue hypervisorlaunchtype 
bcdedit /deletevalue increaseuserva 
bcdedit /deletevalue integrityservices 
bcdedit /deletevalue isolatedcontext 
bcdedit /deletevalue nointegritychecks 
bcdedit /deletevalue nolowmem  
bcdedit /deletevalue noumex  
bcdedit /deletevalue nx 
bcdedit /deletevalue onecpu 
bcdedit /deletevalue pae 
bcdedit /deletevalue perfmem 
bcdedit /deletevalue quietboot  
bcdedit /deletevalue sos  
bcdedit /deletevalue testsigning 
bcdedit /deletevalue tpmbootentropy 
bcdedit /deletevalue tscsyncpolicy 
bcdedit /deletevalue usefirmwarepcisettings 
bcdedit /deletevalue usephysicaldestination 
bcdedit /deletevalue useplatformclock 
bcdedit /deletevalue useplatformtick  
bcdedit /deletevalue vm 
bcdedit /deletevalue vsmlaunchtype
bcdedit /set disabledynamictick yes


Reg.exe add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d "2" /f
powershell -c "Invoke-WebRequest -Uri 'https://www.7-zip.org/a/7z1900-x64.exe' -OutFile %HOMEPATH%\AppData\Local\Temp\7z.exe
cd %HOMEPATH%\AppData\Local\Temp
start /wait 7z.exe /S
CLS
@echo off 
cd %HOMEPATH%\AppData\Local\Temp
del /f 7z.exe

Reg.exe add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d "2" /f >nul
powershell -c "Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/789238405736693780/835571271165018212/nvidiaProfileInspector.exe' -OutFile C:\Windows\nvidiaProfileInspector.exe
powershell -c "Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/789238405736693780/835571342916845578/Controller.nip' -OutFile %HOMEPATH%\AppData\Local\Temp\Controller.nip
powershell -c "Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/789238405736693780/835575449585319976/Import_Nvidia.bat' -OutFile %HOMEPATH%\AppData\Local\Temp\Import_Nvidia.bat
cd %HOMEPATH%\AppData\Local\Temp
Import_Nvidia.bat
cd %HOMEPATH%\AppData\Local\Temp
del /f Controller.nip
cd %HOMEPATH%\AppData\Local\Temp
del /f Import_Nvidia.bat

goto :menu

:opt3
shutdown /r
goto :menu

:opt4
cls
echo.
echo ===============================================================================
echo.  [101;44mSystem File Checker is scanning the online image for corruption. 
echo.  Please Wait.. This will take 10-15 minutes or more..[0m
echo ===============================================================================
if exist "%windir%\logs\cbs\cbs.log" (del /f /q "%windir%\logs\cbs\cbs.log" >nul 2>&1)
sfc.exe /scannow
findstr /c:"[SR]" %windir%\logs\cbs\cbs.log >"%USERPROFILE%\desktop\SFC Details.txt"
echo ===============================================================================
echo.  A SFC Details Report was Created on your Desktop
echo ===============================================================================
pause
goto :menu

:opt5
cls
echo.
echo ===============================================================================
echo.  [101;44mRunning Extended Disk Cleanup Manager
echo.  Check your choice of the Cleanup options and hit ok
echo.  Please Wait.. This will take several minutes..[0m
echo ===============================================================================
%SystemRoot%\System32\Cmd.exe /c Cleanmgr /sageset:65535 
%SystemRoot%\System32\Cmd.exe /c Cleanmgr /sagerun:65535
pause
goto :menu