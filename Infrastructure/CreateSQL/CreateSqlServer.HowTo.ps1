#How To code exploring how to create a SQL Server in Azure (not a Vm hosting SQL Server, but the service)

#Prepare variables
$ServerName = "cmArtSqlServer1".ToLower()
$Cred = Get-Credential -Message "Please enter the admin credentials for the SQL Server being created"
#Get-AzureRmResourceGroup
$ResourceGroup = "Data"

#Get-AzureRmLocation
$Location = "canadacentral"


# ----- Create a logical server -----
New-AzureRmSqlServer -ServerName $ServerName -SqlAdministratorCredentials $cred -Location $Location -ResourceGroupName $ResourceGroup




