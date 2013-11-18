#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Time Machine"
###############################################################################

e_arrow "Preventing prompt to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

e_arrow "Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal
