#Helper functions here

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

