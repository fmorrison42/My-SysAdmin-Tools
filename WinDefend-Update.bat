
echo Running WinDefend Update on %computername%

echo Computer Status for: %computername% >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
echo -------------------- >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
gpupdate /force

echo Windows Defender Start Status: >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
sc config WinDefend start= auto 
net start WinDefend >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"

echo __ >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"

echo WSUS Restart Status: >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
net stop wuauserv >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
net start wuauserv >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"

echo __ >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
cd %ProgramFiles%\Windows Defender
echo Remove Definitions Output: >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
MpCmdRun.exe -removedefinitions -dynamicsignatures >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"

echo __ >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
echo Signature Update Output:  >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
MpCmdRun.exe -SignatureUpdate >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
echo+  >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"

echo __ >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
echo Windows Defender Shutdown Status: >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
net stop WinDefend 
sc config WinDefend start= disabled >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"


echo+  >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"

REM echo %computername% WinDefend Update Complete >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"

echo ############## >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
echo, >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
echo= >> "\\apps\install_files\User Scripts\WindowsDefenderUpdate\WinDefend-Update-List.txt"
