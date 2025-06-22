# --- Script to install GUI, configure RDP, and create a user ---
Write-Host "Starting RDP setup process..."
# 1. Install the Windows Desktop Experience to get a GUI
Write-Host "Installing Windows Desktop Experience feature. This will take several minutes..."
Install-WindowsFeature -Name Server-Gui-Shell, Desktop-Experience -Restart
# NOTE: The '-Restart' flag means the Codespace will automatically reboot here.
# The script will stop and the Codespace will continue setting up after the reboot.
# We add a second script to handle the post-reboot configuration.
Write-Host "A reboot is required and has been initiated. Setup will continue after the Codespace restarts."
