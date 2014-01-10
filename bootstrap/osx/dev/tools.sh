#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
# e_header "Dev tools"
###############################################################################

e_rocket "Installing pow"
sudo curl get.pow.cx | sh
