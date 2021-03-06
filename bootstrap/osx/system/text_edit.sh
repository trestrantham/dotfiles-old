#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "TextEdit"
###############################################################################

e_rocket "Setting plain text as default mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0

e_rocket "Setting UTF-8 as default for opening and saving files in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
