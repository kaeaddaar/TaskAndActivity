# Add ability to set the delegate for the save functionality in a constructor, or a method
# Fix up the error handling, right now because of the try/catch it just ignores errors
# Add ability when you do a save without the EndDateTime, do a quick check and auto save the EndDateTime

Class Task
{
    
    [datetime]$StartDateTime
    [datetime]$EndDateTime
    [string]$Description
    hidden [System.Management.Automation.ScriptBlock]$Delegate

    #constructor
    Task ()
    {
        $this.StartDateTime = Get-Date -Format F
        $this.EndDateTime = "1900-01-01"
        $this.Delegate = {
                Write-host "You have not provided a delegate. Please provide a delegate to the save functionality that you want to run."
                return $false
            }
    }


    [boolean]StartTask()
    {
        try
        {
            $this.StartDateTime = Get-Date -Format F
        }
        catch
        {
            return $false
        }
        return $true
    }

    #overloaded StartTask that accepts a description
    [boolean]StartTask([string]$Description)
    {
        try
        {
            $this.Description = $Description
        }
        catch
        {
            return false
        }
        return $true
    }
    

    [boolean]StopTask()
    {
        try
        {
            $this.EndDateTime = Get-Date -Format g
            
        }
        catch
        {
            return $false
        }
        return $true
    }

    [boolean]Save([System.Management.Automation.ScriptBlock]$Delegate)
    {
        [boolean]$DelegateResult = $false
        try
        {
            $This.Delegate = $Delegate
            $DelegateResult = $this.Delegate.Invoke()
        }
        catch
        {
            return $false
        }
        return $DelegateResult
    }

    [boolean]Save()
    {
        [boolean]$DelegateResult = $false
        try
        {
            $DelegateResult = $this.Delegate.Invoke()
        }
        catch
        {
            return $false
        }
        return $DelegateResult
    }

}
