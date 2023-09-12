#!/bin/bash

# Check if the Chaotic-AUR repository is already enabled
if grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
  echo "Chaotic-AUR repository is already enabled."
  exit 0
fi

# Add Chaotic-AUR repository to pacman.conf
echo "Adding Chaotic-AUR repository to pacman.conf..."
echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf

# Download the Chaotic-AUR mirror list
echo "Downloading Chaotic-AUR mirror list..."
sudo curl -o /etc/pacman.d/chaotic-mirrorlist https://cdn.chaotic.cx/mirrorlist

# Synchronize package databases and update system
echo "Synchronizing package databases..."
sudo pacman -Sy

echo "Chaotic-AUR repository is now enabled."
