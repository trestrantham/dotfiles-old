#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*}/include.sh

read -p "Install current version of Erlang? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  e_rocket "Installing Erlang $SYSTEM_ERLANG_VERSION"

  source $HOME/.asdf/asdf.sh
  asdf plugin-add erlang https://github.com/adsf-vm/asdf-erlang.git

  ERLANG_CONFIGURE_OPTIONS="--enable-darwin-64bit --with-ssl=/usr/local/opt/openssl"

  asdf install erlang $SYSTEM_ERLANG_VERSION
fi
