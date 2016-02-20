#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

e_header "Login Items"

login_items=("Alfred\ 2.app" "Bartender.app" "Divvy.app" "Dropbox.app")

e_rocket "Adding Login Items"
for item in "${login_items[@]}"; do
  e_arrow "Adding $item to login items"
  osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"/Applications/$item\", hidden:false}"
done
