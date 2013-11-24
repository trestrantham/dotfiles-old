#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*}/include.sh

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
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  install_formula qt --HEAD
else
  e_arrow "Skipping QuickTime"
fi

e_header "Cleaning up"
brew cleanup
