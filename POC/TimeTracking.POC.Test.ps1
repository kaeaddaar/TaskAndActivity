."C:\Users\playi\Documents\GitHub\TaskAndActivity\POC\TimeTracking.POC.ps1"

#Run simple test to ensure TimeTracking.POC is working
$Global:Task = [Task]::new()
$Global:Task.Description = "Test"
$Global:Task.StartTask()

Start-Sleep -Seconds 10
$Global:Task.StopTask()
$Global:task.Save(${function:Save-Sql})

break
# ----- normal usage -----
$Task = [Task]::new() # auto starts the timer
$Task.Description = "Description of what you do goes here"

