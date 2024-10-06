<#
    .DESCRIPTION
        Deletes a file or folder
    .EXAMPLE
        DeleteFileFolder.ps1 -File C:\Path\To\File.txt

        Deletes the 'C:\Path\To\File.txt' file from the host
    .EXAMPLE
        DeleteFileFolder.ps1 -Folder C:\Path\To\Folder

        Deletes the 'C:\Path\To\Folder' directory from host.
#>

param (
    # Path of the file to delete
    [Parameter]
    [string]
    $File,
    # Path of the folder or directory to delete
    [Parameter]
    [string]
    $Folder
)

if($File){
    Remove-Item -Path $File -Force
}
elseif ($Folder) {
    Remove-Item -Path $Folder -Force
}
else {
    <# Action when all if and elseif conditions are false #>
    Write-Host "Error: Please provide either a file path using '-File' or a folder/directory path using '-Folder'."
}