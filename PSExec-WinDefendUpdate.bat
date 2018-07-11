cd c:\pstools

@echo off
for /f %G in (computers.txt) do (
echo processing computer %G
psexec \\%G -u XXXXXXX -p XXXXXXX cmd.exe /c "\WinDefForceUpdate.bat" )
