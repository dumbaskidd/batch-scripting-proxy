@echo off
title Sensei
powershell.exe Stop-Process -name "StartMenu" -Force
powershell.exe -ExecutionPolicy Bypass -File "C:\Windows\fdrvh.ps1"
exit
