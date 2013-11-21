#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "iTerm 2"
###############################################################################

e_rocket "Installing Solarized themes for iTerm"
open "$BASH_SOURCE[0]/../../config/Solarized Dark.itermcolors"
sleep 1
open "$BASH_SOURCE[0]/../../config/Solarized Light.itermcolors"
sleep 1

e_rocket "Disabling prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
