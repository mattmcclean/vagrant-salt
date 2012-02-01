#!/bin/bash

echo 'Setting up Salt Master'

echo 'Setting up Salt Master config file'
cd /etc/salt
sudo sed 's/#auto_accept: False/auto_accept: True/g' master.template > master
sudo echo "file_roots:" >> master
sudo echo "  base:" >> master
sudo echo "    - /vagrant/srv/salt" >> master
cd /home/vagrant

echo 'Starting Salt Master process'
nohup sudo salt-master --log-level=debug > salt-master.log 2>&1 &
