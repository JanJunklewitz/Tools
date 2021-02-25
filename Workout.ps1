$base_repo = "C:\SNG\Workspace"
Import-Module ".\Utilities.psm1"
$force_cloning = $true

function voice_and_text_msg($msg){
	Write-Host "##### $msg ##############" -ForegroundColor blue
	
	$voice = New-Object -ComObject Sapi.spvoice
	$voice.rate = 0
	$voice.speak($msg)
}

function exercise ($time = 60, $name = ""){
	[System.console]::beep(2000,500)
	voice_and_text_msg "Start exercise $name for $time seconds!"
	Start-Sleep -s $time	
	echo "" # new line
}

function done (){
	voice_and_text_msg "You finished you Workout!!"
}

function workout_1(){		
	exercise 1 "Burpee"
	exercise 1 "Push Ups"
	exercise 1 
	exercise 1 "Dead Lift"
}

function workout_2(){		
	exercise 1 "Crunsh"
	exercise 1 "Plank"
	exercise 1 "Jumping Jacks"
	exercise 1 "Rope skipping"
}

workout_1
workout_2
done

pause