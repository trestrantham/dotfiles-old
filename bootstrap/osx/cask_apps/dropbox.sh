#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Dropbox"
###############################################################################

e_rocket "Removing green checkmark icons in Finder"
file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
[ -e "${file}" ] && mv -f "${file}" "${file}.bak"

e_rocket "Changing menu bar icon to black"
for p in /Applications/Dropbox.app/Contents/Resources/*-lep.tiff; do echo cp $p ${p/-lep./.}; done
