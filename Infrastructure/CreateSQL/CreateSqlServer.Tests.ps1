#Create Sql Server tests to be held here 

# ----- issue based tests -----
# these tests are created when we run into an issue

function Test-CreateSqlServer-ServernameAllLowercase()
{
    #arrange

    #act

    #assert
    return $false
}

function Assert-StringIsLowerCase ([string]$str)
{
    #here is a way to get the string into an array of characters
    #[char[]]$Arr = $str.ToCharArray()
    if ($str -cmatch "^[^A-Z]*$")
    {
        return $true
    }
    else
    {
        return $false
    }
}

