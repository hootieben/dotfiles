#!/usr/bin/env bash

. lib/helpers.sh

nvim_install()
{
  if does_exist "nvim"
  then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim --headless +"PlugInstall" +qa
  else
    echo "NVIM Not Found. Skipping ..."
    exit 0
  fi
}

omzsh_install()
{
  does_exist "zsh" || exit 1
  if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended
  else
    echo "Oh My ZSH Already Installed. Skipping ..."
    return 0
  fi
}

run_main()
{
  nvim_install || exit 1
  omzsh_install || exit 1
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
  # run_main
  # if [ $? -gt 0 ]
  if ! run_main
  then
    exit 1
  fi
fi
