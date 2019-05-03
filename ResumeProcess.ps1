while($true) {

	$atiesrxx = pssuspend -r atiesrxx
	$atieclxx = pssuspend -r atieclxx
	$CCC = pssuspend -r CCC
	$chrome = pssuspend -r chrome
	$cmd = pssuspend -r cmd
	$Code = pssuspend -r Code
	$CodeHelper = pssuspend -r CodeHelper
	$conhost = pssuspend -r conhost
	$csrss = pssuspend -r csrss
	$devenv = pssuspend -r devenv
	$dwm = pssuspend -r dwm
	$explorer = pssuspend -r explorer
	$IpOverUsbSvc = pssuspend -r IpOverUsbSvc
	$lsass = pssuspend -r lsass
	$lsm = pssuspend -r lsm
	$mqsvc = pssuspend -r mqsvc
	$mqtgsvc = pssuspend -r mqtgsvc
	$smss = pssuspend -r smss
	$services = pssuspend -r services
	$SMSvcHost = pssuspend -r SMSvcHost
	$spoolsv = pssuspend -r spoolsv
	$svchost = pssuspend -r svchost
	$taskeng = pssuspend -r taskeng
	$taskhost = pssuspend -r taskhost
	$taskmgr = pssuspend -r taskmgr
	$wininit = pssuspend -r wininit
	$winlogon = pssuspend -r winlogon
	$WmiPrvSE = pssuspend -r WmiPrvSE
	$wmpnetwk = pssuspend -r wmpnetwk	
	
	$powershell = pssuspend -r powershell
	$node = pssuspend -r node
	$notepad = pssuspend -r notepad
	$pssuspend = pssuspend -r pssuspend
	$snmp = pssuspend -r snmp
	
	#$ServiceHubHostCLRx86 = pssuspend -r ServiceHub.Host.CLR.x86
	#$ServiceHubHostNodex86 = pssuspend -r ServiceHub.Host.Node.x86
	#$ServiceHubIdentityHost = pssuspend -r ServiceHub.IdentityHost
	#$ServiceHubRoslynCodeAnalysisService32 = pssuspend -r ServiceHub.RoslynCodeAnalysisService32
	#$ServiceHubSettingsHost = pssuspend -r ServiceHub.SettingsHost
	#$ServiceHubVSDetouredHost = pssuspend -r ServiceHub.VSDetouredHost
	
	#$ServiceHubHostCLRx86 -And $ServiceHubHostNodex86 -And $ServiceHubIdentityHost -And $ServiceHubRoslynCodeAnalysisService32 -And $ServiceHubSettingsHost -And $ServiceHubVSDetouredHost -And 
		
	$snmp -And $pssuspend -And $notepad -And $node -And $powershell -And $atiesrxx -And $atieclxx -And $CCC -And $chrome -And $cmd -And $Code -And $CodeHelper -And $conhost -And $csrss -And $devenv -And $dwm -And $explorer -And $IpOverUsbSvc -And $lsass -And $lsm -And $mqsvc -And $mqtgsvc -And $services -And $smss -And $SMSvcHost -And $spoolsv -And $svchost -And $taskeng -And $taskhost -And $taskmgr -And $wininit -And $winlogon -And $WmiPrvSE -And $wmpnetwk
}