#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Dashboard"
###############################################################################

e_arrow "Disabling Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

e_arrow "Enabling Dashboard dev mode" # allows keeping widgets on the desktop
defaults write com.apple.dashboard devmode -bool true
