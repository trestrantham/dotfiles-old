#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Mac App Store"
###############################################################################

e_rocket "Enabling WebKit Developer Tools"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

e_rocket "Enabling Debug Menu"
defaults write com.apple.appstore ShowDebugMenu -bool true
