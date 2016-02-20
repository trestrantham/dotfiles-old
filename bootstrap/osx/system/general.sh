#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "General UI/UX"
###############################################################################

e_rocket "Setting computer name"
sudo scutil --set ComputerName "Icarus"
sudo scutil --set HostName "Icarus"
sudo scutil --set LocalHostName "Icarus"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Icarus"

e_rocket "Disabling Guest account"
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool FALSE
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool FALSE
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool FALSE
sudo defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool TRUE
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool FALSE

e_rocket "Setting standby delay to 24 hours"
sudo pmset -a standbydelay 86400

e_rocket "Setting sidebar icon size to small"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

e_rocket "Automatically show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

e_rocket "Increasing window resize speed"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

e_rocket "Expanding save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

e_rocket "Expanding print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

e_rocket "Setting disk as default when saving"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

e_rocket "Automatically quit printer app when print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

e_rocket "Disabling confirm open application dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

e_rocket "Setting Help Viewer windows to non-floating mode"
defaults write com.apple.helpviewer DevMode -bool true

e_rocket "Reveal IP address, hostname, OS version when clicking clock in login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

e_rocket "Check for software updates daily"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

e_rocket "Disabling smart quotes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

e_rocket "Disabling smart dashes"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

e_rocket "Setting screen savers to Flurry"
sudo defaults write com.apple.screensaver moduleName "Flurry"
sudo defaults write com.apple.screensaver modulePath "/System/Library/Screen Savers/Flurry.saver"
sudo defaults write /Library/Preferences/com.apple.screensaver loginWindowModulePath "/System/Library/Screen Savers/Flurry.saver"

e_rocket "Setting screen savers delay to 5 minutes"
sudo defaults write com.apple.screensaver idleTime -int 300
sudo defaults write /Library/Preferences/com.apple.screensaver loginWindowIdleTime -int 300

e_rocket "Disabling Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true
