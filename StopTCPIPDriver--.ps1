Function Wait-ServiceState {
    param (
        [string]$ServiceName,
        [ValidateSet("Running", "StartPending", "Stopped", "StopPending", "ContinuePending", "Paused", "PausePending")][string]$ServiceState,
        [int]$SecondsToWait = 30
    )
    $counter = 0
    $ServiceStateCorrect = $False
    do {
        $counter++
        Start-Sleep -Milliseconds 250
        $serviceInfo = Get-Service $ServiceName
        If ($serviceInfo.Status -eq $ServiceState) {
            $ServiceStateCorrect = $True
            Break
        } else {
            if (($Counter * .250) % 1 -eq 0) {
                Write-Host "$($counter * .250)/$SecondsToWait [$($ServiceName)] State is not $ServiceState"
            }
        }
    } until (($counter * .250) -ge $SecondsToWait)
    Return $ServiceStateCorrect
}

Function Stop-WindowsService {
    Param(
        [string]$ServiceName,
        [int]$SecondsToWait = 30
    )
 
    Stop-Service $ServiceName -Force -ErrorAction SilentlyContinue
    $ServiceStateCorrect = Wait-ServiceState $ServiceName "Stopped" $SecondsToWait
 
    If ($ServiceStateCorrect) {
        Return $True
    } else {
        Return $false
    }
}


Stop-WindowsService -ServiceName "TCP/IP NetBIOS Helper"
Stop-WindowsService -ServiceName "IP Helper"
Stop-WindowsService -ServiceName "DNS Client"
Stop-WindowsService -ServiceName "WinHTTP Web Proxy Auto-Discovery Service"
Stop-WindowsService -ServiceName "DHCP Client"
Stop-WindowsService -ServiceName "IPSec Policy Agent"
Stop-WindowsService -ServiceName "Network List Service"
Stop-WindowsService -ServiceName "Network Location Awareness"
Stop-WindowsService -ServiceName "Client for NFS"

$Status=Get-WMIObject win32_systemdriver | where {$_.DisplayName -like "TCP/IP Registry Compatibility"}
$Status.State = "Stopped"
$Status.put()

$Status=Get-WMIObject win32_systemdriver | where {$_.DisplayName -like "Reliable Multicast Protocol"}
$Status.State = "Stopped"
$Status.put()

$Status=Get-WMIObject win32_systemdriver | where {$_.DisplayName -like "Server for NFS Open RPC (ONCRPC)"}
$Status.State = "Stopped"
$Status.put()

$Status=Get-WMIObject win32_systemdriver | where {$_.DisplayName -like "NetBT"}
$Status.State = "Stopped"
$Status.put()

$Status=Get-WMIObject win32_systemdriver | where {$_.DisplayName -like "NetIO Legacy TDI Support Driver"}
$Status.State = "Stopped"
$Status.put()

Stop-WindowsService -ServiceName "DHCP Client"

$Status=Get-WMIObject win32_systemdriver | where {$_.DisplayName -like "TCP/IP Protocol Driver"}
$Status.State = "Stopped"
$Status.put()