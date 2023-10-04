@echo off

:: Sense1 tweaks

timeout 5 >nul

taskkill /IM "RuntimeBroker.exe" /F
taskkill /IM "dllhost.exe" /F

net stop UserManager
net stop W3SVC
net stop msiserver
net stop AppHostSvc
net stop ProfSvc
net stop CryptSvc

C:\Windows\EmptyStandbyList.exe workingsets
C:\Windows\EmptyStandbyList.exe modifiedpagelist
C:\Windows\EmptyStandbyList.exe priority0standbylist
C:\Windows\EmptyStandbyList.exe standbylist

rd %temp% /s /q
md %temp%

echo Completado!

timeout 2 >nul