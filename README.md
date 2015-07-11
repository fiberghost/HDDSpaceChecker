# HDDSpaceChecker
A simple PowerShell script to check free HDD space on network machines.

# Usage:
1. Doownload the files.
2. Add the names of your network machines to **Computers.txt**, each machine on a seperate line.
2. Right click on **HDDChecker.ps1** and choose "Run with PowerShell".
3. The script will run and output the free space values on your screen.

# Tips:
* If you face this error **HDDChecker.ps1 cannot be loaded because the execution of scripts is disabled on this system** , execute this command on the same powershell terminal: `Set-ExecutionPolicy RemoteSigned`
* If you want to add a new drive letter, copy this code and paste it inside the foreach loop, then change the DeviceID:

	`	$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $Server -Filter "DeviceID='D:'" | Select-Object Size,FreeSpace
	    if ([math]::Round(($disk.FreeSpace / $ConvertToGB)) -eq 0) {continue}
		"		Free Space D: " + [math]::Round(($disk.FreeSpace / $ConvertToGB),2) + " GB"
	`
