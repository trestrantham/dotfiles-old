#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Address Book"
###############################################################################

e_arrow "Enabling the debug menu"
defaults write com.apple.addressbook ABShowDebugMenu -bool true
