#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "iStat Menus"
###############################################################################

e_rocket "Applying serial key"
defaults write com.bjango.istatmenus serial4 -string "ship-door-swim-9361-37181892-4"

e_rocket "Hiding diagnositics"
defaults write com.bjango.istatmenus sendDiagnosticsShown -bool true

e_rocket "Configuring preferences"
defaults write com.bjango.istatmenus.extras BatteryDisplayMode -string "2"
defaults write com.bjango.istatmenus.extras CPUDisplayMode -string "0,2"
defaults write com.bjango.istatmenus.extras CPUGraphWidth -float 20
defaults write com.bjango.istatmenus.extras CPUGroupItems -float 0
defaults write com.bjango.istatmenus.extras CPULimitHistoryGraph -float 0
defaults write com.bjango.istatmenus.extras MemoryDisplayMode -string "3"
defaults write com.bjango.istatmenus.extras MenubarGraphOpacity -float 0
defaults write com.bjango.istatmenus.extras NetworkDisplayMode -string "1,0"
defaults write com.bjango.istatmenus.extras NetworkGraphMode -float 2
defaults write com.bjango.istatmenus.extras NetworkGraphWidth -float 20
defaults write com.bjango.istatmenus.extras SkinType -float 1
defaults write com.bjango.istatmenus.extras TimerFrequency -float 2
defaults write com.bjango.istatmenus.extras skinColor -float 5
defaults write com.bjango.istatmenus.extras updateCheckerEnabled -bool true
