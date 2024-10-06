<#
    .DESCRIPTION
        Display's the content of a file
    .EXAMPLE
        GetFileContent.ps1 -FilePath C:\Path\To\File.txt

        Displays the content of File.txt
#>

param(
    # Path to which the content needs to be viewed
    [Parameter(Mandatory = $true)]
    [string]
    $FilePath
)

if (Test-Path $FilePath){
    try {
        Get-Content -Path $FilePath
    }
    catch {
        Write-Host "An error occurred while reading the file: $_"
    }
}