#!/usr/bin/env bash

# Pretty pictures
function e_header()  { echo -e "\n\033[1m$@\033[0m";      }
function e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()   { echo -e "\033[1;34m==>\033[0m $@"; }

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `default` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
