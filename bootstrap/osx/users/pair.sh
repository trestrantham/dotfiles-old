#!/usr/bin/env bash

source ${BASH_SOURCE[0]%/*/*/*}/include.sh

###############################################################################
# e_header "Remote Pair User"
###############################################################################

read -p "Create remote pair user? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  e_rocket "Creating user Pair"
  sudo dscl . create /Users/Pair
  sudo dscl . create /Users/Pair RealName "Remote Pair"
  sudo dscl . create /Users/Pair UniqueID 555
  sudo dscl . create /Users/Pair PrimaryGroupID 1000
  sudo dscl . create /Users/Pair NFSHomeDirectory /Local/Users/Pair

  e_rocket "Setting shell for Pair"
  sudo dscl . create /Users/Pair UserShell /bin/bash

  e_rocket "Enabling SSH for Pair only"
  sudo dscl . create /Groups/com.apple.access_ssh GroupMembership "Pair"

  e_rocket "Disabling SSH password authentication"
  sudo perl -pi -e 's/^#PasswordAuthentication/PasswordAuthentication/' /etc/sshd_config
  sudo perl -pi -e 's/^#ChallengeResponseAuthentication/ChallengeResponseAuthentication/' /etc/sshd_config

  e_rocket "Adding ~/.ssh/id_rsa.pub to Pair's authorized_keys"
  sudo mkdir -p /Users/Pair/.ssh
  cat ~/.ssh/id_rsa.pub > /tmp/authorized_keys.tmp
  sudo cp /tmp/authorized_keys.tmp /Users/Pair/.ssh/authorized_keys
else
  echo
  e_arrow "Skipping Pair user"
fi

echo
read -p "Add SSH public keys to Pair user authorized_keys? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  read -p "Directory of public keys (/path/to/keys): " -r

  _IFS=$IFS
  IFS=$(echo -en "\n\b")

  for f in `find $REPLY -name "*.pub" -depth 1`; do
    if [ ! $( basename "$f" ) == "matt_rsa.pub" ]; then
      e_rocket "Adding $( basename "$f" )"
      cat "$f" >> /tmp/authorized_keys.tmp
      echo "" >> /tmp/authorized_keys.tmp
    fi
  done

  IFS=$_IFS

  e_rocket "Updating Pair user authorized_keys"
  sudo mv /tmp/authorized_keys.tmp /Users/Pair/.ssh/authorized_keys
else
  echo
  e_arrow "Skipping Pair user SSH keys"
fi

sudo rm /tmp/authorized_keys.tmp 2>/dev/null
