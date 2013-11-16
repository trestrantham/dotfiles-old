#!/usr/bin/env bash

echo "Bootstrapping..."

# Pretty pictures
function e_header()  { echo -e "\n\033[1m$@\033[0m";      }
function e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()   { echo -e " \033[1;33m➜\033[0m  $@"; }

# Ensure that we have gcc
if [[ ! "$(type -P gcc)" ]]; then
  e_error "XCode or the Command Line Tools for XCode must be installed first."
  exit 1
fi

# Ensure that we have homebrew
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

# If still no homebrew, die in a fire
if [[ ! "$(type -P brew)" ]]; then
  e_error "Homebrew must be installed first."
  exit 1
fi

# If Git isn't installed, try installing via homebrew
if [[ ! "$(type -P git)" ]]; then
  e_header "Installing Git"
  brew install git
fi

# If Git isn't installed by now, die horribly
if [[ ! "$(type -P git)" ]]; then
  e_error "Git should be installed. It isn't. Aborting."
  exit 1
fi











# exit 1

for f in `find $( dirname "$BASH_SOURCE[0]" ) -name '*.ln'`; do
  filename=$(basename "$f")
  if [ -e "$HOME/.${filename%.ln}" ]
  then
    rm "$HOME/.${filename%.ln}"
  fi

  ln -s "$( greadlink -f "$f" )" "$HOME/.${filename%.ln}"
done

vim -u ~/.vim/bundles.vim +BundleInstall +qall
