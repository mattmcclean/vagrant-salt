#!/bin/bash

echo 'Setting up Salt Master'

echo 'Setting up Salt Master config file'
cd /etc/salt
sudo sed -e 's/#auto_accept: False/auto_accept: True/g' master.template | sudo tee master > /dev/null
sudo sed -i -e 's/#open_mode: False/open_mode: True/g' master
sudo sed -i -e 's/#file_roots:/file_roots:/g' master
sudo sed -i -e 's/#  base:/  base:/g' master
sudo sed -i -e 's/#    - \/srv\/salt/    - \/vagrant\/srv\/salt/g' master

cd /home/vagrant

echo 'Starting Salt Master process'
nohup sudo salt-master --log-level=debug > /var/log/salt-master.log 2>&1 &
echo 'Salt Master process started. For debug log goto: /var/log/salt-master.log'
