#How to create a table within an azure sql database

# ----- Arrange -----

#Get-AzureRmResourceGroup
$ResourceGroup = "Data"
$DatabaseName = "Test1"
$ServerName = "cmartsqlserver1"
$FQServerName = "cmartsqlserver1.database.windows.net".ToLower()
$TableName = "Table1"
[string] $UserSqlQuery= $("SELECT * FROM [dbo].[TableName]")

# ----- Act -----
if ($HaveCred -ne $true) 
{ 
    $cred = Get-Credential
    $Password = $cred.Password
    $Password.MakeReadOnly()
    $credSql = New-Object System.Data.SqlClient.SqlCredential($cred.UserName, $Password)
    $HaveCred = $true 
}

# ----- Analysis -----
# I have some research to do, as I want to use the System.Data methods that I was using for my access to data research and HowTo from other projects
$Connection = New-Object System.data.sqlclient.sqlconnection
$Datatable = New-Object System.Data.DataTable

$Connection.Credential = $credSql
$Connection.ConnectionString = ("Server=tcp:$FQServerName,1433;Database=$DatabaseName;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;")

$Connection.Open()


