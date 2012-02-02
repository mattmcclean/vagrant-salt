#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "1 argument required, $# provided"

min_name=`hostname -s`
echo 'Setting up Salt Minion with name: ' $min_name 

echo 'Salt Master IP address is ' $1

[ -f /vagrant/$min_name.conf ] || die "File: /vagrant/$min_name.conf does not exist"

sudo sed 's/#master: salt/master: '${1}'/g' /vagrant/$min_name.conf | sudo tee /etc/salt/minion > /dev/null

echo 'Starting Salt Minion'
nohup sudo salt-minion > /dev/null 2>&1 &
echo 'Salt Minion started'

echo 'Call state.highstate command to configure minion'
sudo salt-call state.highstate
