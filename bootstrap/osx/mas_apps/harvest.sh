#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Harvest"
###############################################################################

read -p "Is Harvest installed via Mac App Store? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  e_rocket "Hiding Dock icon"
  defaults write ~/Library/Containers/com.getharvest.harvestxapp/Data/Library/Preferences/com.getharvest.harvestxapp HideInDock -bool true

  e_rocket "Disabling idle timer warning"
  defaults write ~/Library/Containers/com.getharvest.harvestxapp/Data/Library/Preferences/com.getharvest.harvestxapp IdleTimerEnabled -bool false

  e_rocket "Disabling start at login"
  defaults write ~/Library/Containers/com.getharvest.harvestxapp/Data/Library/Preferences/com.getharvest.harvestxapp StartAtLogin -bool false
else
  echo
  e_error "Harvest must be installed before running configuration."
fi
