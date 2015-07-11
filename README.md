# HDDSpaceChecker
A simple PowerShell script to check HDD space on network machines.

# Usage:
1. Doownload the files.
2. Add the names of your network machines to Machines.txt, each machine on a seperate line.
2. Right click on HDDChecker.ps1 and choose "Run with PowerShell".
3. The script will run and output the free space values on your screen.

# Tips:
* if you face this error "HDDChecker.ps1 cannot be loaded because the execution of scripts is disabled on this system.", execute this command on the same powershell terminal: Set-ExecutionPolicy RemoteSigned
