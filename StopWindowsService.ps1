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

Stop-WindowsService -ServiceName "IP Helper"