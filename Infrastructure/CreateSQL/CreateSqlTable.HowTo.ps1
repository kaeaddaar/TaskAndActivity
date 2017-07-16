#How to create a table within an azure sql database

# ----- Arrange -----

#Get-AzureRmResourceGroup
$ResourceGroup = "Data"
$DatabaseName = "Test1"
$FQServerName = "cmartsqlserver1.database.windows.net".ToLower()
$TableName = "Table1"

# I have some research to do, as I want to use the System.Data methods that I was using for my access to data research and HowTo from other projects
$Conn = New-Object System.data.sqlclient.sqlconnection

