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

# Set environment variables to represent the current versions of each environment
while read line; do
  IFS=' ' read -a tool <<< $line
  tool_name=`echo "${tool[0]}" |  tr "[:lower:]" "[:upper:]"`
  tool_version=${tool[1]}
  export SYSTEM_${tool_name}_VERSION=${tool_version}
done < ${SCRIPT_PATH}/../tool-versions.ln

# Keep-alive: update existing `sudo` time stamp until `default` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

function install_dotfiles {
  e_rocket "Updating submodules"
  git submodule init
  git submodule update

  e_rocket "Configuring dotfiles"
  # Symlink all our `.ln` files
  for f in `find ${SCRIPT_PATH%/*} -name '*.ln'`; do
    filename=$(basename "$f")

    if [ -e "$HOME/.${filename%.ln}" ]
    then
      rm "$HOME/.${filename%.ln}"
    fi

    ln -s -f "$( greadlink -f "$f" )" "$HOME/.${filename%.ln}"
  done

  # Install Plugs
  vim -u ~/.vim/plugs.vim +PlugInstall +qall
}

function install_homebrew {
  # Ensure that we have homebrew
  if [[ ! "$(type -P brew)" ]]; then
    e_arrow "Couldn't find Homebrew. Trying to install now."

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    if [[ $? != 0 ]]; then
      e_error "Homebrew did not install successfully. Try again."
    else
      brew doctor
      e_success "Homebrew installed successfully."
    fi
  else
    e_arrow "Homebrew is installed."
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
      $f
    done
  fi

  echo
  read -p "Install defaults for Mac App Store applications? " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    for f in `find $SCRIPT_PATH/osx/mas_apps -name '*.sh'`; do
      $f
    done
  fi

  echo
  read -p "Install defaults for Cask applications? " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    for f in `find $SCRIPT_PATH/osx/cask_apps -name '*.sh'`; do
      $f
    done
  fi
}

# ASDF Version Manager
function install_asdf() {
  source $SCRIPT_PATH/environments/asdf.sh
}

# Rubies
function install_rubies() {
  source $SCRIPT_PATH/environments/rubies.sh
}

# Erlangs
function install_erlangs() {
  source $SCRIPT_PATH/environments/erlangs.sh
}

# Elixirs
function install_elixirs() {
  source $SCRIPT_PATH/environments/elixirs.sh
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
