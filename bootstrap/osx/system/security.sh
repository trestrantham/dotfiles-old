#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Security"
###############################################################################

e_rocket "Turning firewall on"
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
