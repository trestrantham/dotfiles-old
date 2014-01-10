#!/usr/bin/env bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_PATH%/*/*}/include.sh

###############################################################################
# e_header "Remote Pair"
###############################################################################

e_rocket "Creating aliases for Pair and pair"
sudo dscl . -append /Users/$USER RecordName Pair pair

e_rocket "Disabling SSH password authentication"
sudo perl -pi -e 's/^#PasswordAuthentication/PasswordAuthentication/' /etc/sshd_config
sudo perl -pi -e 's/^#ChallengeResponseAuthentication/ChallengeResponseAuthentication/' /etc/sshd_config
sudo perl -pi -e 's/^ChallengeResponseAuthentication\s+yes/ChallengeResponseAuthentication no/' /etc/sshd_config

e_rocket "Configuring SSH public keys"
touch ~/.ssh/authorized_keys

users=( albus522 bryckbost danielmorrison emilford \
        ersatzryan gaffneyc jasonroelofs jcarpenter88 \
        laserlemon manlycode pichot tbugai trestrantham )

# GitHub seems to throttle these requests.
# Try again later if there's any unexpected errors.
for user in "${users[@]}"; do
  e_arrow "Adding GitHub public keys for $user"
  gh-auth add --users $user --command="$( which tmux ) attach -t pair"
done
