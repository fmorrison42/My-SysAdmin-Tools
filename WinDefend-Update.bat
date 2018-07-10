

gpupdate /force

sc config WinDefend start= auto

net start WinDefend

cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -removedefinitions -dynamicsignatures
MpCmdRun.exe -SignatureUpdate

Pause
