This is only if the http://us.mcafee.com/apps/supporttools/mcpr/mcpr.asp (Consumer Products only) or http://vs.mcafeeasap.com/sw/VS60/Data/MVSUninst.exe (McAfee Security-as-a-Service, endpoint solution in enterprise environments) doesn't work for you, like it did for me in some cases.

If you use this, the following will happen: 
 - Internet Explorer Developer Tools are broken
 - Some APIs are broken
 - VBS scripts are broken
 - Services in the Computer Management are not showable from the local PC only remote
 + You're able to reinstall McAfee to fix the Problems above and go the intended way of removal


1. Download devcon from Microsoft and place in same directory as this script.
2. Run the script as Administrator, you may deploy it via GPO if wanted or place on a shared folder and run via psexec
3. Reinstall McAfee
4. Use MCPR or MVSUninst to remove McAfee without breaking your Windows


Note:
DON'T USE THIS FOR BLACK HAT PURPOSES (ILLEGAL HACKING)
This script kills McAfee and would allow running malicious code, without the Administrator knowing about from the dashboard (if you skip step 3-4) but you're may break essential software.
After a view days the dashboard shows an out of date message (because the client hasn't contacted the server), but not the correct McAfee has been removed one.
So keep that in mind if you use it for your awareness building operations or fixing your broken McAfee uninstaller
