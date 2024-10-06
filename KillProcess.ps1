<#
    .DESCRIPTION
        Kills a given process by process ID (PID)
    .EXAMPLE
        KillProcess.ps1 -PID 1234

        Kills the process with PID 1234
#>

param (
    # Process ID
    [Parameter(Mandatory=$true)]
    [Int]
    $PID
)

Stop-Process -ID $PID -Force