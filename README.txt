This is only if the http://us.mcafee.com/apps/supporttools/mcpr/mcpr.asp (Consumer Products only) or http://vs.mcafeeasap.com/sw/VS60/Data/MVSUninst.exe (McAfee Security-as-a-Service, endpoint solution in enterprise environments) doesn't work for you, like it did for me in some cases.

If you use this, the following will happen: 
 - Internet Explorer Developer Tools are broken
 - Some APIs are broken
 - VBS scripts are broken
 - Services in the Computer Management are not showable from the local PC only remote
 + You're able to reinstall McAfee to fix the Problems above and go the intended way of removal


1. Download devcon from Microsoft and place in same directory as this script ( http://social.technet.microsoft.com/wiki/contents/articles/182.how-to-obtain-the-current-version-of-device-console-utility-devcon-exe.aspx ). Pay attention IA64 is not for x64, you need the AMD64 version.
2. Put devcon for x64 into x64 subfolder and the x86 version into a x86 subfolder
3. Run the script as Administrator, you may deploy it via GPO if wanted or place on a shared folder and run via psexec
4. Reinstall McAfee
5. Use MCPR or MVSUninst to remove McAfee without breaking your Windows


Note:
DON'T USE THIS FOR BLACK HAT PURPOSES (ILLEGAL HACKING)
This script kills McAfee and would allow running malicious code, without the Administrator knowing about from the dashboard (if you skip step 3-4) but you're may break essential software.
After a view days the dashboard shows an out of date message (because the client hasn't contacted the server), but not the correct McAfee has been removed one.
So keep that in mind if you use it for your awareness building operations or fixing your broken McAfee uninstaller



For Enterpise Security (Server):
If the normal uninstall doesn't work, you can do the following:
1. Remove the MSI Installation Point using Windows Installer CleanUp Utility from http://www.majorgeeks.com/files/details/windows_installer_cleanup_utility.html
2. Delete the folder C:\Program Files\McAfee
3. Delete the folder C:\Program Files (x86)\McAfee
4. Stop and delete all services related to mcafee
5. Delete all non plug and play drivers related to mcafee
6. Reinstall McAfee using the original setup files or http://www.mcafee.com/us/downloads/downloads.aspx
7. Perform a normal uninstall.
8. Delete the remaining services, drivers and folders.
