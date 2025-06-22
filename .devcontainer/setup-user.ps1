# --- Script to run after reboot to set up user and RDP ---
Write-Host "Post-reboot configuration starting..."
# 2. Enable Remote Desktop and Firewall Rule
Write-Host "Enabling Remote Desktop and configuring firewall..."
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
# 3. Create a user and set password
# --- IMPORTANT: CHANGE THIS PASSWORD TO SOMETHING SECURE AND MEMORABLE ---
$Password = "Codespace!1234"
# ---
Write-Host "Creating user 'devuser'..."
$SecurePassword = ConvertTo-SecureString -String $Password -AsPlainText -Force
New-LocalUser "devuser" -Password $SecurePassword -FullName "Developer User"
# Add the user to the Administrators and Remote Desktop Users groups
Write-Host "Adding user to Administrator and Remote Desktop groups..."
Add-LocalGroupMember -Group "Administrators" -Member "devuser"
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "devuser"
# 4. Final instructions
Write-Host ""
Write-Host "--------------------------------------------------------"
Write-Host "  RDP Configuration Complete!"
Write-Host "  "
Write-Host "  Open the 'PORTS' tab in VS Code."
Write-Host "  Find the address for port 3389."
Write-Host "  "
Write-Host "  Use the following details to connect with your RDP client:"
Write-Host "    Computer: [The Address from the PORTS tab]"
Write-Host "    Username: devuser"
Write-Host "    Password: ${Password}"
Write-Host "--------------------------------------------------------"
Write-Host ""
# Keep the terminal alive so the port forwarding stays active.
Write-Host "This session is now active. Close this Codespace to terminate."
Start-Sleep -Seconds 3600
