#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Address Book"
###############################################################################

e_rocket "Enabling the debug menu"
defaults write com.apple.addressbook ABShowDebugMenu -bool true
