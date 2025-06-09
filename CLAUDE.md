# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS development environment setup. The configuration supports both zsh and fish shells, with Neovim as the primary editor using LazyVim configuration.

## Architecture

### Shell Configuration
- **Primary shells**: zsh (zshrc) and fish (config/fish/config.fish)
- **Prompt**: Starship prompt configuration (config/starship.toml)
- **Window management**: yabai + skhd for tiling window management

### Editor Setup
- **Neovim**: LazyVim-based configuration at config/nvim/
- **Terminal**: Supports Alacritty and Kitty terminals with multiple color schemes

### Installation System
- **Main installer**: scripts/install.sh - orchestrates the entire setup
- **Package managers**: Homebrew (brew.sh), npm (npm.sh), yarn (yarn.sh), pip (pip.sh)
- **Dotfile management**: Uses `rcup` command for symlinking dotfiles

## Common Commands

### Installation
```bash
# Full installation from scratch
chmod +x scripts/install.sh
./scripts/install.sh

# Include Mac App Store apps (requires prior purchase)
./scripts/install.sh --mas-install

# Sync dotfiles after installation
rcup -d dotfiles -v
```

### Development Aliases (from zshrc)
- `v` or `vim` - Open Neovim
- `df` - Navigate to dotfiles directory
- `gf` - Navigate to git directory
- `gs` - Git status
- `gaa` - Git add all
- `dc` - Docker compose
- `ll` - Enhanced ls with eza
- `rst` - Restart zsh shell

### Package Management
- Node.js: Uses nvm for version management
- Python: pipx for isolated package installation
- Ruby: Homebrew-managed Ruby installation

## Key Configuration Files

- **Shell**: zshrc, config/fish/config.fish
- **Terminal**: config/alacritty/alacritty.yml, config/kitty/kitty.conf
- **Editor**: config/nvim/ (LazyVim configuration)
- **Git**: gitconfig, gitignore_global
- **Window Management**: config/yabai/yabairc, config/skhd/skhdrc

## Environment Variables

Both shells set:
- `EDITOR=nvim`
- `TERM=xterm-256color` 
- Homebrew configuration for cask installations
- PATH modifications for local binaries and development tools