#!/usr/bin/env bash

if hash nvim 2>/dev/null; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  nvim --headless +"PlugInstall" +qa
else
  echo "NVIM Executable Not Found"
  exit 0
fi
