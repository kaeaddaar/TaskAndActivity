#Run Tests for the CreateSqlServer.POC.Class
."C:\Users\playi\Documents\GitHub\TaskAndActivity\POC\TimeTracking.POC.Class.ps1"

function test-DoStuff()
{
    write-host "DoStuff"
}

[System.Management.Automation.ScriptBlock]$someDelegate = ${function::test-DoStuff}
$T = [Task]::new()
$t.Description = "Test"
$result = $t.Save($someDelegate)


