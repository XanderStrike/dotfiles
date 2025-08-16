#!/usr/bin/env bash

# Hardcoded dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"

# Function to update dotfiles in background
# Function to update dotfiles silently in background
update_dotfiles() {
    # Redirect all output to /dev/null so we never see "Already up to date"
    (
        cd "$DOTFILES_DIR" || exit 1
        # --quiet suppresses progress/output from git commands
        git pull --quiet --rebase --stat=no 2>/dev/null
        git submodule update --init --recursive --quiet 2>/dev/null
    ) >/dev/null 2>&1
}

# Check that the dotfiles directory exists
if [ -d "$DOTFILES_DIR" ]; then
    # Source files if they exist
    for file in \
        "${DOTFILES_DIR}/aliases.sh" \
        "${DOTFILES_DIR}/shell-commands/ai-completion/ai-completion.sh" \
        "${DOTFILES_DIR}/shell-commands/br-bash/br.sh"; do
        [ -r "$file" ] && source "$file"
    done
    
    # Run update in background, suppressing the background PID/job message
    if [ "$SKIP_BACKGROUND_UPDATE" != "1" ]; then
        # Temporarily disable job-control messages so we don't see "[1] 12345"
        set +m 2>/dev/null
        update_dotfiles & disown
        set -m 2>/dev/null
    fi
else
    echo "Warning: Dotfiles directory '$DOTFILES_DIR' not found." >&2
fi