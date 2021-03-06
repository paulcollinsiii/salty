#!/bin/sh

# Bootstrapping for a raspberry pi

# Get repo and setup for Ansible run
set -x
USERGROUP=$(id -gn)
sudo apt-get update
sudo apt-get install -y ansible git
sudo mkdir -p /usr/local/srv
sudo chown root:${USERGROUP} /usr/local/srv
sudo chmod 775 /usr/local/srv
cd /usr/local/srv
git clone https://github.com/paulcollinsiii/salty.git
cd salty/ansible/etc

# Prevent stow from being sad
mv ~/.bashrc ~/.bashrc.bak

ansible-playbook -Kl kaffi all.yml
