#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*}/include.sh

read -p "Install current version of Node? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  e_rocket "Installing Node JS $SYSTEM_NODEJS_VERSION"

  source $HOME/.asdf/asdf.sh
  asdf plugin-add nodejs git@github.com:asdf-vm/asdf-nodejs.git

  asdf install ruby $SYSTEM_NODEJS_VERSION
fi
