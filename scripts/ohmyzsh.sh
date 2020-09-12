#!/usr/bin/env bash

if hash zsh 2>/dev/null; then
  if [[ -d ~/.oh-my-zsh ]]; then
      echo "Oh My ZSH Already Installed"
      exit 0
  else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended
  fi
else
  echo "ZSH Not Found. Exiting Oh My ZSH Install"
  exit 0
fi
