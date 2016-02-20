#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*}/include.sh

# Install ASDF to manage version for various runtimes

read -p "Install ASDF? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ -e "$HOME/.asdf" ]; then
    e_rocket "Updating ASDF"
    cd $HOME/.asdf
    git pull
  else
    e_rocket "Installing ASDF"
    git clone https://github.com/HashNuke/asdf.git $HOME/.asdf
  fi

  source $HOME/.asdf/asdf.sh

  if [ -e "$HOME/.asdf/plugins" ]; then
    e_rocket "Updating ASDF plugins"
    asdf plugin-update --all
  fi
fi
