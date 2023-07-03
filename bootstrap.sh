#!/bin/bash


sudo apt install -y fd-find
cat ./addtorc >> "${HOME}/.zshrc"

git clone https://github.com/LazyVim/starter ~/.config/nvim
