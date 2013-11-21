#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Mail"
###############################################################################

# e_rocket "Disabling send and reply animations"
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true

e_rocket "Setting email address copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>'"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# e_rocket "Adding the keyboard shortcut ⌘ + Enter to send an email"
# defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

e_rocket "Displaying emails in threaded mode, sorted by date descending"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

e_rocket "Disabling inline attachments"
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# e_rocket "Disabling automatic spell checking"
# defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"
