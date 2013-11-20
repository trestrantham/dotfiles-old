#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Desktop"
###############################################################################

e_arrow "Setting desktop background"
defaults write com.apple.desktop Background '{default = {ImageFilePath = "/Library/Desktop Pictures/Shapes.jpg"; };}'
