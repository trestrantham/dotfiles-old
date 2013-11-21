#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Time Machine"
###############################################################################

e_rocket "Preventing prompt to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

e_rocket "Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal
