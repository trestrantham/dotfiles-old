#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Terminal & iTerm 2"
###############################################################################

e_arrow "Only use UTF-8 in Terminal"
defaults write com.apple.terminal StringEncodings -array 4

e_arrow "Installing Solarized themes for Terminal"
open "$BASH_SOURCE[0]/../../config/Solarized Dark.terminal"
sleep 1
open "$BASH_SOURCE[0]/../../config/Solarized Light.terminal"
sleep 1
defaults write com.apple.terminal "Default Window Settings" -string "Solarized Dark"
defaults write com.apple.terminal "Startup Window Settings" -string "Solarized Dark"

# e_arrow "Enabling `focus follows mouse` for Terminal and all X11 apps"
# i.e. hover over a window and start typing in it without clicking first
# defaults write com.apple.terminal FocusFollowsMouse -bool true
# defaults write org.x.X11 wm_ffm -bool true

e_arrow "Installing Solarized themes for iTerm"
open "$BASH_SOURCE[0]/../../config/Solarized Dark.itermcolors"
sleep 1
open "$BASH_SOURCE[0]/../../config/Solarized Light.itermcolors"
sleep 1

e_arrow "Disabling prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
