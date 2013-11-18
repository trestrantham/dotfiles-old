#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Mac App Store"
###############################################################################

e_arrow "Enabling WebKit Developer Tools"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

e_arrow "Enabling Debug Menu"
defaults write com.apple.appstore ShowDebugMenu -bool true
