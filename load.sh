#!/usr/bin/env bash

# Hardcoded dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"

# Check that the dotfiles directory exists
if [ -d "$DOTFILES_DIR" ]; then
    # Source files
    source "${DOTFILES_DIR}/aliases.sh"
    source "${DOTFILES_DIR}/shell-commands/ai-completion/ai-completion.sh"
    source "${DOTFILES_DIR}/shell-commands/br-bash/br.sh"
else
    echo "Warning: Dotfiles directory '$DOTFILES_DIR' not found." >&2
fi