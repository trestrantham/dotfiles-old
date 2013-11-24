#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "SSD-specific tweaks"
###############################################################################

e_rocket "Disabling local Time Machine snapshots"
sudo tmutil disablelocal

# e_rocket "Disabling hibernation" # speeds up entering sleep mode
# sudo pmset -a hibernatemode 0

e_rocket "Removing sleep image file" # to save disk space
sudo rm -f /Private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /Private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /Private/var/vm/sleepimage

e_rocket "Disabling sudden motion sensor" # not useful for SSDs
sudo pmset -a sms 0
