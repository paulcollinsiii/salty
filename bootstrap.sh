#!/bin/bash

DEFAULT_USER="paulcollins"
SALTY_REPO="https://github.com/paulcollinsiii/salty"

#OS_NAME=$(uname -s 2>/dev/null)
#if [ "$OS_NAME" = "FreeBSD" ]; then


install_arch () {
  pacman -Sy
  pacman -S --noconfirm --needed base-devel git salt
  git clone ${SALTY_REPO} /usr/local/srv
  chown -R ${DEFAULT_USER}:root /usr/local/srv

  # base filesystem has this emtpy dir, and it's screwing with hub on me
  # I'm sure doing this won't come back to bite me </sarcasm>
  [ -d /usr/local/share/man -a ! -h /usr/local/share/man ] && rm -f /usr/local/share/man

  cat << EOF >> /etc/salt/master
  pillar_roots:
    base:
      - /usr/local/srv/pillar

  file_roots:
    base:
      - /usr/local/srv/salt

EOF

  cat << EOF >> /etc/salt/minion
  pillar_roots:
    base:
      - /usr/local/srv/pillar

  file_roots:
    base:
      - /usr/local/srv/salt

EOF
}


install_bsd () {
  pkg update
  pkg install -y py27-salt git
  git clone ${SALTY_REPO} /usr/local/etc/salt/srv
  ln -s /usr/local/etc/salt/srv/salt /usr/local/etc/salt/states
  ln -s /usr/local/etc/salt/srv/pillar /usr/local/etc/salt/pillar
  mv /usr/local/etc/salt/minion.sample /usr/local/etc/salt/minion
  mv /usr/local/etc/salt/master.sample /usr/local/etc/salt/master
}


install_ubuntu () {
  wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
  echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list

  sudo apt-get update
  sudo apt-get install -y salt-minion git
  chown root:paulcollins /srv
  chmod 775 /srv
  git clone ${SALTY_REPO} /srv
}

salt-call --local state.highstate
