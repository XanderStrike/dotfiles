#!/bin/bash

if [ ! -z "${SPIN}" ]; then
  sudo apt-get install -y ripgrep fd-find neovim

  [ ! -f "${HOME}/.config/nvim" ] && sh -c "$(git clone https://github.com/luan/nvim ~/.config/nvim)"
fi

