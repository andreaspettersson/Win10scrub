# Uninstall from current user and unregister for installation on new users.
# Remove item in AppList if you want to keep some apps.
# Run script in elevated mode (run as administrator)
# You must set executionpolicy to remotesigned: set-executionpolicy remotesigned
# Also removes Onedrive
# Se more: https://www.pdq.com/blog/removing-windows-10-apps-with-powershell/

$AppList = @(
    "*3DBuilder*"
    "*BingWeather*"
    "*DesktopAppInstaller*"
    "*GetHelp*"
    "*Getstarted*"
    "*Messaging*"
    "*Microsoft3DViewer*"
    "*MicrosoftOfficeHub*"
    "*MicrosoftSolitaireCollection*"
    "*MicrosoftStickyNotes*"
    "*MSPaint*"
    "*Office.OneNote*"
    "*OneConnect*"
    "*People*"
    "*Print3D*"
    "*SkypeApp*"
    "*Wallet*"
    "*Windows.Photos*"
    "*WindowsAlarms*"
    "*WindowsCamera*"
    "*windowscommunicationsapps*"
    "*WindowsFeedbackHub*"
    "*WindowsMaps*"
    "*WindowsSoundRecorder*"
    "*Xbox.TCUI*"
    "*XboxApp*"
    "*XboxGameOverlay*"
    "*XboxIdentityProvider*"
    "*XboxSpeechToTextOverlay*"
    "*ZuneMusic*"
    "*ZuneVideo*"
    "*Advertising*"
    "*A278AB0D.MarchofEmpires*"
    "*89006A2E.AutodeskSketchBook*"
    "*Microsoft.BingNews*"
    "*A278AB0D.DisneyMagicKingdoms*"
    "*WinZipComputing.WinZipUniversal*"
    "*king.com.BubbleWitch3Saga*"
    "*king.com.CandyCrushSodaSaga*"
    "*SpotifyAB.SpotifyMusic*"
)
ForEach($app in $AppList){
    Get-AppxPackage -Name $App | Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | where {$_.PackageName -like $app} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}

taskkill /f /im OneDrive.exe
C:\Windows\SysWOW64\OneDriveSetup.exe /uninstall
