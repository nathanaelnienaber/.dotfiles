#!/bin/bash
# System-level tweaks for Ubuntu GNOME

echo "→ Restoring cpufrequtils..."
sudo cp cpufrequtils /etc/default/cpufrequtils
sudo systemctl enable cpufrequtils

echo "→ Restoring GRUB config..."
sudo cp grub /etc/default/grub
sudo update-grub

echo "→ Disabling NetworkManager wait-online..."
sudo systemctl disable NetworkManager-wait-online.service

echo "→ Restoring custom keyboard shortcuts..."
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < keyboard-shortcuts.conf

echo "✓ System config applied. Reboot recommended."
