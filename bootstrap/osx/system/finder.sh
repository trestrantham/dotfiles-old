#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Finder"
###############################################################################

e_rocket "Showing all filename extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

e_rocket "Showing status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

e_rocket "Showing path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

e_rocket "Allowing text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

e_rocket "Displaying full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

e_rocket "Enabling searching of the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

e_rocket "Disabling file extension change warning"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

e_rocket "Enabling spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

e_rocket "Removing spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0

e_rocket "Disabling creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

e_rocket "Disabling disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

e_rocket "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

e_rocket "Enabling snap-to-grid for the desktop and icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

e_rocket "Increasing grid spacing for desktop and icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

e_rocket "Increasing the size of icons on the desktop and in icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

e_rocket "Setting list view as default Finder view"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

e_rocket "Disabling warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

e_rocket "Setting empty Trash securely as default"
defaults write com.apple.finder EmptyTrashSecurely -bool true

e_rocket "Showing the ~/Library folder"
chflags nohidden ~/Library
