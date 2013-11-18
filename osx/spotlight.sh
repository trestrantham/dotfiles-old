#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Spotlight"
###############################################################################

e_arrow "Hiding tray-icon and helper"
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

e_arrow "Disabling indexing for any volume that's mounted and hasn't yet been indexed"
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

e_arrow "Changing indexing order and disabling some file types"
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 1;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 1;"name" = "CONTACT";}' \
	'{"enabled" = 1;"name" = "SOURCE";}' \
	'{"enabled" = 1;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}'

e_arrow "Loading new settings before rebuilding index"
killall mds > /dev/null 2>&1

e_arrow "Enabling indexing for main volume"
sudo mdutil -i on / > /dev/null

e_arrow "Rebuilding index from scratch"
sudo mdutil -E / > /dev/null
