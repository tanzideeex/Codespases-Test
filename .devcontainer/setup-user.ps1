# --- (Version 2) Script to install GUI, configure RDP, and create a user ---

Write-Host "Starting RDP setup process... Waiting 15 seconds for network to fully initialize."
Start-Sleep -s 15

# 1. Install the Windows Desktop Experience to get a GUI
Write-Host "Installing Windows Desktop Experience feature. This will take several minutes..."
Install-WindowsFeature -Name Server-Gui-Shell, Desktop-Experience -Restart -ErrorAction Stop

# This part of the script will only run if the above command doesn't trigger a reboot immediately.
Write-Host "A reboot is required and has been initiated. Setup will continue after the Codespace restarts."
