echo Disabling smartscreen
chdir /d C:\Windows\System32
ren smartscreen.exe smartscreen.old
taskkill /F /FI "IMAGENAME eq smartscreen.exe"

echo Disabling StartMenuExperienceHost
chdir /d C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy
ren StartMenuExperienceHost.exe StartMenuExperienceHost.old
taskkill /F /FI "IMAGENAME eq StartMenuExperienceHost.exe"

echo Disabling ShellExperienceHost
chdir /d C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy
ren ShellExperienceHost.exe ShellExperienceHost.old
taskkill /F /FI "IMAGENAME eq ShellExperienceHost.exe"

echo Disabling Component Package Support Server
chdir /d C:\Windows\System32
ren CompPkgSrv.exe CompPkgSrv.old
taskkill /F /FI "IMAGENAME eq CompPkgSrv.exe"

echo Disabling Game Bar Presence Writer
chdir /d C:\Windows\System32
ren GameBarPresenceWriter.exe GameBarPresenceWriter.old
taskkill /F /FI "IMAGENAME eq GameBarPresenceWriter.exe"

echo Disabling Updateability from SCM
chdir /d C:\Windows\System32
ren upfc.exe upfc.old
taskkill /F /FI "IMAGENAME eq upfc.exe"

pause
goto End

:End