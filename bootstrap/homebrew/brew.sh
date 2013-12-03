#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*}/include.sh

e_header "Setting up Homebrew Formulas"
brew update 2>/dev/null
brew upgrade 2>/dev/null
brew tap homebrew/dupes 2>/dev/null
brew tap jingweno/gh 2>/dev/null

# Development
install_formula ack
install_formula bash-completion
install_formula chruby
install_formula coreutils
install_formula findutils
install_formula gh
install_formula git
install_formula homebrew/dupes/grep
install_formula homebrew/dupes/screen
install_formula libyaml
install_formula mysql
install_formula openssl
install_formula postgresql
install_formula qt # --HEAD
install_formula reattach-to-user-namespace
install_formula redis
install_formula ruby-install
install_formula the_silver_searcher
install_formula tmux

e_arrow "Don't forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

e_header "Cleaning up"
brew cleanup
