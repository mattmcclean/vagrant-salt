#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "1 argument required, $# provided"

echo 'Setting up Salt Minion'

echo 'Salt Master IP address is ' $1

cd /etc/salt
sudo sed 's/#master: salt/master: '${1}'/g' minion.template | sudo tee minion > /dev/null
cd /home/vagrant

echo 'Starting Salt Minion'
nohup sudo salt-minion --log-level=debug > /var/log/salt-minion.log 2>&1 &
echo 'Salt Minion started. For debug log goto: /var/log/salt-minion.log'

#echo 'Sleeping for 5 seconds to allow minion to properly connect with master'
#sleep 5

echo 'Call state.highstate command to configure minion'
sudo salt-call state.highstate
