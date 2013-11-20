#!/usr/bin/env bash

# Pretty pictures
function e_header()  { echo -e "\n\033[1m$@\033[0m";      }
function e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()   { echo -e "\033[1;34m==>\033[0m $@"; }

function install_cask() {
  e_header "Installing ${@}"
  brew cask install --appdir="/Applications" --force "${@}"

  if [[ $? != 0 ]]; then
    e_error "${@}"
  else
    e_success "${@}"
  fi
}

e_header "Setting up Homebrew Casks"
brew tap phinze/homebrew-cask 2>/dev/null
brew install brew-cask 2>/dev/null

install_cask alfred
install_cask backblaze-downloader
install_cask bartender
install_cask dropbox
install_cask github
install_cask google-chrome
install_cask heroku-toolbelt
install_cask istat-menus
install_cask iterm2
install_cask knock
install_cask sublime-text
install_cask transmission
install_cask vlc

# Save IFS
_IFS=$IFS
IFS=$(echo -en "\n\b")

e_header "Moving casks to /Applications"
for f in `find "/opt/homebrew-cask/Caskroom" -name '*.app' -maxdepth 3`; do
  rm -r "/Applications/$( basename $f)"
  e_arrow "$f \033[1;33m➜\033[0m /Applications/$( basename $f)"
  mv -f "$f" /Applications
done

# Restore IFS
IFS=$_IFS
