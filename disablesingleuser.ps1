<# run this on a domain controller
do not run this on your computer, nothing will happen
#>

#grabs username that you type in and saves to variable $username

$UserName = Read-Host -Prompt "What is the username of the user you would like to disable?"
disable-adaccount -identity $UserName
get-aduser $UserName | select-object -property $UserName,enabled
pause
echo "If the last line of the script did not result in the enabled status showing as false, run again or txt me or email me, but it should've worked"
pause
