#!/bin/bash

if [ ! -z "${SPIN}" ]; then
  sudo apt install -y ripgrep fd-find neovim
  cat ./addtorc >> "${HOME}/.zshrc"

  [ ! -f "${HOME}/.config/nvim" ] && sh -c "$(git clone https://github.com/luan/nvim ~/.config/nvim)"

  nvim +PlugInstall +qall
  nvim +UpdateRemotePlugins +qall
  nvim +GoInstallBinaries +qall
fi

