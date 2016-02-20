#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*}/include.sh

read -p "Install current version of Ruby?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  e_rocket "Installing Ruby $SYSTEM_RUBY_VERSION"

  source $HOME/.asdf/asdf.sh
  asdf plugin-add ruby https://github.com/HashNuke/asdf-ruby.git

  asdf install ruby $SYSTEM_RUBY_VERSION
fi
