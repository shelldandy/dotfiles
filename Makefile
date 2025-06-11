# Dotfiles Management Makefile
# Manages syncing dotfiles with home directory using rcm

DOTFILES_DIR := $(shell pwd)
HOME_DIR := $(HOME)

.PHONY: help sync clean install force-sync list-symlinks orphaned dry-run

help: ## Show this help message
	@echo "Dotfiles Management Commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

sync: ## Sync dotfiles to home directory (safe, won't overwrite)
	@echo "Syncing dotfiles to home directory..."
	rcup -d $(DOTFILES_DIR) -v

force-sync: ## Force sync dotfiles, overwriting existing files
	@echo "Force syncing dotfiles (will overwrite existing files)..."
	rcup -d $(DOTFILES_DIR) -f -v

dry-run: ## Show what would be synced without making changes
	@echo "Dry run - showing what would be synced:"
	lsrc -d $(DOTFILES_DIR)

clean: ## Remove broken symlinks and orphaned dotfiles
	@echo "Cleaning broken symlinks and orphaned dotfiles..."
	@echo "Checking for broken symlinks in home directory..."
	@find $(HOME_DIR) -maxdepth 1 -name ".*" -type l ! -exec test -e {} \; -print | while read link; do \
		if [ -L "$$link" ] && [[ "$$(readlink "$$link")" == *"$(notdir $(DOTFILES_DIR))"* ]]; then \
			echo "Removing broken symlink: $$link"; \
			rm "$$link"; \
		fi; \
	done
	@echo "Checking for orphaned config directory symlinks (including subdirectories)..."
	@if [ -d "$(HOME_DIR)/.config" ]; then \
		find $(HOME_DIR)/.config -type l ! -exec test -e {} \; -print | while read link; do \
			if [[ "$$(readlink "$$link")" == *"$(notdir $(DOTFILES_DIR))"* ]]; then \
				echo "Removing broken config symlink: $$link"; \
				rm "$$link"; \
			fi; \
		done; \
	fi

list-symlinks: ## List all dotfile symlinks in home directory
	@echo "Dotfile symlinks in home directory:"
	@find $(HOME_DIR) -maxdepth 1 -name ".*" -type l -exec ls -la {} \; | grep "$(notdir $(DOTFILES_DIR))" || echo "No dotfile symlinks found"
	@echo ""
	@echo "Config directory symlinks:"
	@if [ -d "$(HOME_DIR)/.config" ]; then \
		find $(HOME_DIR)/.config -maxdepth 1 -type l -exec ls -la {} \; | grep "$(notdir $(DOTFILES_DIR))" || echo "No config symlinks found"; \
	else \
		echo "No .config directory found"; \
	fi

orphaned: ## Find orphaned symlinks (broken links to dotfiles)
	@echo "Finding orphaned dotfile symlinks..."
	@find $(HOME_DIR) -maxdepth 1 -name ".*" -type l ! -exec test -e {} \; -print | while read link; do \
		if [[ "$$(readlink "$$link")" == *"$(notdir $(DOTFILES_DIR))"* ]]; then \
			echo "Orphaned symlink: $$link -> $$(readlink "$$link")"; \
		fi; \
	done
	@if [ -d "$(HOME_DIR)/.config" ]; then \
		find $(HOME_DIR)/.config -maxdepth 1 -type l ! -exec test -e {} \; -print | while read link; do \
			if [[ "$$(readlink "$$link")" == *"$(notdir $(DOTFILES_DIR))"* ]]; then \
				echo "Orphaned config symlink: $$link -> $$(readlink "$$link")"; \
			fi; \
		done; \
	fi

install: ## Full dotfiles installation (runs install script)
	@echo "Running full dotfiles installation..."
	@if [ -f "$(DOTFILES_DIR)/scripts/install.sh" ]; then \
		chmod +x $(DOTFILES_DIR)/scripts/install.sh && $(DOTFILES_DIR)/scripts/install.sh; \
	else \
		echo "Install script not found at scripts/install.sh"; \
		exit 1; \
	fi

install-mas: ## Full installation including Mac App Store apps
	@echo "Running full installation with Mac App Store apps..."
	@if [ -f "$(DOTFILES_DIR)/scripts/install.sh" ]; then \
		chmod +x $(DOTFILES_DIR)/scripts/install.sh && $(DOTFILES_DIR)/scripts/install.sh --mas-install; \
	else \
		echo "Install script not found at scripts/install.sh"; \
		exit 1; \
	fi

# Default target
all: sync