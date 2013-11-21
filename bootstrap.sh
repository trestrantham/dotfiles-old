#!/usr/bin/env bash

source bootstrap/include.sh

echo "Bootstrapping..."
echo

PS3=$'\nPick your poison: '
options=("Bootstrap all the things" "GCC" "Dotfiles" "Homebrew" \
         "Homebrew Formulas" "Homebrew Casks" "OS X Defaults" "Quit")

select opt in "${options[@]}"; do
  case $opt in
    "Bootstrap all the things")
      install_gcc
      install_dotfiles
      install_homebrew
      install_formulas
      install_casks
      install_defaults
      ;;
    "GCC")
      e_header "Installing $opt"
      install_gcc
      ;;
    "Dotfiles")
      e_header "Installing $opt"
      install_dotfiles
      ;;
    "Homebrew")
      e_header "Installing $opt"
      install_gcc
      install_homebrew
      ;;
    "Homebrew Formulas")
      e_header "Installing $opt"
      install_gcc
      install_homebrew
      install_formulas
      ;;
    "Homebrew Casks")
      e_header "Installing $opt"
      install_gcc
      install_homebrew
      install_casks
      ;;
    "OS X Defaults")
      e_header "Installing $opt"
      install_defaults
      ;;
    "Quit")
      echo
      e_arrow "All done. You must restart for these changes to take effect."
      break;;
    *) echo invalid option;;
  esac
done
