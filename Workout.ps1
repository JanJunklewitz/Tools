function voice_and_text_msg($msg){
	Write-Host "$msg" -ForegroundColor green
	
	$voice = New-Object -ComObject Sapi.spvoice
	$voice.rate = 0
	$voice.speak($msg)
}

function exercise ($time, $name){	

	voice_and_text_msg "Start exercise '$name' for $time seconds!"
	
	for($t = 0; $t -le $time; $t++)
	{
		$percent_done = $t / $time * 100
		$seconds_remaining = $time - $t
		Write-Progress -Activity "$name" -PercentComplete $percent_done -Status "Remaining time $($seconds_remaining)s";
		Sleep -Milliseconds  1000;
	}
	[System.console]::beep(2000,500)
	echo "" # new line
}

function done (){
	voice_and_text_msg "You finished you Workout!!"
}

# focus on chest and core
function workout_1(){		
	exercise 60 "high knees"
	exercise 60 "bridges"
	exercise 60 "push ups"
	exercise 60 "bicycle crunches"
	exercise 60 "handstand"
	exercise 60 "walking push ups"
	exercise 60 "crunch"
	exercise 60 "plank left"
	exercise 60 "plank right"
	exercise 60 "superman"
}

# focus on back and core
function workout_2(){		
	exercise 60 "jumping jacks"
	exercise 60 "purpees"
	exercise 60 "opposite leg and arm rise"
	exercise 60 "walking push ups"
	exercise 60 "sit-ups"
	exercise 60 "reverse angles"
	exercise 60 "handstand"
	exercise 60 "ellbow plank"
	exercise 60 "butterfly reverse"
	exercise 60 "superman"
}

function exercise_collection(){			
	exercise 60 "jumping jacks"
	exercise 60 "squats"
	exercise 60 "lunges"
	exercise 60 "leg raise"
	exercise 60 "handstand"
	exercise 60 "walking push ups"
	exercise 60 "crunch"
	exercise 60 "burpees"
	exercise 60 "superman"
	exercise 60 "opposite leg and arm rise"
	exercise 60 "elbow plank"
	exercise 60 "sit-ups"
	exercise 60 "plank left"
	exercise 60 "plank right"
	exercise 60 "reverse crunches"
	exercise 60 "brideges (glute bride)"
	exercise 60 "bicycle crunches"
}

$t_start = Get-Date


workout_2

$t_end = Get-Date
$dt = $t_end - $t_start
$seconds = $dt.Seconds
$minutes = $dt.Minutes
voice_and_text_msg "Congratulations you finished your Workout. It lasted for $minutes minutes and $seconds seconds." 

done
pause