<#
    .DESCRIPTION
        Retrive drive information of all logical drives present on the host
    .EXAMPLE
        GetDriveInfo.ps1

        Retrieves drive information

#>

$drives = Get-Wmiobject -Class Win32_LogicalDisk

if($drives){
    foreach ($drive in $drives) {
        $totalSizeGB = [math]::round($drive.Size / 1GB, 2)
        $freeSpaceGB = [math]::round($drive.FreeSpace / 1GB, 2)
        $usedSpaceGB = [math]::round(($drive.Size - $drive.FreeSpace) / 1GB, 2)
    
        # Get drive type
        switch ($drive.DriveType) {
            0 { $driveType = "Unknown" }
            1 { $driveType = "No Root Directory" }
            2 { $driveType = "Removable Disk" }
            3 { $driveType = "Local Disk" }
            4 { $driveType = "Network Drive" }
            5 { $driveType = "Compact Disc" }
            6 { $driveType = "RAM Disk" }
            default { $driveType = "Other" }
        }
    
        Write-Host "Drive Letter: $($drive.DeviceID)"
        Write-Host "File System: $($drive.FileSystem)"
        Write-Host "Total Size: $totalSizeGB GB"
        Write-Host "Used Space: $usedSpaceGB GB"
        Write-Host "Free Space: $freeSpaceGB GB"
        Write-Host "Drive Type: $driveType"
        Write-Host ""
    }
}
else {
    Write-Host "No Drives found"
}