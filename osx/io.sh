#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Trackpad, mouse, keyboard, Bluetooth accessories, and input"
###############################################################################

e_arrow "Enabling tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

e_arrow "Setting mouse tracking speed"
defaults write NSGlobalDoman com.apple.mouse.scaling 3.0
# defaults delete NSGlobalDoman com.apple.mouse.scaling

e_arrow "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

e_arrow "Enabling full keyboard access for all controls"
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

e_arrow "Enabling scroll gesture with Ctrl (^) modifier to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

e_arrow "Map Caps Lock key to Control" # Maps for all connected keyboards
ioreg -n IOHIDKeyboard -r | grep -E 'VendorID"|ProductID' | awk '{ print $4 }' | paste -s -d'-\n' - | xargs -I{} /usr/bin/defaults -currentHost write -g "com.apple.keyboard.modifiermapping.{}-0" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>"

e_arrow "Follow the keyboard focus while zoomed in"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

e_arrow "Disabling press-and-hold for keys" # in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

e_arrow "Setting keyboard repeat rate" # really fast
defaults write NSGlobalDomain KeyRepeat -int 0.01

e_arrow "Enabling automatic illumination for built-in MacBook keyboard"
defaults write com.apple.BezelServices kDim -bool true

e_arrow "Setting 5 minute timeout for keyboard illumination"
defaults write com.apple.BezelServices kDimTime -int 300

e_arrow "Setting default timezone" # see `systemsetup -listtimezones` for other values
systemsetup -settimezone "America/Detroit" > /dev/null

# e_arrow "Disable auto-correct"
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# e_arrow "Disabling iTunes from responding to the keyboard media keys"
# launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null
