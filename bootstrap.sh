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

# Install all our Homebrew formulas
for f in `find $( dirname "$BASH_SOURCE[0]" ) -name 'brew.sh'`; do
  ./$f
done

# Install all our Homebrew casks
for f in `find $( dirname "$BASH_SOURCE[0]" ) -name 'cask.sh'`; do
  ./$f
done

# Set our system defaults
e_header "Setting OS X defaults"
for f in `find $( dirname "$BASH_SOURCE[0]" )/osx -name '*.sh'`; do
  ./$f
done

# Symlink all our `.ln` files
for f in `find $( dirname "$BASH_SOURCE[0]" ) -name '*.ln'`; do
  filename=$(basename "$f")
  if [ -e "$HOME/.${filename%.ln}" ]
  then
    rm "$HOME/.${filename%.ln}"
  fi

  ln -s -f "$( greadlink -f "$f" )" "$HOME/.${filename%.ln}"
done

# Run vundler
vim -u ~/.vim/bundles.vim +BundleInstall +qall

e_success "Done. Time to restart."
