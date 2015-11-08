#!/usr/bin/env bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
e_header "Alfred"
###############################################################################

e_rocket "Configuring preferences"
open "${BASH_SOURCE[0]%/*/*/*}/config/Alfred.alfredpreferences"
sleep 1

e_rocket "Applying minimal theme"
open "${BASH_SOURCE[0]%/*/*/*}/config/Minimal.alfredappearance"
sleep 1
