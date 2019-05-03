$Status=Get-WMIObject win32_systemdriver | where {$_.DisplayName -like "TCP/IP Registry Compatibility"}
$Status.State = "Stopped"
$Status.put()

$Status=Get-WMIObject win32_systemdriver | where {$_.DisplayName -like "Reliable Multicast Protocol"}
$Status.State = "Stopped"
$Status.put()