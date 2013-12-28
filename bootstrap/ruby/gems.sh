#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*}/include.sh

install_gem bundler
install_gem foreman
install_gem github-auth
install_gem powder
