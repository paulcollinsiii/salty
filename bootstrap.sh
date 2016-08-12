#!/bin/bash

sudo add-apt-repository ppa:saltstack/salt
sudo apt-get update
sudo apt-get install -y salt-minion git
