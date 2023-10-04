echo off
cls
:op
color 05
title Dragon Windows -starting
cls

echo                                                              1
            timeout  1 > nul
echo                                                              2
            timeout  1 > nul
echo                                                              3
            timeout  1 > nul                                     
goto :one



echo
:one
color f0
title note
cls 
echo Hello  User %random%                         
echo Please create 1 restore point
echo you can use this any time
echo If you need help join my discord server 
echo https://discord.gg/qWrWwzFsnT  
echo This program makes your windows 10 more
echo optimized.
pause
goto :top
                    
:top
color 04
title Dragon Windows!
cls
                                                                                                    
                                                                                                      
echo                                    ``                                                                
echo                                  -/ss`               .::``-.                                         
echo                              ./ymNmN+`          `.--..:dhoydy+:                                      
echo                          ./sdNMMMMMM-            `-oddmmmmmNmdd/                                     
echo                       `/hdmNMMMMMMMMm`        `:oydmmmmmo/+hmmhhs+.                                  
echo                     `-odNNMMMMMMMMMMMd/` ``.-:/odmmmmm/+` :::::sds.                                  
echo                   -odmNNNNNMMNNNNNMMMMMNNNNNmmdmmmddmm:         .                                    
echo                .+hddhyhdmNNNNmmmmNNNMMMMMMMNmddmmmdmmmd+.                                            
echo              ./-`` `.oydNmmdmmmmmmmmmmmNNMMMNdmmmNmmNNmdy-            :s/-..`                        
echo                       sdmhs+/://+++o+///+ydmNNNmNNNNmmmmmNNhs+:::/+oyhmMNMMMMMNmhy+.                  
echo                     +y+-`               `/smNNNNNNNmdmMMMMMNNNNMNNMMMMMNNMMMMNmmho                   
echo                   `/-                `--dNNNmmNmhdddymNmNNNNNNNNNMMMMMMMNNMMMMNdhs-                  
echo                                      `:oNmmNmmmh  `+NmdhdddmmmmmmmNNNNMMNNNNmNNNmyo:                 
echo                                   `:+shNNmmNNmNm.  /Nh`-+shdmddddmmdmNNNmmmNmdhhdmds:`               
echo                                    :+dNmNd+sdmmo  -yN:    ./syysyddhmNNmdddmmdhssoshhs.              
echo                                  `::sNddh/ymdo-   .o:        `-/ossymmdyyyhdmdhs+/++//o+.            
echo                                  `-sNmmNNNs.                   ./+shNdso++osydys/-`     ``           
echo                                  .:hmNNNN:                       -odho/-..-/+sho+`                   
echo                                   :mmmNh-                         .d/.      `-oy:                    
echo                                   smNN/                            /           :+                    
echo                                  `:yhd-                                         .                    
echo                                    .hy/                                                              
echo                                     :yy.                                                             
echo                                      :yo                                                             
echo                                       yy                                                             
echo                                       ho                                                             
echo                                      +y.                                                             
echo                                    `+y-                                                              
echo                                   /y+`                                                               
echo                               .:os/`                                                                 
echo                             -::.                                                                     
                                                                                                    
                                                                                                    



echo [1] internet
echo [2] registry
echo [3] cleaner
echo [4] host
echo [5] Service
echo [6] Startup

echo type the numbers of optimization you want!
       


set /p when=
if "%when%"== "1"  goto :netsh
if "%when%"== "2" goto :zpt
if "%when%"== "3" goto :clean
if "%when%"== "4" goto :ram
if "%when%"== "5" goto :dus
if "%when%"== "cls" goto exit
if "%when%"== "6" goto :yes



:zpt
REG add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled"="0"
REG add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_FSEBehavior"=dword:00000002
REG add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode"=dword:00000002
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR"="0"
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled"=dword:00000000
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity"=dword:00000000
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only"="False"
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate"=dword:00002710
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority"=dword:00000008
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority"=dword:00000006
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category"="High"
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority"="High"
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness"=dword:0000000a"
REG add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoEndTasks"="1"
REG add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "HungAppTimeout"="1000"
REG add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay"="8"
REG add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WaitToKillAppTimeout"="2000"
REG add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LowLevelHooksTimeout"="1000"
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks"=dword:00000001
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo"=dword:00000001
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch"=dword:00000001
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack"=dword:00000001
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith"=dword:00000001
REG add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout"="2000"
REG add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "Win8DpiScaling"=dword:00000000
REG add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DpiScalingVer"=dword:00001000
REG add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LogPixels"=dword:00000096
REG add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes"="2"
bcdedit /set disabledynamictick yes 
bcdedit /set useplatformtick yes
bcdedit /deletevalue useplatformclock
bcdedit /set disabledynamictick ye
powercfg -h off
pause
goto :top




:dus
sc stop AJRouter > nul
sc config AJRouter start= disabled > nul

sc stop tzautoupdate > nul
sc config tzautoupdate start= disabled > nul

sc stop BITS > nul
sc config BITS start= disabled > nul

sc stop KeyIso > nul
sc config KeyIso start= disabled > nul

sc stop DiagTrack > nul
sc config DiagTrack start= disabled > nul
 
sc stop CDPSvc > nul
sc config CDPSvc start= disabled > nul

sc stop DusmSvc > nul
sc config DusmSvc start= disabled > nul

sc stop DoSvc > nul
sc config DoSvc start= disabled > nul

sc stop diagsvc > nul
sc config diagsvc start= disabled > nul

sc stop DPS > nul
sc config DPS start= disabled > nul

sc stop WdiServiceHost > nul
sc config WdiServiceHost start= disabled > nul

sc stop WdiSystemHost > nul
sc config WdiSystemHost start= disabled > nul

sc stop dmwappushservice > nul
sc config dmwappushservice start= disabled > nul

sc stop DisplayEnhancementService > nul
sc config DisplayEnhancementService start= disabled > nul

sc stop MapsBroker > nul
sc config MapsBroker start= disabled > nul

sc stop fhsvc > nul
sc config fhsvc start= disabled > nul

sc stop lfsvc > nul
sc config lfsvc start= disabled > nul

sc stop HomeGroupListener > nul
sc config HomeGroupListener start= disabled > nul

sc stop HomeGroupProvider > nul
sc config HomeGroupProvider start= disabled > nul

sc stop NgcSvc > nul
sc config NgcSvc start= disabled > nul

sc stop NgcCtnrSvc > nul
sc config NgcCtnrSvc start= disabled > nul

sc stop SmsRouter > nul
sc config SmsRouter start= disabled > nul

sc stop CscService > nul
sc config CscService start= disabled > nul

sc stop SEMgrSvc > nul
sc config SEMgrSvc start= disabled > nul

sc stop pla > nul
sc config pla start= disabled > nul

sc stop PhoneSvc > nul
sc config PhoneSvc start= disabled > nul

sc stop WpcMonSvc > nul
sc config WpcMonSvc start= disabled > nul

sc stop RasAuto > nul
sc config RasAuto start= disabled > nul

sc stop RasMan > nul
sc config RasMan start= disabled > nul 

sc stop SessionEnv > nul
sc config SessionEnv start= disabled > nul

sc stop TermService > nul
sc config TermService start= disabled > nul

sc stop TermService > nul
sc config TermService start= disabled > nul
 
sc stop RpcLocator > nul
sc config RpcLocator start= disabled > nul

sc stop RemoteRegistry > nul
sc config RemoteRegistry start= disabled > nul
 
sc stop RetailDemo > nul
sc config RetailDemo start= disabled > nul

sc stop SysMain > nul 
sc config SysMain start= disabled > nul

sc stop WalletService > nul
sc config WalletService start= disabled > nul

sc stop WerSvc > nul
sc config WerSvc start= disabled > nul

sc stop WSearch > nul
sc config WSearch start= disabled > nul
 
sc stop W32Time > nul 
sc config W32Time start= disabled > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpnUserService" /v Start /t REG_DWORD /d 00000004 /f > nul
pause
goto :top










:ram
cls
echo If you have 2gb RAM then type in 2048
echo If you have 3gb RAM then type in 3072
echo If you have 4gb RAM then type in 4096
echo If you have 6gb RAM then type in 6144
echo If you have 8GB RAM then type in 8192
echo If you have 10GB RAM then in 10240
echo If you have 12GB RAM then in 12288
echo If you have 16GB RAM then in 16384
echo If you have 20GB RAM then in 20480
echo If you have 24GB RAM then in 24576
echo If you have 32GB RAM then in 32768
echo if you want to go back to default then type def
echo Enter your amount of RAM


set /p power=
if "%power%" == "2048" goto :2048
if "%power%" == "3072" goto :3072
if "%power%" == "4096" goto :4096
if "%power%" == "6144" goto :6144
if "%power%" == "8192" goto :8192
if "%power%" == "10240" goto :10240
if "%power%" == "12288" goto :12288
if "%power%" == "16384" goto :16384
if "%power%" == "20480" goto :20480
if "%power%" == "24576" goto :24576
if "%power%" == "32768" goto :32768
if "%power%" == "def" goto :default
cls


:2048
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 2097152 /f > nul
echo cls
echo ok.
pause
goto :top

:3072
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 3145728 /f > nul
cls
echo ok.
pause
goto :top

:4096
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 4194304 /f > nul
cls
echo ok.
pause
goto :top

:6144
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 6291456 /f > nul
cls
echo ok.
pause
goto :top

:8192
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 8388608 /f > nul
cls
echo ok.
pause
goto :top

:10240
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 10485760 /f > nul
cls
echo ok.
pause
goto :top


:12288
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 12582912 /f > nul
cls
echo ok.
pause
goto :top

:16384
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 16777216 /f > nul
cls
echo ok.
pause
goto :top

:20480
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 20971520 /f > nul
cls
echo ok.
pause
goto :top

:24576
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 25165824 /f > nul
cls
echo ok.
pause
goto :top

:32768
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 33554432 /f > nul
cls
echo ok.
pause
goto :top

:default
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 380000 /f > nul
cls
echo ok.
pause
goto :top





:clean
cls
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
echo cleared temp and prefetch do you want to clear other junks?
echo press any key to clear other junks...
echo another one may not work for some computers...
pause
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del c:\WIN386.SWP
done.
pause
echo press any key to clear clipboard
cmd /c echo.|clip
echo done.
pause
goto :top






:netsh
cls
Netsh int tcp show global
Netsh int tcp set global chimney=enabled
Netsh int tcp set global autotuninglevel=normal
netsh int ip reset c:\resetlog.txt
netsh winsock reset
netsh advfirewall firewall add rule name="YouTubeTweak" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes
regsvr32 actxprxy.dll
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\ /v DisableDiagnosticTracing /t REG_DWORD /d 1 /f 
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl\ /v IRQ8Priority /t REG_DWORD /d 1 /f
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TcpAckFrequency /t REG_DWORD /d 0 /f
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TCPNoDelay /t REG_DWORD /d 0 /f
ipconfig /flushdns
pause
taskkill /f /im explorer.exe

start explorer.exe

pause
goto :top






:yes
powercfg /hibernate on
pause
echo done.
pause
goto :top