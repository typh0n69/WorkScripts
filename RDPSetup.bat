set /p rdp_user="Enter Username of RDPer "

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
net localgroup "Remote Desktop Users" /add %rdp_user%
