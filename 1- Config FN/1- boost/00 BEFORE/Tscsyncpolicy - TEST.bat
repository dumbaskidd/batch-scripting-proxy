@echo off
title TSCSYNCPOLICY - KernelOS
color a
echo.
echo -------------------------
echo - 1. Enhanced (DEFAULT) -
echo - 2. Legacy             -
echo -------------------------
echo.
set /p menu=:
if %menu% EQU 1 goto e
if %menu% EQU 2 goto l

:e
bcdedit /set tscsyncpolicy Enhanced
exit
:l
bcdedit /set tscsyncpolicy Legacy
exit