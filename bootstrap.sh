#!/bin/bash

if [ ! -z "${SPIN}" ]; then
  sudo apt install -y ripgrep fd-find
  
  cat ./addtorc >> "${HOME}/.zshrc"
fi

