function voice_and_text_msg($msg){
	Write-Host "$msg" -ForegroundColor green
	
	$voice = New-Object -ComObject Sapi.spvoice
	$voice.rate = 0
	$voice.speak($msg)
}

function log($msg) {
	Add-Content -Path .\Workout.log -Value $msg 
}

function log_date($msg) {
	$msg = "$(Get-Date) $msg"
	log $msg
}

function exercise ($time, $name){	
	voice_and_text_msg "Start exercise '$name' for $time seconds!"
	
	for($t = 0; $t -le $time; $t++)
	{
		
		$percent_done = $t / $time * 100
		$seconds_remaining = $time - $t
		Write-Progress -Activity "$name" -PercentComplete $percent_done -Status "Remaining time $($seconds_remaining)s";
		Sleep -Milliseconds  1000;
			
		# abort exercise on 'q'
		if ([Console]::KeyAvailable) {
			$keypressed = [Console]::ReadKey("NoEcho").Key
			# # clears the the buffer if more than one key was pressed during sleep
			# while ([Console]::KeyAvailable) {
		
				# $null = [Console]::ReadKey("NoEcho")
			# }
			
			if($keypressed -eq 'q'){
				
				Write-Host "Aborting exercise '$name'!" -ForegroundColor yellow
				break;
			}

		}
	}
	log "   Exercise '$name' for $time"
	[System.console]::beep(2000,500)
	echo "" # new line
}

# focus on chest and core
function workout_1(){		
	$msg = "workout 1 - focus on chest and core"
	Write-Host $msg -ForegroundColor green
	log_date $msg
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

function workout_2(){		
	$msg = "workout 2 - focus on back and core"
	Write-Host $msg -ForegroundColor green
	log_date $msg
	exercise 60 "jumping jacks"
	exercise 60 "purpees"
	exercise 60 "opposite leg and arm rise"
	exercise 60 "walking push ups"
	exercise 60 "sit-ups"
	exercise 60 "reverse angles"
	exercise 60 "handstand"
	exercise 60 "elbow plank"
	exercise 60 "butterfly reverse"
	exercise 60 "superman"
}


function workout_3(){	
	$msg = "workout 3 - focus on leg and core"
	Write-Host $msg -ForegroundColor green
	log_date $msg
	exercise 60 "rope skipping"
	exercise 60 "squats"
	exercise 60 "lunges"
	exercise 60 "burpee"
	exercise 60 "handstand"
	exercise 60 "jumps"
	exercise 60 "reverse angles"
	exercise 60 "sit-ups"
	exercise 60 "plank right"
	exercise 60 "plank left"
}

function workout_4(){	
	$msg = "workout 4 - full body"
	Write-Host $msg -ForegroundColor green
	log_date $msg
	
	exercise 60 "rope skipping"
	exercise 60 "bridges"
	exercise 60 "push ups"
	exercise 60 "bicycle crunches"
	exercise 60 "handstand"
	exercise 60 "walking push ups"
	exercise 60 "crunch"
	exercise 60 "opposite leg and arm rise"
	exercise 60 "reverse angles"
	exercise 60 "butterfly reverse"
	exercise 60 "superman"	
	exercise 60 "squats"
	exercise 60 "jumps"
	exercise 45 "plank left"
	exercise 45 "plank right"
	exercise 45 "elbow plank"
}

function workout_5(){	
	$msg = "workout 5 - full body 2"
	Write-Host $msg -ForegroundColor green
	log_date $msg
	
	exercise 60 "rope skipping"
	exercise 60 "bridges"
	exercise 60 "push ups"
	exercise 30 "handstand"
	exercise 60 "walking push ups"
	exercise 30 "handstand"
	exercise 45 "crunch"
	exercise 60 "opposite leg and arm rise"
	exercise 30 "handstand"
	exercise 45 "bicycle crunches"
	exercise 60 "reverse angles"
	exercise 60 "butterfly reverse"
	exercise 60 "squats"
	exercise 60 "superman"	
	exercise 60 "jumps"
	exercise 45 "plank left"
	exercise 45 "plank right"
	exercise 45 "elbow plank"
}


function workout_6(){	
	$msg = "workout 6 - posture"
	Write-Host $msg -ForegroundColor green
	log_date $msg
	
	exercise 60 "Over-And-Backs"
	exercise 60 "Cobra Pose"
	exercise 20 "Childs Pose"
	exercise 20 "Stand And Reach - left"
	exercise 20 "Stand And Reach - right"
	exercise 60 "Wall Slides With Chin Nod"
	exercise 20 "Quadruped Thoracic Rotations left"
	exercise 20 "Quadruped Thoracic Rotations right"
	exercise 20 "Childs Pose"
	exercise 30 "Kneeling Hip Flexor Strech left"
	exercise 30 "Kneeling Hip Flexor Strech right"
	exercise 45 "Pigeon Strech left"
	exercise 45 "Pigeon Strech right"
	exercise 60 "Glute Bridges"
}

function workout($workout_number) {
	$count_workouts = 3;
	switch ($workout_number % $count_workouts) {
		0 { workout_1 }
		1 { workout_2 }
		2 { workout_3 }
		# 3 { workout_4 }
		default { Write-Host "invalid workout_number $workout_number" -ForegroundColor red }
	}
}
	
$n = 0
$path = ".\Workout.clixml";
if(Test-Path -Path $path){
	$n = Import-Clixml -path $path;
	$n = $n + 1;
}
$n | Export-Clixml -path $path;


$t_start = Get-Date
# workout $n
workout_6

$t_end = Get-Date
$dt = $t_end - $t_start
$seconds = $dt.Seconds
$minutes = $dt.Minutes
voice_and_text_msg "Congratulations you finished your Workout. It lasted for $minutes minutes and $seconds seconds." 