#!/bin/bash

# Check if yay is installed, and install it if not
if ! command -v yay &>/dev/null; then
  echo "Yay not found. Installing yay..."
  sudo pacman -Sy --noconfirm yay
fi

# Check if applist.txt exists
if [ ! -f "applist.txt" ]; then
  echo "Error: applist.txt not found!"
  exit 1
fi

# Read the list of applications from applist.txt and install them using yay
while read -r app; do
  echo "Installing $app..."
  yay -S --noconfirm "$app"
done < "applist.txt"
echo "All applications from applist.txt installed successfully."