#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "General UI/UX"
###############################################################################

e_arrow "Setting computer name"
sudo scutil --set ComputerName "Icarus"
sudo scutil --set HostName "Icarus"
sudo scutil --set LocalHostName "Icarus"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Icarus"

e_arrow "Disabling Guest account"
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool FALSE
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool FALSE
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool FALSE
sudo defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool TRUE
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool FALSE

e_arrow "Setting standby delay to 24 hours"
sudo pmset -a standbydelay 86400

# e_arrow "Disabling sound effects on boot"
# sudo nvram SystemAudioVolume=" "

# e_arrow "Disabling menubar transparency"
# defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

e_arrow "Configuring menubar battery time and percentage"
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

e_arrow "Hiding Time Machine and Volume menubar icons"
sudo defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"
sudo defaults -currentHost write com.apple.systemuiserver dontAutoLoad -array "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"

e_arrow "Setting sidebar icon size to small"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

e_arrow "Automatically show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

e_arrow "Increasing window resize speed"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

e_arrow "Expanding save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

e_arrow "Expanding print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

e_arrow "Setting disk as default when saving"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

e_arrow "Automatically quit printer app when print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

e_arrow "Disabling confirm open application dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
e_arrow "Displaying ASCII control characters using caret notation"
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

e_arrow "Disabling resume system-wide"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

e_arrow "Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# e_arrow "Disabling the crash reporter"
# defaults write com.apple.CrashReporter DialogType -string "none"

e_arrow "Setting Help Viewer windows to non-floating mode"
defaults write com.apple.helpviewer DevMode -bool true

e_arrow "Reveal IP address, hostname, OS version when clicking clock in login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# e_arrow "Disabling sleep mode"
# systemsetup -setcomputersleep Off > /dev/null

e_arrow "Check for software updates daily"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

e_arrow "Disabling Notification Center"
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

e_arrow "Disabling smart quotes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

e_arrow "Disabling smart dashes"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

e_arrow "Changing appearance color to Graphite"
defaults write -g 'AppleAquaColorVariant' -int 6

e_arrow "Changing highlight color to Graphite"
defaults write -g 'AppleHighlightColor' -string '0.7804 0.8157 0.8588'

e_arrow "Setting screen savers to Flurry"
sudo defaults write com.apple.screensaver moduleName "Flurry"
sudo defaults write com.apple.screensaver modulePath "/System/Library/Screen Savers/Flurry.saver"
sudo defaults write /Library/Preferences/com.apple.screensaver loginWindowModulePath "/System/Library/Screen Savers/Flurry.saver"

e_arrow "Setting screen savers delay to 5 minutes"
sudo defaults write com.apple.screensaver idleTime -int 300
sudo defaults write /Library/Preferences/com.apple.screensaver loginWindowIdleTime -int 300

e_arrow "Disabling Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true
