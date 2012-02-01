This project is to be used as a base project when developing Salt projects using the Vagrant tool for development and testing purposes.

# Intro #

It conatains a base `Vagrantfile` that configures two virtual machines:

* A **Salt Master** that contains a file server of salt states. FQDN is 'master.example.com'
* A **Salt Minion** that is automatically configured on startup. FQDN is 'minion.example.com'

Salt master has security authentication turned off as this is a development enviornment.

Each virtual machine will on startup run the command `salt-call state.highstate` to configure the node as necessary from the Salt State file found in directory `srv/salt`.

There is an example that configures an apache server changing the default `index.html` file like the tutorial found from http://saltstack.org.

# Setup #

In order to use this project you must have a Vagrant basebox with Salt and ZeroMQ pre-installed.

I used the [Veewee](https://github.com/jedi4ever/veewee) templates to build a new base box which can
be found here:

* [Ubuntu 11.10 32-bit](https://github.com/mattmcclean/veewee/tree/master/templates/ubuntu-11.10-server-i386-salt096): Sets up Ubuntu Oneiric 32-bit with ZeroMQ 2.1.1 and Salt 0.9.6 
* [Ubuntu 11.10 64-bit](https://github.com/mattmcclean/veewee/tree/master/templates/ubuntu-11.10-server-amd64-salt096): Sets up Ubuntu Oneiric 64-bit with ZeroMQ 2.1.1 and Salt 0.9.6 

# Notes

Currently only supports Ubuntu 11.10