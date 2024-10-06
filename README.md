# MDE LiveResponse PowerShell Scripts

This repository contains multiple PowerShell scripts that can help you while using Microsoft Defender for Endpoint (MDE)'s Live Response.

MDE doesn't have the capability to run native PowerShell commands and it is a pain. But the functionality of uploading a powershell script bypasses this issue.

The following scripts are included to help in IR investigations:

+ [DeleteFileFolder.ps1](DeleteFileFolder.ps1)
    
    + Deletes a file or directory

+ [DeleteRegistry.ps1](DeleteRegistry.ps1)

    + Delete a registry value from the provided path

+ [DeleteScheduledTasks.ps1](DeleteScheduledTasks.ps1)

    + Deletes a scheduled task by Task Name

+ [GetFileContent.ps1](GetFileContent.ps1)

    + Viewing a file contents

+ [KillProcess.ps1](KillProcess.ps1)

    + Kills a process by process ID (PID)

As these above scripts are *unsigned*, make sure `Live Response unsigned script execution` is **Enabled**

### Executing a script

+ Go to Device page
+ Initiate Live Response session
+ Upload File to library to upload script using the `Upload File to library` feature or `putfile` cmdlet in Live Response session
+ After uploading the script to the library execute: `run <SCRIPT-YOU-WANT-TO-RUN.ps1> <Arguments>`

### Live Response Documentation

+ [Investigate entities on devices using live response](https://learn.microsoft.com/en-us/defender-endpoint/live-response)

+ [Live response command examples](https://learn.microsoft.com/en-us/defender-endpoint/live-response-command-examples)

+ [Incident Response Part 3: Leveraging Live Response](https://kqlquery.com/posts/leveraging-live-response/)