#!/bin/bash

if [ ! -z "${SPIN}" ]; then
  # spin packages that need to be installed
  declare -a SPIN_PACKAGES=(
    ripgrep
    fd-find
    neovim
  )

  [ ${#SPIN_PACKAGES[@]} -gt 0 ] && \
    sudo apt-get install -qq -y --no-install-recommends ${SPIN_PACKAGES}

  [ ! -f "${HOME}/.config/nvim" ] && sh -c "$(git clone https://github.com/luan/nvim ~/.config/nvim)"
fi

