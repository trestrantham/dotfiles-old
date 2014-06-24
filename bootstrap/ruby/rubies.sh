#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*}/include.sh

read -p "Install ruby 1.9.3? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then ruby-install ruby 1.9.3; fi

echo

read -p "Install ruby 2.1.2? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then ruby-install ruby 2.1.2; fi
