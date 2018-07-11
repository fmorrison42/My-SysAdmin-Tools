gpupdate /force

sc config WinDefend start= auto
net start WinDefend

net stop wuauserv
net start wuauserv

cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -removedefinitions -dynamicsignatures
MpCmdRun.exe -SignatureUpdate

net stop WinDefend
sc config WinDefend start= disabled

REM pause
