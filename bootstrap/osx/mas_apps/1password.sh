#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "1Password"
###############################################################################

read -p "Is 1Password installed via Mac App Store? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  e_rocket "Showing rich icons"
  defaults write ~/Library/Containers/com.agilebits.onepassword-osx/Data/Library/Preferences/com.agilebits.onepassword-osx ShowRichIcons -bool true

  e_rocket "Locking on idle"
  defaults write ~/Library/Containers/com.agilebits.onepassword-osx/Data/Library/Preferences/com.agilebits.onepassword-osx LockOnIdle -bool true

  e_rocket "Enabling menu bar icon"
  defaults write ~/Library/Containers/com.agilebits.onepassword-osx/Data/Library/Preferences/com.agilebits.onepassword-osx ShowStatusItem -bool true

  e_rocket "Keeping helper running"
  defaults write ~/Library/Containers/com.agilebits.onepassword-osx/Data/Library/Preferences/com.agilebits.onepassword-osx KeepHelperRunning -bool true

  e_rocket "Disabling lock on app exit" # in favor of timeout
  defaults write ~/Library/Containers/com.agilebits.onepassword-osx/Data/Library/Preferences/com.agilebits.onepassword-osx LockOnMainAppExit -bool false

  e_rocket "Disabling welcome window"
  defaults write ~/Library/Containers/com.agilebits.onepassword-osx/Data/Library/Preferences/com.agilebits.onepassword-osx WelcomeWindowShown -bool true
  defaults write ~/Library/Containers/com.agilebits.onepassword-osx/Data/Library/Preferences/com.agilebits.onepassword-osx CompeletedEssentialSettings -bool true
else
  echo
  e_error "1Password must be installed before running configuration."
fi
