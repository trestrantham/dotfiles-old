#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Dashboard"
###############################################################################

e_rocket "Disabling Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

e_rocket "Enabling Dashboard dev mode" # allows keeping widgets on the desktop
defaults write com.apple.dashboard devmode -bool true
