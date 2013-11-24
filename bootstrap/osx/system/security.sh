#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Security"
###############################################################################

e_rocket "Turning firewall on"
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
