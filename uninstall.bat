@echo off
REM "Uninstallation: https://kc.mcafee.com/corporate/index?page=content&id=KB54834"

echo The MIT License (MIT)
echo.
echo Copyright (c) 2015 agowa338
echo.
echo Permission is hereby granted, free of charge, to any person obtaining a copy
echo of this software and associated documentation files (the "Software"), to deal
echo in the Software without restriction, including without limitation the rights
echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
echo copies of the Software, and to permit persons to whom the Software is
echo furnished to do so, subject to the following conditions:
echo.
echo The above copyright notice and this permission notice shall be included in
echo all copies or substantial portions of the Software.
echo.
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
echo THE SOFTWARE.


set Logfile="C:\McUninstall.log"
del %Logfile%

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

:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)
:64BIT
pushd %~dp0\x86
GOTO END
:32BIT
pushd %~dp0\x64
GOTO END
:END
REM Delete Drivers
devcon.exe remove @ROOT\LEGACY_MFEAPFK\0000 /f >> %Logfile% 2>&1
devcon.exe remove @ROOT\LEGACY_MFEAVFK01\0000 /f >> %Logfile% 2>&1
devcon.exe remove @ROOT\LEGACY_MFEAVFK\0000 /f >> %Logfile% 2>&1
devcon.exe remove @ROOT\LEGACY_MFEHIDK\0000 /f >> %Logfile% 2>&1
devcon.exe remove @ROOT\LEGACY_MFERKDET\0000 /f >> %Logfile% 2>&1
devcon.exe remove @ROOT\LEGACY_MFETDIK\0000 /f >> %Logfile% 2>&1
devcon.exe remove @ROOT\LEGACY_MFEWFPK\0000 /f >> %Logfile% 2>&1
popd

timeout /t 5
