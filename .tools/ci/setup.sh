#!/usr/bin/env bash
set -e

sudo apt -y -qq install zsh git curl
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
touch ~/.zshrc
make install

# now we populate .zshrc to avoid the first-time setup script
cat > ~/.zshrc <<- EOM
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="seppuku"

plugins=(
  git
)

source $HOME/.oh-my-zsh/oh-my-zsh.sh
EOM
