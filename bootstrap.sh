#!/usr/bin/env bash

source bootstrap/include.sh

echo "Bootstrapping..."
echo

PS3=$'\nPick your poison: '
options=("Bootstrap all the things" "GCC" "Dotfiles" "Homebrew" \
         "Homebrew Formulas" "Homebrew Casks" "OS X Defaults" \
         "Ruby Gems" "Remote Pair" "Quit")

select opt in "${options[@]}"; do
  case $opt in
    "Bootstrap all the things")
      install_gcc
      install_dotfiles
      install_homebrew
      install_formulas
      install_casks
      install_defaults
      create_pair_user
      ;;
    "GCC")
      e_header "$opt"
      install_gcc
      ;;
    "Dotfiles")
      e_header "$opt"
      install_dotfiles
      ;;
    "Homebrew")
      e_header "$opt"
      install_gcc
      install_homebrew
      ;;
    "Homebrew Formulas")
      e_header "$opt"
      install_gcc
      install_homebrew
      install_formulas
      ;;
    "Homebrew Casks")
      e_header "$opt"
      install_gcc
      install_homebrew
      install_casks
      ;;
    "OS X Defaults")
      e_header "$opt"
      install_defaults
      ;;
    "Ruby Gems")
      e_header "$opt"
      install_gems
      ;;
    "Remote Pair")
      e_header "$opt"
      setup_remote_pair
      ;;
    "Quit")
      echo
      e_success "All done. You must restart for these changes to take effect."
      break;;
    *) echo invalid option;;
  esac
done
