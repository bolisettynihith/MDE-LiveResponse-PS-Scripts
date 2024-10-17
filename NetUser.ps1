<#
    .DESCRIPTION
        Executes `net user` command
    .EXAMPLE
        NetUser.ps1 -Username test123

        Retrieves the information regarding the user `test123` in the domain
    .EXAMPLE
        NetUser.ps1 -Username test123 -active

        Activates the user account `test123` in the domain
    .EXAMPLE
        NetUser.ps1 -Username test123 -deactive

        Deactivates the user account `test123` in the domain
#>

param (
    # Get User input
    [Parameter(Mandatory=$true)][string]$Username,
    # Active switch
    [switch]$active,
    # Deactive
    [switch]$deactive

)

$netPath = 'C:\Windows\System32\net.exe'

function Get-UserAccInfo {
    param (
        [string]$Username
    )
    $command = $netPath + ' USER ' + $Username + ' /domain'
    # Write-Host $command
    Invoke-Expression $command
}

function ActivateDeactive {
    param (
        [string]$Username
    )
    if($active){
        $command = $netPath + ' USER ' + $Username + ' /ACTIVE:YES'
        Invoke-Expression $command
    }
    elseif ($deactive) {
        <# Action when this condition is true #>
        $command = $netPath + ' USER ' + $Username + ' /ACTIVE:NO'
        Invoke-Expression $command
    }
    else{
        Write-Host "No option provided to activate or deactivie the account"
    }
    
}

Get-UserAccInfo $Username
if($active -or $deactive) {
    ActivateDeactive $Username
}