#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
e_header "Trackpad, mouse, keyboard, Bluetooth accessories, and input"
###############################################################################

e_rocket "Enabling tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

e_rocket "Setting mouse tracking speed"
defaults write NSGlobalDoman com.apple.mouse.scaling 3.0
# defaults delete NSGlobalDoman com.apple.mouse.scaling

e_rocket "Setting up Magic Mouse"
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonDivision -int 55
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "TwoButton"
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseHorizontalScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseMomentumScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseOneFingerDoubleTapGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerDoubleTapGesture -int 3
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseVerticalScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse UserPreference -int 1

e_rocket "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

e_rocket "Enabling full keyboard access for all controls"
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

e_rocket "Enabling scroll gesture with Ctrl (^) modifier to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

e_rocket "Map Caps Lock key to Control" # Maps for all connected keyboards
ioreg -n IOHIDKeyboard -r | grep -E 'VendorID"|ProductID' | awk '{ print $4 }' | paste -s -d'-\n' - | xargs -I{} /usr/bin/defaults -currentHost write -g "com.apple.keyboard.modifiermapping.{}-0" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>"

e_rocket "Follow the keyboard focus while zoomed in"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

e_rocket "Disabling press-and-hold for keys" # in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

e_rocket "Setting keyboard repeat rate" # really fast
defaults write NSGlobalDomain KeyRepeat -int 0.01

e_rocket "Enabling automatic illumination for built-in MacBook keyboard"
defaults write com.apple.BezelServices kDim -bool true

e_rocket "Setting 5 minute timeout for keyboard illumination"
defaults write com.apple.BezelServices kDimTime -int 300

e_rocket "Setting default timezone" # see `systemsetup -listtimezones` for other values
systemsetup -settimezone "America/Detroit" > /dev/null

# e_rocket "Disable auto-correct"
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# e_rocket "Disabling iTunes from responding to the keyboard media keys"
# launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null
