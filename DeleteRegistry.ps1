<#
    .DESCRIPTION
        Deletes a registry key based on the given key path and value
    .EXAMPLE
        DeleteRegistry.ps1 -KeyPath HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name Example1234
        
        Deletes the "Example1234" value from Current User's AutoRun key
#>

param (
    # Registry key Path
    [Parameter(Mandatory=$true)]
    [string]
    $KeyPath,
    # Registry Key value
    [Parameter(Mandatory=$true)]
    [string]
    $Name
)

if(Test-Path $KeyPath){
    try {
        Remove-ItemProperty -Path $KeyPath -Name $Name -Force
    }
    catch {
        <#Do this if a terminating exception happens#>
        Write-Host $Error[0].Exception.Message
    }
}