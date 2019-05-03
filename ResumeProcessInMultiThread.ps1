
$processList = Get-Process | Get-Unique
$processCount = $processList.Count

$processNames = ""
$counter = 0

Foreach ($process in $processList) {

	$counter++	
	
	$processName = $process.ProcessName
	
	$processList = Get-Process -Name $processName
	
	Foreach ($process in $processList)
	{
		$pid = $process.ProcessName
		Write-Output $pid
	}	
	
	#$processId = $process.Id

	#$processInfo = $processName + ": " + $processId
	
	#Write-Output $processInfo
	
	#Try
	#{
	#	pssuspend -r $processName
	#}
	#Catch
	#{
	#	$ErrorMessage = $_.Exception.Message
	#	$FailedItem = $_.Exception.ItemName
	#	Write-Output $FailedItem + ": " + $ErrorMessage
	#}
	
	#$processNames += "pssuspend -r " + $processName
	#Write-Output $processCount
	
	#if ($counter -ne $processCount) {
	#	$processNames += " -And "
	#}
}

#$processNames

#Write-Output $processNames


#while($true) {

#			Try
#			{
#				Invoke-Expression $processNames
#			}
#			Catch
#			{
#				$ErrorMessage = $_.Exception.Message
#				$FailedItem = $_.Exception.ItemName
#				Write-Output $FailedItem + ": " + $ErrorMessage
#				Break
#			}
			
#}