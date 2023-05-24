#!/usr/bin/env bash

# install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
# sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# TODO: make it generic to install on other OS
if [[ $OSTYPE == 'darwin'* ]]; then
  # install homebrew: https://brew.sh/
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # install pyenv: https://github.com/pyenv/pyenv#homebrew-in-macos
  brew install pyenv
  # If you wish to get Pyenv in noninteractive login shells as well, also add the commands to ~/.zprofile or ~/.zlogin.
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(pyenv init -)"' >> ~/.zshrc

  # Install Python build dependencies
  brew install openssl readline sqlite3 xz zlib tcl-tk

  # Get the latest stable python version: https://www.python.org/downloads/macos/
  pyenv install $(pyenv latest -k 3)
  pyenv global $(pyenv latest -k 3)
  
  . ~/.zshrc
  
  pip3 install dotfiles
  
  cd ~; git clone --recurse-submodules https://github.com/lyxyaoxiong/Dotfiles.git
  dotfiles -s
  
  echo 'source ~/.zshrc_common' >> ~/.zshrc
  
  hash -r

  brew install rbenv
fi

. ~/.zshrc

pip install dotfiles
dotfiles -s

# .vimrc (https://github.com/amix/vimrc)
