#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*}/include.sh

e_header "Setting up Homebrew Casks"
brew tap phinze/homebrew-cask 2>/dev/null
brew install brew-cask 2>/dev/null

install_cask 1password
install_cask bartender
install_cask divvy
install_cask dropbox
install_cask github-desktop
install_cask google-chrome
install_cask heroku-toolbelt
install_cask istat-menus
install_cask slack
install_cask the-unarchiver
install_cask things
install_cask transmission
install_cask vlc

# Save IFS
_IFS=$IFS
IFS=$(echo -en "\n\b")

e_header "Moving casks to /Applications"
for f in `find "/opt/homebrew-cask/Caskroom" -name '*.app' -maxdepth 3`; do
  rm -rf "/Applications/$( basename $f)"
  e_rocket "$f \033[1;33m➜\033[0m /Applications/$( basename $f)"
  mv -f "$f" /Applications
done

# Restore IFS
IFS=$_IFS
