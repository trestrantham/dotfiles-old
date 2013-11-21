#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Desktop"
###############################################################################

e_rocket "Setting desktop background"
defaults write com.apple.desktop Background '{default = {ImageFilePath = "/Library/Desktop Pictures/Shapes.jpg"; };}'
