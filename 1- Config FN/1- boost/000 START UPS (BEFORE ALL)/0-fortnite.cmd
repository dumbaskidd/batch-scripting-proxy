echo off
taskkill /im shellexperiencehost.exe /f
taskkill /im searchui.exe /f
taskkill /im searchapp.exe /f
taskkill /im runtimebroker.exe /f
taskkill /im textinputhost.exe /f
taskkill /im dllhost.exe /f
taskkill /im wmiprvse.exe /f
start cmd.exe
cd..
cd..
cd /d "D:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64"
start "" "FortniteClient-Win64-Shipping_EAC_EOS.exe"
cls && echo INICIA EL FORTNITE AHORA
exit
