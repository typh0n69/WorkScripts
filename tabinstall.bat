pause
manage-bde -off C:
pause
start \\criswellgbfs1\files\TabInstall\SentinelAgent_windows_v3_7_2_45.exe /SITE_TOKEN=eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS1zd3ByZDEuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImZjZGU5ZWQ0M2RkMWQyMTkifQ== /s /x /b"C:\ProgramFiles" /v"/qn" && msiexec /I \\criswellgbfs1\files\TabInstall\MerakiPCCAgent.msi /quiet && msiexec /i \\criswellgbfs1\files\TabInstall\GoogleChromeStandaloneEnterprise64.msi /quiet && msiexec /i \\criswellgbfs1\files\TabInstall\Firefox7201.msi /quiet 
pause
msiexec /I RingCentral-19.12.1-x64.msi ALLUSERS=1 INSTALLFOLDER="%ProgramFiles%\RingCentral" /passive
pause
start \\criswellgbfs1\files\TabInstall\NCentral2036WindowsAgentSetup.exe
pause
start \\criswellgbfs1\files\O365\Setup.exe /configure \\criswellgbfs1\files\tabinstall\config.xml
pause
start \\criswellgbfs1\files\TabInstall\MSO-Installer\Setup.exe /adminfile \\criswellgbfs1\files\tabinstall\mso-installer\config.MSP
pause
manage-bde -status
pause
manage-bde -on C:
pause
call \\criswellgbfs1\files\TabInstall\OA1.bat
call \\criswellgbfs1\files\TabInstall\Login.bat
pause
powershell.exe -Command "& '\\criswellgbfs1\files\TabInstall\BiLHAidER.ps1'"
echo "installation has finished"
pause
netsh wlan delete profile name=* i=*
echo "computer will restart to enable bitlocker"
shutdown /r /t 00
