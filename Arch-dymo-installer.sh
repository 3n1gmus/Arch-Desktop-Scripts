#!/bin/bash

# From: https://github.com/computerlyrik/dymoprint
sudo pacman -S python-pipx
pipx install dymoprint
echo 'ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="0922", ATTRS{idProduct}=="1001", MODE="0666"' | sudo tee /etc/udev/rules.d/91-dymo-1001.rules