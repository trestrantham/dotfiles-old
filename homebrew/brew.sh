#!/usr/bin/env bash

# Pretty pictures
function e_header()  { echo -e "\n\033[1m$@\033[0m";      }
function e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()   { echo -e " \033[1;33m➜\033[0m  $@"; }

function install_formula() {
  e_header "Installing ${@}"
  brew install "${@}"

  if [[ $? != 0 ]]; then
    e_error "${@}"
  else
    e_success "${@}"
  fi
}

e_header "Setting up Homebrew Formulas"
brew update 2>/dev/null
brew upgrade 2>/dev/null
brew tap homebrew/dupes 2>/dev/null

# Development
install_formula git
install_formula mysql
install_formula postgresql
install_formula reattach-to-user-namespace
install_formula redis
install_formula the_silver_searcher
install_formula tmux

# Ruby
install_formula chruby
install_formula ruby-install

# Shell
install_formula ack
install_formula bash-completion
install_formula coreutils
e_arrow "Don't forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
install_formula findutils
install_formula homebrew/dupes/grep
install_formula homebrew/dupes/screen

# QuickTime
echo
echo "About to install QuickTime. This will take a LONG time."
read -p "Are you sure you want to do this now? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  install_formula qt --HEAD
else
  e_arrow "Skipping QuickTime"
fi

e_header "Cleaning up"
brew cleanup
