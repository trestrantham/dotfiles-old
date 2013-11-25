#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P )

# Pretty pictures
function e_header()  { echo -e "\n\033[1m$@\033[0m";      }
function e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()   { echo -e " \033[1;33m➜\033[0m  $@"; }
function e_rocket()   { echo -e "\033[1;34m==>\033[0m $@"; }

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `default` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

function install_gcc {
  # Ensure that we have gcc
  if [[ ! "$(type -P gcc)" ]]; then
    e_arrow "Couldn't find Xcode or Command Line Tools. Trying to install Command Line Tools now."

    # Install CLI Tools
    source $SCRIPT_PATH/config/install_cli_tools.sh

    if [[ $? != 0 ]]; then
      e_error "GCC did not install successfully. Try again."
    else
      e_success "GCC installed successfully."
      e_arrow "You must open Xcode to accept the license terms before continuing."
    fi
  else
    e_arrow "GCC is installed."
  fi
}

function install_dotfiles {
  # Symlink all our `.ln` files

  for f in `find ${SCRIPT_PATH%/*} -name '*.ln'`; do
echo $f
    filename=$(basename "$f")
    if [ -e "$HOME/.${filename%.ln}" ]
    then
echo 'removing'
      rm "$HOME/.${filename%.ln}"
    fi
echo $filename
    ln -s -f "$( greadlink -f "$f" )" "$HOME/.${filename%.ln}"
  done

  # Run vundler
  vim -u ~/.vim/bundles.vim +BundleInstall +qall
}

function install_homebrew {
  # Ensure that we have homebrew
  if [[ ! "$(type -P brew)" ]]; then
    e_arrow "Couldn't find Homebrew. Trying to install now."

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

    if [[ $? != 0 ]]; then
      e_error "Homebrew did not install successfully. Try again."
    else
      brew doctor
      e_success "Homebrew installed successfully."
    fi
  else
    e_arrow "Homebrew is installed."
  fi

  # If still no homebrew, die in a fire
  if [[ ! "$(type -P brew)" ]]; then
    e_error "Homebrew must be installed before continuing."
    exit 1
  fi
}

function install_formulas {
  source $SCRIPT_PATH/homebrew/brew.sh
}

function install_casks {
  source $SCRIPT_PATH/homebrew/cask.sh
}

function install_defaults {
  echo
  read -p "Install system defaults? " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    for f in `find $SCRIPT_PATH/osx/system -name '*.sh'`; do
      ./$f
    done
  else
    e_arrow "Skipping system defaults"
  fi

  echo
  read -p "Install defaults for Mac App Store applications? " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    for f in `find $SCRIPT_PATH/osx/mas_apps -name '*.sh'`; do
      ./$f
    done
  else
    e_arrow "Skipping Mac App Store applications"
  fi

  echo
  read -p "Install defaults for Cask applications? " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    for f in `find $SCRIPT_PATH/osx/cask_apps -name '*.sh'`; do
      ./$f
    done
  else
    e_arrow "Skipping Cask applications"
  fi
}

# Ruby gems
function install_gems() {
  source $SCRIPT_PATH/ruby/gems.sh
}

# Rubies
function install_rubies() {
  source $SCRIPT_PATH/ruby/rubies.sh
}

# Remote pair
function setup_remote_pair() {
  source $SCRIPT_PATH/osx/remote/pair.sh
}

# Brew formulas
function install_formula() {
  e_header "Installing ${@}"

  if [ -d "/usr/local/Cellar/$( basename ${@} )" ]; then
    e_arrow "${@} is installed."
  else
    brew install "${@}"

    if [[ $? != 0 ]]; then
      e_error "${@}"
    else
      e_success "${@}"
    fi
  fi
}

# Brew casks
function install_cask() {
  e_header "Installing ${@}"
  brew cask install --appdir="/Applications" --force "${@}"

  if [[ $? != 0 ]]; then
    e_error "${@}"
  else
    e_success "${@}"
  fi
}

# Ruby gems
function install_gem() {
  e_header "Installing ${@}"
  gem install "${@}"

  if [[ $? != 0 ]]; then
    e_error "${@}"
  else
    e_success "${@}"
  fi
}
