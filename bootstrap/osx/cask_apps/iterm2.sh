#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "iTerm 2"
###############################################################################

e_rocket "Installing Solarized themes for iTerm"
open "${BASH_SOURCE[0]%/*/*/*}/config/Solarized Dark.itermcolors"
sleep 1
# open "${BASH_SOURCE[0]%/*/*/*}/config/Solarized Light.itermcolors"
# sleep 1

e_rocket "Disabling prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

e_rocket "Setting default fonts to Menlo 16"
/usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Non Ascii Font\" Menlo-Regular 16" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Normal Font\" Menlo-Regular 16" ~/Library/Preferences/com.googlecode.iterm2.plist

e_rocket "Disabling bright bold fonts"
/usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Use Bright Bold\" false" ~/Library/Preferences/com.googlecode.iterm2.plist
