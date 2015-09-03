@echo off
REM "Uninstallation: https://kc.mcafee.com/corporate/index?page=content&id=KB54834"

set Logfile="C:\McUninstall.log"
rm %Logfile%

echo "Kill all McAfee tasks" >> %Logfile% 2>&1
taskkill /IM myAgtSvc.exe /T /F >> %Logfile% 2>&1
taskkill /IM myAgtTry.exe /T /F >> %Logfile% 2>&1
taskkill /IM McShield.exe /T /F >> %Logfile% 2>&1
taskkill /IM McSACore.exe /T /F >> %Logfile% 2>&1
taskkill /IM XTray.exe /T /F >> %Logfile% 2>&1

timeout /t 2 /nobreak

echo Delete files and folders >> %Logfile% 2>&1
del /F /Q /S "C:\Program Files\McAfee\Managed VirusScan" >> %Logfile% 2>&1
del /F /Q /S "C:\Program Files (x86)\McAfee\Managed VirusScan" >> %Logfile% 2>&1
del /F /Q /S "C:\ProgramData\McAfee\Managed VirusScan" >> %Logfile% 2>&1
del /F /Q /S "C:\ProgramData\McAfee\BOPDATA" >> %Logfile% 2>&1
del /F /Q /S "C:\ProgramData\McAfee\Installer" >> %Logfile% 2>&1
del /F /Q /S "C:\ProgramData\McAfee\McLogs" >> %Logfile% 2>&1
del /F /Q /S "C:\ProgramData\mcafee.com" >> %Logfile% 2>&1

timeout /t 2 /nobreak

echo "Delete Registry Keys" >> %Logfile% 2>&1
REM Delete Registry Keys (x86)
reg delete "HKLM\Software\McAfee" /f >> %Logfile% 2>&1
reg delete "HKLM\Software\mcafee" /f >> %Logfile% 2>&1
reg delete "HKLM\Software\McAfee.com" /f >> %Logfile% 2>&1
reg delete "HKLM\Software\Network Associates\VirusScan Enterprise" /f >> %Logfile% 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\MVS" /f >> %Logfile% 2>&1
REM Delete Registry Keys (x64)
reg delete "HKLM\Wow6432Node\Software\McAfee" /f >> %Logfile% 2>&1
reg delete "HKLM\Wow6432Node\Software\mcafee" /f >> %Logfile% 2>&1
reg delete "HKLM\Wow6432Node\Software\McAfee.com" /f >> %Logfile% 2>&1
reg delete "HKLM\Wow6432Node\Software\Network Associates\VirusScan Enterprise" /f >> %Logfile% 2>&1
reg delete "HKLM\Wow6432Node\Software\Microsoft\Windows\CurrentVersion\Uninstall\MVS" /f >> %Logfile% 2>&1
REM Delete Registry Keys (x86 und x64)
reg delete "HKLM\SYSTEM\CurrentControlSet\services\McShield" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\mfeapfk" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\mfeavfk" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\mfeavfk01" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\mfehidk" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\mferkdet" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\mfevtp" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\mfewfpk" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\mfewfpk" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\MfeBOPK" /f >> %Logfile% 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\services\mfetdik" /f >> %Logfile% 2>&1

REM Delete HKCU\Software\McAfee for all users on the machine
FOR /F "tokens=2* delims=\" %%a IN ('REG QUERY HKU ^|Findstr /R "DEFAULT S-1-5-[0-9]*-[0-9-]*$"') DO CALL reg delete "HKU\%%a\Software\McAfee" /f >> %Logfile% 2>&1

timeout /t 2 /nobreak

REM Delete Drivers
devcon.exe remove @ROOT\LEGACY_MFEAVFK01\0000 /f >> %Logfile% 2>&1
devcon.exe remove @ROOT\LEGACY_MFEAVFK\0000 /f >> %Logfile% 2>&1
devcon.exe remove @ROOT\LEGACY_MFEHIDK\0000 /f >> %Logfile% 2>&1
devcon.exe remove @ROOT\LEGACY_MFEWFPK\0000 /f >> %Logfile% 2>&1

timeout /t 5