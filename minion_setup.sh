#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "1 argument required, $# provided"

echo 'Setting up Salt Minion'

echo 'Salt Master IP address is ' $1

cd /etc/salt
sudo sed 's/#master: salt/master: '${1}'/g' minion.template > minion
cd /home/vagrant

echo 'Starting Salt Minion'
nohup sudo salt-minion --log-level=debug > salt-minion.log 2>&1 &

