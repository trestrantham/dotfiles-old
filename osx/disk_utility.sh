#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Disk Utility"
###############################################################################

e_arrow "Enabling the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true
