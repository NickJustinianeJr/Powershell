


$processes Get-Process chrome,explorer

Foreach ($process in $processes) {

	$processId = $process.Id
	
	$processId

	#Unpause-Process -ID $processId
}




#$processIds = Get-Process -Name chrome,explorer | Select -ExpandProperty ID

#Foreach ($pid in $processIds) {

	#$pid = $process.Id
	
	#$pid

	#Unpause-Process -ID $PId
#}
