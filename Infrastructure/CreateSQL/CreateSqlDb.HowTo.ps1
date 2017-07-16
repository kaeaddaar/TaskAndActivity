# How to create a database in an existing logical Sql Server

# ----- Arrange -----

#Get-AzureRmResourceGroup
$ResourceGroup = "Data"
$DatabaseName = "Test1"
$ServerName = "cmArtSqlServer1".ToLower()

New-AzureRmSqlDatabase -DatabaseName $DatabaseName -ServerName $ServerName -RequestedServiceObjectiveName "Basic" -ResourceGroupName $ResourceGroup


