$nid = (Get-Process notepad).processName
Stop-Process -Name $nid
Wait-Process -Name $nid