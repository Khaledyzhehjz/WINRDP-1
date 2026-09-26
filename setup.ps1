Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

Write-Host "Downloading Google Chrome..."
$Installer = "$env:TEMP\chrome_installer.exe"
Invoke-WebRequest "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $Installer
Start-Process -FilePath $Installer -ArgumentList "/silent", "/install" -Wait
Remove-Item $Installer

Write-Host "Downloading Chrome Remote Desktop..."
$CrdInstaller = "$env:TEMP\remotedesktop.msi"
Invoke-WebRequest "https://dl.google.com/edgedl/chrome-remote-desktop/chrome-remote-desktop-stable_current_x64.msi" -OutFile $CrdInstaller
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$CrdInstaller`" /qn /norestart" -Wait
Remove-Item $CrdInstaller

Write-Host "Setup completed successfully!"

