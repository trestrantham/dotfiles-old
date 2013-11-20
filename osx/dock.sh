#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Dock"
###############################################################################

e_arrow "Enabling magnicfication"
defaults write com.apple.dock magnification -bool true

e_arrow "Setting the icon size to 48 pixels"
defaults write com.apple.dock tilesize -int 48

e_arrow "Setting magnication size to 96 pixels"
defaults write com.apple.dock largesize -float 96

e_arrow "Enabling highlight hover effect for the grid view stacks"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

e_arrow "Minimize windows into their application's icon"
defaults write com.apple.dock minimize-to-application -bool true

e_arrow "Enabling spring loading"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

e_arrow "Showing indicator lights for open applications"
defaults write com.apple.dock show-process-indicators -bool true

# e_arrow "Removing auto-hiding Dock delay"
# defaults write com.apple.dock autohide-delay -float 0

# e_arrow "Removing animation when hiding/showing the Dock"
# defaults write com.apple.dock autohide-time-modifier -float 0

# e_arrow "Enabling 2D Dock"
# defaults write com.apple.dock no-glass -bool true

e_arrow "Setting app icons"
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Safari.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Mail.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Messages.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# e_arrow "Disabling animation when opening applications from the Dock"
# defaults write com.apple.dock launchanim -bool false

e_arrow "Speeding up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.2

e_arrow "Disabling grouping windows by application in Mission Control"
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false


e_arrow "Disabling automatic rearranging of Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

e_arrow "Enabling automatic hide and show of the Dock"
defaults write com.apple.dock autohide -bool true

e_arrow "Enabling translucent Dock icons for hidden applications"
defaults write com.apple.dock showhidden -bool true

e_arrow "Resetting Launchpad"
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete

e_arrow "Adding iOS Simulator to Launchpad"
sudo ln -sf /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app /Applications/iOS\ Simulator.app
