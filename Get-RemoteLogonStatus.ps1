<#
.Synopsis
This function will return the logged-on status of a local or remote computer
.EXAMPLE
GetRemoteLogonStatus test-computer
#>
function Get-RemoteLogonStatus
{
  #  Param (
   #     [string[]]$computerName = 'localhost'
    #)
    $computerName = Get-Content "C:\serverlist.txt"
    foreach( $c in $computerName)
    {
        if (Test-Connection $c -Count 2 -Quiet) {
            try {
                $user = $null
                $user = gwmi -Class win32_computersystem -ComputerName $c | select -ExpandProperty username -ErrorAction Stop
                #$user = Get-CimInstance -Class win32_computersystem -ComputerName $c | select -ExpandProperty username -ErrorAction Stop
                }
            catch { "Not logged on to $c"; return }
            try {
                if ((Get-Process logonui -ComputerName $c -ErrorAction Stop) -and ($user)) {
                    "$c locked by $user"
                    }
                }
            catch { if ($user) { "$user logged on to $c" } }
            }
        else { "$c Offline" }
    }
}

Get-RemoteLogonStatus
