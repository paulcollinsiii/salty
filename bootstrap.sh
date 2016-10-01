#!/bin/bash


# wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list

OS_NAME=$(uname -s 2>/dev/null)
if [ "$OS_NAME" = "FreeBSD" ]; then
  pkg update
  pkg install py27-salt git
  git clone https://github.com/paulcollinsiii/salty /usr/local/etc/salt/srv
  ln -s /usr/local/etc/salt/srv/salt /usr/local/etc/salt/states
  ln -s /usr/local/etc/salt/srv/pillar /usr/local/etc/salt/pillar
else
  sudo apt-get update
  sudo apt-get install -y salt-minion git
  chown root:paulcollins /srv
  chmod 775 /srv
  git clone https://github.com/paulcollinsiii/salty /srv
fi

salt-call --local state.highstate
vim +PluginInstall +qall
