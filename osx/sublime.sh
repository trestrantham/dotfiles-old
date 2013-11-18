#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Sublime Text"
###############################################################################

e_arrow "Installing Sublime Text settings"
cp -r ../config/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null
