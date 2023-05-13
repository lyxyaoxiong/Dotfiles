#!/usr/bin/env bash

# install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
# sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

<<<<<<< HEAD
# install pyenv and latest Python version
curl https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(pyenv init --path)"' >> ~/.zprofile

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init --path)"' >> ~/.profile

echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

. ~/.zshrc


# pyenv install $(pyenv install -l | awk '{$1=$1;print}' | grep -P '^\d+\.\d+\.\d+$' | tail -1)
PYTHON_VERSION=3.8
PYTHON_VERSION=$(pyenv install -l | grep -P "^\s+$PYTHON_VERSION\.\d+$" | tail -1 | awk '{$1=$1; print;}')

yes | pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

pip install dotfiles
dotfiles -s

if [[ $OSTYPE == 'darwin'* ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/yx/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  brew install pyenv
  echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
  echo 'eval "$(pyenv init -)"' >> ~/.zshrc
  brew install openssl readline sqlite3 xz zlib

  python_version=3.10.0
  pyenv install $python_version
  pyenv global $python_version
  pip install dotfiles
  hash -r

  brew install rbenv
fi

# .vimrc (https://github.com/amix/vimrc)
