@echo off
mode 800
color 3
:menu
CLS
:::            _     _ _____               __   __ . _______      _     _        _______ _____ _______ _______ _______ _______       _____  _______ _______ _     _
:::             \___/    |   |      |        \_/   ' |______      |     | |         |      |   |  |  | |_____|    |    |______      |_____] |_____| |       |____/ 
:::            _/   \_ __|__ |_____ |_____    |      ______|      |_____| |_____    |    __|__ |  |  | |     |    |    |______      |       |     | |_____  |    \_                                                                                                                                                     
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

echo.[36m [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][0m
:menu
echo.[36;1m  				 				Press 1 to APPLY NEW MOUSE TWEAKS
echo.  					 			Press 2 to APPLY NEW CONTROLLER TWEAKS
echo.  					 			Press 3 to APPLY NVIDIA/AMD RADEON TWEAKS
echo.  					 			Press 4 to APPLY NETWORK TWEAKS
echo.  					 			Press 5 to APPLY REGISTRY TWEAKS
echo.  					           		Press 6 to GAIN MORE STORAGE SPACE
echo [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
set /p userinp= ^> Enter Your Option: 
if [%userinp%]==[] echo.&echo Invalid User Input&echo.&pause&goto :menu
if %userinp% gtr 6 echo.&echo Invalid User Selection&echo.&pause&goto :menu
if %userinp%==1 goto :opt1
if %userinp%==2 goto :opt2
if %userinp%==3 goto :opt3
if %userinp%==4 goto :opt4
if %userinp%==5 goto :opt5
if %userinp%==6 goto :opt6
goto :eof

:opt1
cls

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

for /f %%a in ('wmic PATH Win32_USBHub GET DeviceID ^| findstr /l "USB\VID_"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" -ot reg -actn setowner -ownr "n:Administrators"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f
)

for /f %%a in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr /l "PCI\VEN_"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" -ot reg -actn setowner -ownr "n:Administrators"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f
)

REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "RestorePoint" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"
pause
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\rdyboost\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\pci\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdhid\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NdisWan\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\EhStorClass\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\HDAudBus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\partmgr\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ACPI\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\acpipagr\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\BasicDisplay\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\BasicRender\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\CompositeBus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dc1-controller\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelpep\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MEIx64\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Monitor\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\msisadrv\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NdisVirtualBus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NvModuleTracker\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\storahci\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\umbus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\vdrvroot\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\vwifibus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WpdUpFItr\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WUDFWpdFs\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\xinputhid\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /F /V "MouseDataQueueSize" /T REG_DWORD /d "20"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /F /V "MouseDataQueueSize" /T REG_DWORD /d "20"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters" /F /V "TCPNoDelay" /T REG_DWORD /d "1"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /F /V "Win32PrioritySeparation" /T REG_DWORD /d "42"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /F /V "HwSchMode" /T REG_DWORD /d "2"
bcdedit /deletevalue useplatformclock
bcdedit /deletevalue useplatformtick
bcdedit /set hypervisorlaunchtype off
"%~dp0\SetTimerResolutionService.exe" -install

sc config STR start= auto
net start STR

pause
goto :menu

:opt2
cls

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

for /f %%a in ('wmic PATH Win32_USBHub GET DeviceID ^| findstr /l "USB\VID_"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" -ot reg -actn setowner -ownr "n:Administrators"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f
)

for /f %%a in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr /l "PCI\VEN_"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" -ot reg -actn setowner -ownr "n:Administrators"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f
)

REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "RestorePoint" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"
pause
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\rdyboost\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\pci\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdhid\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NdisWan\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\EhStorClass\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\HDAudBus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\partmgr\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ACPI\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\acpipagr\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\BasicDisplay\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\BasicRender\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\CompositeBus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dc1-controller\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelpep\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MEIx64\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Monitor\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\msisadrv\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NdisVirtualBus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NvModuleTracker\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\storahci\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\umbus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\vdrvroot\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\vwifibus\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WpdUpFItr\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WUDFWpdFs\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\xinputhid\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /F /V "HwSchMode" /T REG_DWORD /d "2"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /F /V "Win32PrioritySeparation" /T REG_DWORD /d "40"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MMCSS" /F /V "Start" /T REG_DWORD /d 4

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

goto :menu

:opt3
cls
echo If your NVIDIA PRESS 1
echo If your AMD PRESS 2
SET /P choice=  [101;44m1 / 2:[0m  
IF /I "%choice%"=="1" goto :NVIDIA
IF /I "%choice%"=="2" goto :AMD

:NVIDIA
color 2
echo              /++++++++++++++++++++/
echo              +ooooooooooooooooooooo
echo         `.-:/-.--:++ooooooooooooooo
echo     `.:+++/:-//:-.``.:+oooooooooooo
echo `.:/++/-..-:/--:/+o+:.``:+ooooooooo
echo /oo:.` :+o/:-/:-``.ooo/` `+oooooooo
echo `:o+-` -oo-  +ooo//+/.``:+ooo+ooooo
echo   `/o+-`./o+:://:-.`.-/ooo+:.`/oooo
echo     `:++/..-:-..-:/+++/:-``.-+ooooo
echo       `-/++/:///:-.```..:/+oooooooo
echo          `.:/-..-::/++ooooooooooooo
echo              +ooooooooooooooooooooo
echo              /++++++++++++++++++++/
echo If your CONTROLLER PRESS 1
echo If your MOUSE PRESS 2

SET /P choice=  [101;44m1 / 2:[0m  
IF /I "%choice%"=="1" goto :1M
IF /I "%choice%"=="2" goto :2C

:1M
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "RestorePoint" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"
pause
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /F /V "HwSchMode" /T REG_DWORD /d "2"
Reg.exe add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d "2" /f
powershell -c "Invoke-WebRequest -Uri 'https://www.7-zip.org/a/7z1900-x64.exe' -OutFile %HOMEPATH%\AppData\Local\Temp\7z.exe
cd %HOMEPATH%\AppData\Local\Temp
start /Wait 7z.exe /S /W /D="%Systemdrive%\Program Files\7-Zip"
CLS
timeout 1
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
@echo NVIDIA TWEAKS APPLIED, RESTART YOUR PC
pause
goto :menu

:2C
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "RestorePoint" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"
pause
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /F /V "HwSchMode" /T REG_DWORD /d "2"
Reg.exe add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d "2" /f
powershell -c "Invoke-WebRequest -Uri 'https://www.7-zip.org/a/7z1900-x64.exe' -OutFile %HOMEPATH%\AppData\Local\Temp\7z.exe
cd %HOMEPATH%\AppData\Local\Temp
start /Wait 7z.exe /S /W /D="%Systemdrive%\Program Files\7-Zip"
CLS
timeout 1
cd %HOMEPATH%\AppData\Local\Temp
del /f 7z.exe

Reg.exe add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d "2" /f >nul
powershell -c "Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/789238405736693780/835571271165018212/nvidiaProfileInspector.exe' -OutFile C:\Windows\nvidiaProfileInspector.exe
powershell -c "Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/789238405736693780/835935156678295572/mouse_and_kb_only.nip' -OutFile %HOMEPATH%\AppData\Local\Temp\mouse_and_kb_only.nip
powershell -c "Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/789238405736693780/835936674336866314/Import_Nvidia.bat' -OutFile %HOMEPATH%\AppData\Local\Temp\Import_Nvidia.bat
cd %HOMEPATH%\AppData\Local\Temp
Import_Nvidia.bat
cd %HOMEPATH%\AppData\Local\Temp
del /f mouse_and_kb_only.nip
cd %HOMEPATH%\AppData\Local\Temp
del /f Import_Nvidia.bat
@echo NVIDIA TWEAKS APPLIED, RESTART YOUR PC
pause
goto :menu

:AMD
cls
color 4
echo        `::::::::::::::::::-               
echo         -hMMMMMMMMMMMMMMMMh               
echo           -hMMMMMMMMMMMMMMh               
echo             -////////hMMMMh               
echo           `sh        yMMMMh               
echo         `sNMd        yMMMMh               
echo        +NMMMd        yMMMMh               
echo        hMMMMm++++++/ +MMMMh               
echo        hMMMMMMMMMNo`  .yMMh               
echo        hMMMMMMMNo`      .yy               
echo        -:::::::`          `               

REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "RestorePoint" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"
pause
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AMD Crash Defender Service" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AMD Log Utility" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdlog" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAllClockGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePowerGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableVCNPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "256" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /F /V "HwSchMode" /T REG_DWORD /d "2"

@echo AMD RADEON TWEAKS APPLIED, RESTART YOUR PC
pause
goto :menu

:opt4
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "RestorePoint" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"
pause
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "Class" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT" /v "Start" /t REG_DWORD /d "4" /f

echo Type "1" if you play Fortnite
echo Type "2" if you don't mainly play it

SET /P choice=  [101;44m1 / 2:[0m  
IF /I "%choice%"=="1" goto :1N
IF /I "%choice%"=="2" goto :2N

:1N
netsh winsock set autotuning on

:2N
goto :menu

:opt5
cls
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "RestorePoint" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"
pause
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "EAFModules" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "000222000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f

echo Registry Tweaks applied, restart your pc to apply changes!

pause
goto :menu

:opt6
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