#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "TextEdit"
###############################################################################

e_arrow "Setting plain text as default mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0

e_arrow "Setting UTF-8 as default for opening and saving files in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
