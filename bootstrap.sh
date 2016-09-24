#!/bin/bash


# wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list


sudo apt-get update
sudo apt-get install -y salt-minion git
chown root:paulcollins /srv
chmod 775 /srv
git clone https://github.com/paulcollinsiii/salty /srv
salt-call --local state.highstate
vim +PluginInstall +qall
