

function voice_and_text_100msg($msg){
	Write-Host "##### $msg ##############" -ForegroundColor blue
	
	$voice = New-Object -ComObject Sapi.spvoice
	$voice.rate = 0
	$voice.speak($msg)
}

function exercise ($time, $name){	

	voice_and_text_100msg "Start exercise $name for $time second(s)!"
	
	$time_100ms = $time*10
	for($t_100ms = 0; $t_100ms -le $time_100ms; $t_100ms++)
	{
		$percent_done = $t_100ms / $time_100ms * 100
		$seconds_remaining = ($time_100ms - $t_100ms)/10
		Write-Progress -Activity "$name" -PercentComplete $percent_done -Status "Remaining time $($seconds_remaining)s";
		Sleep -Milliseconds  100;
	}
	[System.console]::beep(2000,500)
	echo "" # new line
}

function done (){
	voice_and_text_100msg "You finished you Workout!!"
}

function workout_1(){		
	exercise 60 "jumping jacks"
	exercise 60 "squats"
	exercise 60 "lunges"
	exercise 60 "leg raise"
	exercise 60 "handstand"
	exercise 60 "walking push ups"
	exercise 60 "crunsh"
	exercise 60 "burpee"
	exercise 60 "superman"
	exercise 60 "opposite leg and arm rise"
	exercise 60 "plank"
}

function workout_2(){			
	exercise 60 "jumping jacks"
	exercise 60 "squats"
	exercise 60 "lunges"
	exercise 60 "leg raise"
	exercise 60 "handstand"
	exercise 60 "walking push ups"
	exercise 60 "crunsh"
	exercise 60 "burpee"
	exercise 60 "superman"
	exercise 60 "opposite leg and arm rise"
	exercise 60 "plank"
}

workout_1
workout_2
done

pause