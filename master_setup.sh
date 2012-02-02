#!/bin/bash

echo 'Setting up Salt Master'

echo 'Copying Salt Master config file to VM'
sudo cp /vagrant/master.conf /etc/salt/master

echo 'Starting Salt Master process'
nohup sudo salt-master &
echo 'Salt Master process started'
