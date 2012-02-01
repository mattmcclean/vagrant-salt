This project is to be used as a base project when developing Salt projects using the Vagrant tool for development and testing purposes.

It conatains a base `Vagrantfile` that configures two virtual machines:

* A **Salt Master** that contains a file server of salt states. FQDN is 'master.example.com'
* A **Salt Minion** that is automatically configured on startup. FQDN is 'minion.example.com'

Salt master has security authentication turned off as this is a development enviornment.

Each virtual machine will on startup run the command `salt-call state.highstate` to configure the node as necessary from the Salt State file found in directory `srv/salt`.

There is an example that configures an apache server changing the default `index.html` file like the tutorial found from http://saltstack.org.
