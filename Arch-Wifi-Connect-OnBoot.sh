#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Install netctl (if not already installed)
pacman -S --noconfirm netctl

# Variables for your Wi-Fi network
WIFI_SSID="YOUR_WIFI_SSID"
WIFI_PASSPHRASE="YOUR_WIFI_PASSPHRASE"

# Create a netctl profile for the Wi-Fi network
cat > "/etc/netctl/$WIFI_SSID" <<EOF
Description='Your Wi-Fi Network'
Interface=wlan0
Connection=wireless
Security=wpa
ESSID='$WIFI_SSID'
IP=dhcp
Key='$WIFI_PASSPHRASE'
EOF

# Set proper permissions for the profile
chmod 600 "/etc/netctl/$WIFI_SSID"

# Enable the netctl profile to start at boot
netctl enable "$WIFI_SSID"

# Start the netctl profile immediately
netctl start "$WIFI_SSID"
