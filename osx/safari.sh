#!/usr/bin/env bash

source $(dirname $0)/include.sh

###############################################################################
e_header "Safari & WebKit"
###############################################################################

e_arrow "Setting home page to 'about:blank'"
defaults write com.apple.Safari HomePage -string "about:blank"

e_arrow "Setting new windows and tabs to a blank page"
defaults write com.apple.Safari NewWindowBehavior -int 1
defaults write com.apple.Safari NewTabBehavior -int 1

e_arrow "Preventing opening of 'safe' files automatically after downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

e_arrow "Enabling Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# e_arrow "Hiding bookmarks bar"
# defaults write com.apple.Safari ShowFavoritesBar -bool false

e_arrow "Disabling thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

e_arrow "Enabling debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

e_arrow "Configuring search banners to 'Contains' instead of 'Starts With'"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

e_arrow "Removing unused icons from bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

e_arrow "Enabling Develop menu and Web Inspector"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

e_arrow "Adding context menu item for Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
