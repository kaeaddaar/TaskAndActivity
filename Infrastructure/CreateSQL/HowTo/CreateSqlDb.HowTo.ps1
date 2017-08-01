# How to create a database in an existing logical Sql Server

# ----- Arrange -----

#Get-AzureRmResourceGroup
$ResourceGroup = "Data"
$DatabaseName = "Task"
$ServerName = "cmArtSqlServer1".ToLower()

New-AzureRmSqlDatabase -DatabaseName $DatabaseName -ServerName $ServerName -RequestedServiceObjectiveName "Basic" -ResourceGroupName $ResourceGroup


break
# ----- Get info about database and maybe change pricing tier -----
$DB = Get-AzureRmSqlDatabase -DatabaseName $DatabaseName -ServerName $ServerName -ResourceGroupName $ResourceGroup
$DB.CurrentServiceObjectiveName    # Gives us the pricing tier

# DatabaseName is case sensitive
Remove-AzureRmSqlDatabase -DatabaseName "Test1" -ServerName $ServerName -ResourceGroupName $ResourceGroup

