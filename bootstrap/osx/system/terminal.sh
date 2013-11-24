#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Terminal"
###############################################################################

e_rocket "Only use UTF-8 in Terminal"
defaults write com.apple.terminal StringEncodings -array 4

e_rocket "Installing Solarized themes for Terminal"
open "${BASH_SOURCE[0]%/*/*/*}/config/Solarized Dark.terminal"
sleep 1
defaults write com.apple.terminal "Default Window Settings" -string "Solarized Dark"
defaults write com.apple.terminal "Startup Window Settings" -string "Solarized Dark"

# e_rocket "Enabling `focus follows mouse` for Terminal and all X11 apps"
# i.e. hover over a window and start typing in it without clicking first
# defaults write com.apple.terminal FocusFollowsMouse -bool true
# defaults write org.x.X11 wm_ffm -bool true
