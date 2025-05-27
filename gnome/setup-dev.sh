#!/bin/bash
# Dev environment setup for Ubuntu GNOME

set -e

echo "→ Updating package index..."
sudo apt update

# Core development utilities
# WHAT: Essential command-line tools
# WHY: Required for almost all dev work (git repos, compiling software, etc.)
sudo apt install -y \
  git \          # Version control (tracking code changes)
  curl \         # Fetch files from URLs (install scripts, APIs)
  htop \         # Visual resource monitor (CPU/RAM)
  tmux \         # Terminal multiplexer (manage sessions)
  build-essential \ # Compiler & dev tools
  software-properties-common # Manage software sources

# Brave Browser
# WHAT: Privacy-focused browser built on Chromium
# WHY: Fast, secure, blocks trackers
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave.com/signing-key.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave.com/linux/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# Signal
# WHAT: Secure messaging app
# WHY: Use it instead of iMessage with family
echo "→ Installing Signal..."
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt stable main" | sudo tee /etc/apt/sources.list.d/signal.list
sudo apt update
sudo apt install -y signal-desktop


# AppFlowy
# WHAT: Note taking app.
# WHY: Alternative to Notion that can be self-hosted. 
echo "→ Installing Signal..."
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt stable main" | sudo tee /etc/apt/sources.list.d/signal.list
sudo apt update
sudo apt install -y signal-desktop


# VS Code
# WHAT: Powerful, widely-used code editor
# WHY: Strong ecosystem, extensions, and support for JS/TS
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

# Node.js (LTS)
# WHAT: JavaScript runtime
# WHY: Essential for modern JS/TS dev (front & backend)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# JS/TS tools (Prettier, ESLint, Biome, Vite)
# WHAT: Code formatter, linter, formatter/compiler (Biome), and frontend bundler (Vite)
# WHY: Clean, consistent, and fast JS/TS projects
sudo npm install -g prettier eslint @biomejs/biome vite

# Shell utilities (zsh, fzf, ripgrep, bat, fd)
# WHAT: Better shell and improved command-line tools
# WHY: Increased terminal productivity and navigation efficiency
sudo apt install -y zsh fzf ripgrep bat fd-find

# # tmux plugin manager (TPM)
# # WHAT: Manage tmux plugins
# # WHY: Adds power-user tmux functionality
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Set Zsh as default shell
# WHAT: Improved shell experience
# WHY: Better plugins, autocomplete, customization
chsh -s $(which zsh)

# # GitHub CLI
# # WHAT: GitHub integration from the command line
# # WHY: Manage repos, PRs, and more directly in the terminal
# type -p curl >/dev/null || sudo apt install curl -y
# curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
# sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
# echo "deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
# sudo apt update
# sudo apt install -y gh

# GPG & SSH tools
# WHAT: Secure key management tools
# WHY: Manage secure keys for Git and other services
sudo apt install -y gnupg keychain

# Global Git config
# WHAT: Basic Git setup for commits
# WHY: Ensures commits are correctly attributed
git config --global user.name "nathanaelnienaber"
git config --global user.email "nn@tmrw.it"
git config --global init.defaultBranch main


# Docker
# WHAT: Containerization tool
# WHY: Manage environments cleanly and reproducibly
sudo apt install -y docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

# Neovim
# WHAT: Modern Vim alternative
# WHY: Fast, customizable terminal-based editor
sudo apt install -y neovim

# # Rust
# # WHAT: Modern systems programming language
# # WHY: Needed for compiling tools (like Alacritty)
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Alacritty
# WHAT: GPU-accelerated terminal emulator
# WHY: Fast, efficient terminal
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 cargo
cargo install alacritty

# Optional setups:
# - Gitea (self-hosted Git service)
# - Fonts (JetBrains Mono, Fira Code, etc.)

# Final note:
echo "✓ Dev setup complete. Logout or reboot recommended to apply all settings."
