#Included functions:
#function ExecuteSqlQuery ($Server, $Database, $SQLQuery) {
#function Set-Task ([string]$Task50,[switch]$Start) # start or end a task
#function get-ProjectList($Server, $Database, $credSql)


# executes a query and populates the $datatable with the data
function ExecuteSqlNonQuery ($Server, $Database, $SQLQuery, $CredSql) {
    $Datatable = New-Object System.Data.DataTable
    
    $Connection = New-Object System.Data.SQLClient.SQLConnection
    #$Connection.ConnectionString = "server='$Server';database='$Database';trusted_connection=true;"
    $Connection.Credential = $credSql
    $Connection.ConnectionString = ("Server=tcp:" + $Server + ",1433;Database=" + $Database + ";Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;")
    #$Connection.ConnectionString = ("Server Name=myServerAddress;Database Name=myDataBase;User ID=myUsername;Password=myPassword;")
 
    $Connection.Open()
    $Command = New-Object System.Data.SQLClient.SQLCommand
    $Command.Connection = $Connection
    $Command.CommandText = $SQLQuery
    $Command.ExecuteNonQuery()
    $Connection.Close()
    
    return $Datatable
}


function ExecuteSqlQuery ($Server, $Database, $SQLQuery, $CredSql) {
    $Datatable = New-Object System.Data.DataTable
    
    $Connection = New-Object System.Data.SQLClient.SQLConnection
    #$Connection.ConnectionString = "server='$Server';database='$Database';trusted_connection=true;"
    $Connection.Credential = $credSql
    $Connection.ConnectionString = ("Server=tcp:" + $Server + ",1433;Database=" + $Database + ";Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;")
    #$Connection.ConnectionString = ("Server Name=myServerAddress;Database Name=myDataBase;User ID=myUsername;Password=myPassword;")
 
    $Connection.Open()
    $Command = New-Object System.Data.SQLClient.SQLCommand
    $Command.Connection = $Connection
    $Command.CommandText = $SQLQuery
    $Reader = $Command.ExecuteReader()
    $Datatable.Load($Reader)
    $Connection.Close()
    
    return $Datatable
}


function get-ProjectList($Server, $Database, $credSql)
{
    [string] $UserSqlQuery= $("SELECT * FROM [dbo].[Projects]")
    $Datatable = New-Object System.Data.DataTable
    $Datatable = ExecuteSqlQuery $Server, $Database, $SQLQuery, $credSql
    return $Datatable
}