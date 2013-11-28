#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*}/include.sh

read -p "Install ruby 1.9.3 with chruby? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  ruby-install ruby 1.9.3

  read -p "Set ruby 1.9.3 as default ruby? " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "chruby ruby-1.9.3" >> ~/.bash_profile
  fi
fi

echo

read -p "Install ruby 2.0.0 with chruby? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  ruby-install ruby 2.0.0

  read -p "Set ruby 2.0.0 as default ruby? " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "chruby ruby-2.0.0" >> ~/.bash_profile
  fi
fi
