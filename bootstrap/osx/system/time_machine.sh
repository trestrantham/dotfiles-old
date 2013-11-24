#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Time Machine"
###############################################################################

e_rocket "Preventing prompt to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

e_rocket "Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal
