This project is to be used as a base project when developing Salt projects using the Vagrant tool for development and testing purposes.

It conatains a base `Vagrantfile` that configures two virtual machines:

* A Salt Master that contains a file server of salt states. FQDN is 'master.example.com'
* A Salt Minion that is automatically configured on startup.

Salt master has security authentication turned off as this is a development enviornment.

Each virtual machine will run its respective script file on startup to configure the Salt service.

Salt states can be configured from the directory `srv/salt` and there is an example that configures an apache server changing the default `index.html` file.
