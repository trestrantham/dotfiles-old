#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*}/include.sh

e_header "Setting up Homebrew Casks"
brew tap phinze/homebrew-cask 2>/dev/null
brew install brew-cask 2>/dev/null

install_cask alfred
install_cask backblaze-downloader
install_cask bartender
install_cask bittorrent-sync
install_cask cloak
install_cask dropbox
install_cask github
install_cask google-chrome
install_cask heroku-toolbelt
install_cask istat-menus
install_cask iterm2
install_cask keepassx
install_cask knock
install_cask mou
install_cask sublime-text
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
