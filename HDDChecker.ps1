<# 
   This is a simple tool for checking HDD Space on network machines
   Thanks for Manas Bhardwaj who wrote this: http://bit.ly/HDDSpaceCheckPowerShell
   Feel free to use it as you want :) .
#>

$ServerName = Get-Content "Computers.txt"
$ConvertToGB = (1024 * 1024 * 1024)
cls
				" 			
		  _   _ ____  ____    ____                          ____ _               _             
		 | | | |  _ \|  _ \  / ___| _ __   __ _  ___ ___   / ___| |__   ___  ___| | _____ _ __ 
		 | |_| | | | | | | | \___ \| '_ \ / _` |/ __/ _ \ | |   | '_ \ / _ \/ __| |/ / _ | '__|
		 |  _  | |_| | |_| |  ___) | |_) | (_| | (_|  __/ | |___| | | |  __| (__|   |  __| |   
		 |_| |_|____/|____/  |____/| .__/ \__,_|\___\___|  \____|_| |_|\___|\___|_|\_\___|_|   
								                                                                                                                
										 "
foreach ($Server in $ServerName) {
	
	"	"+$Server+": "
    $disk = Get-WmiObject Win32_LogicalDisk -ComputerName $Server -Filter "DeviceID='C:'" | Select-Object Size,FreeSpace
	if ([math]::Round(($disk.FreeSpace / $ConvertToGB)) -eq 0) {continue}	
    "		Free Space C: " + [math]::Round(($disk.FreeSpace / $ConvertToGB),2) + " GB"
	
	$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $Server -Filter "DeviceID='E:'" | Select-Object Size,FreeSpace
    if ([math]::Round(($disk.FreeSpace / $ConvertToGB)) -eq 0) {continue}
	"		Free Space E: " + [math]::Round(($disk.FreeSpace / $ConvertToGB),2) + " GB"
	
	
	$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $Server -Filter "DeviceID='F:'" | Select-Object Size,FreeSpace
    if ([math]::Round(($disk.FreeSpace / $ConvertToGB)) -eq 0) {continue}
	"		Free Space F: " + [math]::Round(($disk.FreeSpace / $ConvertToGB),2) + " GB"

	$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $Server -Filter "DeviceID='G:'" | Select-Object Size,FreeSpace
    if ([math]::Round(($disk.FreeSpace / $ConvertToGB)) -eq 0) {continue}
	"		Free Space G: " + [math]::Round(($disk.FreeSpace / $ConvertToGB), 2) + " GB"

	
	$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $Server -Filter "DeviceID='D:'" | Select-Object Size,FreeSpace
    if ([math]::Round(($disk.FreeSpace / $ConvertToGB)) -eq 0) {continue}
	"		Free Space D: " + [math]::Round(($disk.FreeSpace / $ConvertToGB),2) + " GB"

}
