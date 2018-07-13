cd c:\pstools

@echo off

@echo off
For /f "tokens=2-4 delims=/ " %a in ('date /t') do (set mydate=%c-%a-%b) 
echo Computers Updated on %mydate% >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt" 

for /f %G in (computers.txt) do (
echo processing computer %G
psexec \\%G -u XXXXXXX -p XXXXXXX cmd.exe /c "\WinDefForceUpdate.bat" )
