#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Mac App Store"
###############################################################################

e_rocket "Enabling WebKit Developer Tools"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

e_rocket "Enabling Debug Menu"
defaults write com.apple.appstore ShowDebugMenu -bool true
