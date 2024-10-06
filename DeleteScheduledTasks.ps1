<#
    .DESCRIPTION
        Deletes the provided scheduled tasks
    .EXAMPLE
        DeleteScheduledTasks.ps1 -TaskName 'ScheduledTaskName'
#>

param (
    # Scheduled Task Name
    [Parameter]
    [string]
    $TaskName
)

if ($TaskName){
    try {
        $task = Get-ScheduledTask -TaskName $TaskName
        if ($task){
            #Deletes/Unregisters the scheduled task

            Unregister-ScheduledTask -TaskName $TaskName -Confirm
            Write-Host "Scheduled Task '$TaskName' has been deleted"
        }
    }
    catch {
        <#Do this if a terminating exception happens#>
        Write-Host "Scheduled task '$TaskName' does not exist."
    }
}
else {
    Write-Host "Error: Please provide a task name using the -TaskName parameter."
}