# Win10scrub
This script removes most of all Windows 10 default appx and Onedrive.
This will affect your logged in user and all users you create after the script is run.

Gets a list of the app packages (.appx) that are installed in your user profile:

Get-AppxPackage | sort Name | ft Name

To get information about app packages (.appx) in an image that are set to install for each new user:

Get-AppxProvisionedPackage -Online | sort DisplayName | ft DisplayName

You can export the startmenu from one user to other users on the system.
Fix it the way you want it, keep minimum 1 item.
Export-StartLayout –path c:\temp\start.bin -verbose

Log in and import it:
Import-StartLayout –LayoutPath c:\temp\start.bin –MountPath %systemdrive%
