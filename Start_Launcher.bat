@echo off
SET "CURDIR=%~dp0"
cd /d "%CURDIR%"
%windir%\System32\cmd.exe "/K" python run.py