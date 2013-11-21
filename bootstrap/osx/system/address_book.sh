#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Address Book"
###############################################################################

e_rocket "Enabling the debug menu"
defaults write com.apple.addressbook ABShowDebugMenu -bool true
