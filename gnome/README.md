Here’s your updated `README.md` for `~/.dotfiles/gnome/`:

---

````markdown
# GNOME System Tweaks (Ubuntu)

System-level tweaks for speeding up boot, boosting performance, and restoring GNOME shortcuts on Ubuntu.

## What's Included

- `setup-system.sh`: One-click restore script for all tweaks
- `cpufrequtils`: CPU governor config (set to `performance`)
- `grub`: GRUB config with splash screen removed
- `systemd-disabled.txt`: Notes disabled services (like NetworkManager-wait-online)
- `keyboard-shortcuts.conf`: GNOME keyboard shortcuts backup (via dconf)


## How to Use

Run this after a fresh Ubuntu GNOME install:

```bash
~/.dotfiles/gnome/setup-system.sh
````

What it does:

* Installs `cpufrequtils` if needed
* Enables `performance` CPU mode (faster responsiveness)
* Removes boot splash (faster boot + logs visible)
* Disables network wait delay at boot
* Restores your GNOME keyboard shortcuts via `dconf`

## Dependencies

This script assumes:

* Ubuntu GNOME desktop
* Internet connection for package install
* Run from a terminal with `sudo` privileges

No manual installs required—everything is automated.

