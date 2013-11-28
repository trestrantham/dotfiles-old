#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Desktop"
###############################################################################

e_rocket "Setting desktop background"
# defaults write com.apple.desktop Background '{default = {ImageFilePath = "/Library/Desktop Pictures/Shapes.jpg"; };}'
python $SCRIPT_PATH/config/set_desktops.py --path /Library/Desktop\ Pictures/Shapes.jpg
