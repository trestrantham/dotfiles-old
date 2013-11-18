#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Messages"
###############################################################################

e_arrow "Disabling automatic emoji substitution" # i.e. use plain text smileys
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

e_arrow "Disabling smart quotes"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# e_arrow "Disabling continuous spell checking"
# defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false
