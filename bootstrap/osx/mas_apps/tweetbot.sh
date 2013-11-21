#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Tweetbot"
###############################################################################

read -p "Is Tweetbot installed via Mac App Store? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  e_rocket "Setting text options"
  defaults write ~/Library/Containers/com.tapbots.TweetbotMac/Data/Library/Preferences/com.tapbots.TweetbotMac TextAutomaticQuoteSubstitution -bool true
  defaults write ~/Library/Containers/com.tapbots.TweetbotMac/Data/Library/Preferences/com.tapbots.TweetbotMac TextAutomaticTextReplacement -bool true
  defaults write ~/Library/Containers/com.tapbots.TweetbotMac/Data/Library/Preferences/com.tapbots.TweetbotMac TextContinuousSpellChecking -bool true
  defaults write ~/Library/Containers/com.tapbots.TweetbotMac/Data/Library/Preferences/com.tapbots.TweetbotMac TextAutomaticDashSubstitution -bool true

  e_rocket "Opening links in background"
  defaults write ~/Library/Containers/com.tapbots.TweetbotMac/Data/Library/Preferences/com.tapbots.TweetbotMac openURLInBackground -bool true

  e_rocket "Disabling menu bar icon"
  defaults write ~/Library/Containers/com.tapbots.TweetbotMac/Data/Library/Preferences/com.tapbots.TweetbotMac showStatusItem -bool false
else
  echo
  e_error "Tweetbot must be installed before running configuration."
fi
