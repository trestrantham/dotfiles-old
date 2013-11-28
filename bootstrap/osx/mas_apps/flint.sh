#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Flint"
###############################################################################

read -p "Is Flint installed via Mac App Store? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  e_rocket "Hiding menu bar icon"
  defaults write ~/Library/Containers/com.giantcomet.flint/Data/Library/Preferences/com.giantcomet.flint showMenuBarIcon -bool false

  e_rocket "Setting name autocomplete to first name"
  defaults write ~/Library/Containers/com.giantcomet.flint/Data/Library/Preferences/com.giantcomet.flint completeType -int 1

  e_rocket "Disabling enter/leave mssages"
  defaults write ~/Library/Containers/com.giantcomet.flint/Data/Library/Preferences/com.giantcomet.flint showEnterLeaveMessage -bool false

  e_rocket "Enabling hide instead of close"
  defaults write ~/Library/Containers/com.giantcomet.flint/Data/Library/Preferences/com.giantcomet.flint hideInsteadOfClose -bool true

  e_rocket "Disabling autoplay GIFs"
  defaults write ~/Library/Containers/com.giantcomet.flint/Data/Library/Preferences/com.giantcomet.flint automaticallyPlayAnimatedGifs -bool false

  e_rocket "Setting notifications for Tab only"
  defaults write ~/Library/Containers/com.giantcomet.flint/Data/Library/Preferences/com.giantcomet.flint allMessagesNotifications -int 16

  e_rocket "Opening links in background"
  defaults write ~/Library/Containers/com.giantcomet.flint/Data/Library/Preferences/com.giantcomet.flint openLinksInBackground -bool true
else
  echo
  e_error "Flint must be installed before running configuration."
fi
