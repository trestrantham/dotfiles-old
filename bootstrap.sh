#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source $SCRIPT_PATH/bootstrap/include.sh

echo
echo "Bootstrapping..."
echo
e_arrow "Xcode or Command Line Tools for Xcode must be installed before proceeding!"
echo

PS3=$'\nPick your poison: '
options=("Bootstrap all the things" "Dotfiles" "Homebrew" \
         "Homebrew Formulas" "Homebrew Casks" "OS X Defaults" "ASDF" "Ruby" \
         "Erlang" "Elixir" "Quit")

select opt in "${options[@]}"; do
  case $opt in
    "Bootstrap all the things")
      install_homebrew
      install_formulas
      install_casks
      install_dotfiles
      install_defaults
      install_asdf
      install_rubies
      install_erlangs
      install_elixirs
      ;;
    "Dotfiles")
      e_header "$opt"
      install_dotfiles
      ;;
    "Homebrew")
      e_header "$opt"
      install_homebrew
      ;;
    "Homebrew Formulas")
      e_header "$opt"
      install_formulas
      ;;
    "Homebrew Casks")
      e_header "$opt"
      install_casks
      ;;
    "OS X Defaults")
      e_header "$opt"
      install_defaults
      ;;
    "ASDF")
      e_header "$opt"
      install_asdf
      ;;
    "Ruby")
      e_header "$opt"
      install_rubies
      ;;
    "Erlang")
      e_header "$opt"
      install_erlangs
      ;;
    "Elixir")
      e_header "$opt"
      install_elixirs
      ;;
    "Quit")
      echo
      e_success "All done. You must restart for these changes to take effect."
      break;;
    *) echo invalid option;;
  esac
done
