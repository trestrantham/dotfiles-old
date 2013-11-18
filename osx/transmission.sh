#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Transmission"
###############################################################################

e_arrow "Setting '~/Documents/Torrents' as default folder for incomplete downloads"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

e_arrow "Disabling download confirmation prompt"
defaults write org.m0k.transmission DownloadAsk -bool false

e_arrow "Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

e_arrow "Hiding donate message"
defaults write org.m0k.transmission WarningDonate -bool false

e_arrow "Hiding the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false
