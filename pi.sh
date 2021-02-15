#!/bin/sh

# Bootstrapping for a raspberry pi

set -x
sudo apt-get update
sudo apt-get install -y ansible git
sudo mkdir /usr/local/srv
sudo chown root:pi /usr/local/srv
cd /usr/local/srv
git clone https://github.com/paulcollinsiii/salty.git
cd salty/ansible/etc
ansible-playbook -l pi all.yml
