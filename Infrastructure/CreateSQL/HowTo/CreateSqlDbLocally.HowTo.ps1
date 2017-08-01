#Attempting to create a local database and access it without SQL Server
#https://support.microsoft.com/en-ca/help/305079/how-to-create-a-sql-server-database-programmatically-by-using-ado.net
# Requires at least the SQL Server installed with Visual Studio.

$LocalConnection = New-Object System.Data.SqlClient.SqlConnection("Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False")

$str = @"
CREATE DATABASE MyDatabase ON PRIMARY 
          (NAME = MyDatabase_Data, 
           FILENAME = 'E:\DB\MyDatabaseData.mdf', 
           SIZE = 2MB, 
           MAXSIZE = 10MB, 
           FILEGROWTH = 10%) 
           LOG ON 
          (NAME = MyDatabase_Log, 
           FILENAME = 'E:\DB\MyDatabaseLog.ldf', 
           SIZE = 1MB, 
           MAXSIZE = 5MB, 
           FILEGROWTH = 10%) 
"@

$LocalCommand = New-Object System.Data.SqlClient.SqlCommand($str, $LocalConnection)

$LocalConnection.Open()
$LocalCommand.ExecuteNonQuery()


break

# ----- sample XML Code -----
$sleep = 2
write-host "Enter Y if you would like to enter your credentials, or hit ENTER to continue"
$LogonAgain = Read-Host

if($LogonAgain -eq "Y")
{
# enter your logon info
Login-AzureRmAccount -SubscriptionName "Visual Studio Enterprise – MPN"
}

$colRG = Get-AzureRmResourceGroup | Select-Object -Property ResourceGroupName, Location
$path = "C:\Users\playi\OneDrive\Documents\Settings.XML"

[xml]$Settings = Get-Content $path
[System.Xml.XmlNodeList]$NodeList = $Settings.GetElementsByTagName("Setting")
$SettingValue = ""

getSettingValue "TestSetting2"
write-host $SettingValue

function getSettingValue ([string] $SettingName = "TestSetting")
{
    foreach ($Node in $NodeList)
    {
        [System.Xml.XmlElement]$Elem = $Node
        if($Elem.Id -eq $SettingName)
        {
            $SettingValue = $Elem.InnerText
        }
    }
    $SettingValue
}
