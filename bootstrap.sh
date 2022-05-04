#!/bin/bash


if ! command -v rg &> /dev/null; then
  sudo apt install -y fd-find
fi

if ! command -v rg &> /dev/null; then
  sudo apt-get install -y ripgrep
fi

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

cat ./addtorc >> "${HOME}/.zshrc"


