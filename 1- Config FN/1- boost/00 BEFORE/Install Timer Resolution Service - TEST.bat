@echo off
title Timer Resolution Enable/Disable
color a
echo.
echo ---------------------------------
echo - 1. Install Timer Resolution   -
echo - 2. Uninstall Timer Resolution -
echo ---------------------------------
echo.
set /p trs=:
if %trs% EQU 1 goto :e
if %trs% EQU 2 goto :d

:e
"%WINDIR%\System32\SetTimerResolutionService.exe" -Install
exit
:d
"%WINDIR%\System32\SetTimerResolutionService.exe" -Uninstall
exit