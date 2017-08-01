."C:\Users\playi\Documents\GitHub\TaskAndActivity\POC\TimeTracking.POC.functions.ps1"
."C:\Users\playi\Documents\GitHub\TaskAndActivity\POC\TimeTracking.POC.Class.ps1"
#Included functions:
#function ExecuteSqlQuery ($Server, $Database, $SQLQuery) {
#function get-ProjectList($Server, $Database, $credSql)

function Set-Task ([string]$Task255,[datetime]$StartDateTime, [datetime]$EndDateTime, [string]$Server, [string]$Database, [System.Data.SqlClient.SqlCredential]$credSql) # start or end a task
{
    [string]$StartEndDateTime = get-date -Format "yyyy-MM-dd HH:mm:ss"
    $sql = ("INSERT INTO [dbo].[Task] (Description, StartDateTime, EndDateTime) VALUES ('" + $Task255 + "', '" + $StartDateTime + "', '" + $EndDateTime + "' );")
    executesqlquery -Server $Server -Database $Database -SQLQuery $sql -CredSql $credSql
}

function Save-Sql()
{
    [string] $Server= "cmArtSqlServer1.database.windows.net"
    [string] $Database = "TimeTracking"
    $T = $Global:Task
    if ($Global:HaveCred -ne $true) 
    { 
        $cred = Get-Credential -Message "Please supply the username and password of the database $Database on the server $Server"
        $Password = $cred.Password
        $Password.MakeReadOnly()
        $Global:credSql = New-Object System.Data.SqlClient.SqlCredential($cred.UserName, $Password)
        $Global:HaveCred = $true 
    }
    
    Set-Task -Task255 $T.Description -StartDateTime $T.StartDateTime -EndDateTime $T.EndDateTime -Server $Server -Database $Database -credSql $credSql
    return $true
}

$Global:Task = [Task]::new()
$Global:Task.Description = "Test"
$Global:Task.StartTask()

Start-Sleep -Seconds 10
$Global:Task.StopTask()
$Global:task.Save(${function:Save-Sql})
## declaration not necessary, but good practice
#$resultsDataTable = New-Object System.Data.DataTable
#$resultsDataTable = ExecuteSqlNonQuery $Server $Database $UserSqlQuery $credSql


