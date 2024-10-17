<#
    .DESCRIPTION
        Deletes the provided Windows service
    .EXAMPLE
        DeleteService.ps1 -Name Test

        Deletes the service name 'Test' from the host.
#>

param (
    # Get the service name
    [Parameter(Mandatory=$true)]
    [string]
    $Name
)

$service = Get-Service -Name $Name -ErrorAction SilentlyContinue

if ($null -eq $service ) {
    Write-Host "No service found with name $Name"
}
# If the service is found stop the service and then delete it.
else {
    if ($service.Status -eq 'Running') {
        Stop-Service -Name $Name
        Write-Host "Service '$Name' is stopped"
    }
    # Delete service
    $scPath = 'C:\Windows\System32\sc.exe'
    $command = $scPath + " delete $Name"
    Invoke-Expression $command
}