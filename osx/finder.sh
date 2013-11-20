#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Finder"
###############################################################################

# e_arrow "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
# defaults write com.apple.finder QuitMenuItem -bool true

# e_arrow "Disabling Finder window and Get Info animations"
# defaults write com.apple.finder DisableAllAnimations -bool true

# e_arrow "Showing icons for hard drives, servers, and removable media on the desktop"
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# e_arrow "Showing hidden files in Finder"
# defaults write com.apple.finder AppleShowAllFiles -bool true

e_arrow "Showing all filename extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

e_arrow "Showing status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

e_arrow "Showing path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

e_arrow "Allowing text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

e_arrow "Displaying full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

e_arrow "Enabling searching of the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

e_arrow "Disabling file extension change warning"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

e_arrow "Enabling spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

e_arrow "Removing spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0

e_arrow "Disabling creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

e_arrow "Disabling disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

e_arrow "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# e_arrow "Show item info near icons on the desktop and in other icon views"
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# e_arrow "Show item info to the right of the icons on the desktop"
# /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

e_arrow "Enabling snap-to-grid for the desktop and icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

e_arrow "Increasing grid spacing for desktop and icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

e_arrow "Increasing the size of icons on the desktop and in icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

e_arrow "Setting list view as default Finder view"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

e_arrow "Disabling warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

e_arrow "Setting empty Trash securely as default"
defaults write com.apple.finder EmptyTrashSecurely -bool true

e_arrow "Enabling AirDrop over Ethernet and on unsupported Macs running Lion"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

e_arrow "Enabling the MacBook Air SuperDrive on any Mac"
sudo nvram boot-args="mbasd=1"

e_arrow "Showing the ~/Library folder"
chflags nohidden ~/Library

e_arrow "Removing Dropbox's green checkmark icons in Finder"
file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
[ -e "${file}" ] && mv -f "${file}" "${file}.bak"
