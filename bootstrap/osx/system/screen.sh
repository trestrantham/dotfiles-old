#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Screen"
###############################################################################

e_rocket "Requiring password after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 30 # 30 seconds

e_rocket "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

e_rocket "Save screenshots in PNG format" # (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# e_rocket "Disabling shadows in screenshots"
# defaults write com.apple.screencapture disable-shadow -bool true

e_rocket "Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

e_rocket "Enabling HiDPI display modes" # (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
