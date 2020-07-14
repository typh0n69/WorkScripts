$computername = hostname #sets string variable $computername to output of hostname
net use Z: \\criswell\files #mounts the fileserver to host computer
$sn = gwmi win32_bios | select -Expand serialnumber | out-string #sets serial number of computer to string variable $sn
New-object psobject -Property @{ 
    "Mac Address" = $(Get-NetAdapter -Name "Wi-Fi").MacAddress
} | Export-Csv -Path Z:\TabInstall\Mac_Addresses\HWADRtabs.csv -NoTypeInformation -Append #Adds the mac address to a csv file so we can update DHCP
manage-bde -protectors -get C: > \\criswell\files\bit\$computername.txt #gets the backup key for bitlocker and outputs to fileserver with computer name as filename
$sn + $computername > Z:\TabInstall\EverySNandHN\$computername.txt #this takes the serial number and computer name and puts it into a file on net drive
net use Z: /delete #this unmounts the network drive after the script completes
