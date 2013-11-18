#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "SSD-specific tweaks"
###############################################################################

e_arrow "Disabling local Time Machine snapshots"
sudo tmutil disablelocal

# e_arrow "Disabling hibernation" # speeds up entering sleep mode
# sudo pmset -a hibernatemode 0

e_arrow "Removing sleep image file" # to save disk space
sudo rm -f /Private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /Private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /Private/var/vm/sleepimage

e_arrow "Disabling sudden motion sensor" # not useful for SSDs
sudo pmset -a sms 0
