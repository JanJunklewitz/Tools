function voice_and_text_100msg($msg){
	Write-Host "##### $msg ##############" -ForegroundColor blue
	
	$voice = New-Object -ComObject Sapi.spvoice
	$voice.rate = 0
	$voice.speak($msg)
}

function exercise ($time = 60, $name = ""){	

	
	voice_and_text_100msg "Start exercise $name for $time seconds!"
	
	$time_100ms = $time*10
	for($t_100ms = 0; $t_100ms -le $time_100ms; $t_100ms++)
	{
		$percent_done = $t_100ms / $time_100ms * 100
		$seconds_remaining = ($time_100ms - $t_100ms)/10
		# Write-Progress -Activity "Activity" -SecondsRemaining $seconds_remaining -Status "name";
		Write-Progress -Activity "Activity" -PercentComplete $percent_done -Status "Remaining time $($seconds_remaining)s";
		Sleep -Milliseconds  100;
	}
	[System.console]::beep(2000,500)
	echo "" # new line
}

function done (){
	voice_and_text_100msg "You finished you Workout!!"
}

function workout_1(){		
	exercise 10 "Burpee"
	exercise 10 "Push Ups"
	exercise 10 
	exercise 10 "Dead Lift"
}

function workout_2(){		
	exercise 5 "Crunsh"
	exercise 5 "Plank"
	exercise 5 "Jumping Jacks"
	exercise 5 "Rope skipping"
}

workout_1
workout_2
done

pause