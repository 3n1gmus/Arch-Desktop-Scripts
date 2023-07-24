#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Variables for your Wi-Fi network
WIFI_SSID="YOUR_WIFI_SSID"

# Stop and disable the netctl profile
netctl stop "$WIFI_SSID"
netctl disable "$WIFI_SSID"

# Remove the netctl profile
rm -f "/etc/netctl/$WIFI_SSID"

# Display a message indicating successful uninstallation
echo "Uninstallation completed. The Wi-Fi profile for '$WIFI_SSID' has been removed."