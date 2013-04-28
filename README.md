# Vagrant/Puppet configuration for LAMP

Forked from [jas0nkim/my-vagrant-puppet-lamp](https://github.com/jas0nkim/my-vagrant-puppet-lamp).

## Prerequisites
* [Vagrant](http://www.vagrantup.com/)
* [Virtual Box](https://www.virtualbox.org/)

## Instructions
1. Install precise32 Vagrant box. (If not installed already)

    $ vagrant box add precise32 http://files.vagrantup.com/precise32.box
    
2. Clone this repository.
3. Create directory "webroot" in the root directory of the clone. This will act as your root web folder.
4. Open up terminal, change directory to the git repo root, and start the vagrant box.

    $ vagrant up

You're all set up. The webserver will now be accessible from http://localhost:8888

## Package included

* apache2 - rewrite mode enabled, having virtual host with config - refer manifest/vagrant_webroot.sample
* php5
* php5-cli
* php5-mysql
* php-pear - installed packages: phpunit and its dependencies
* php5-dev
* php5-gd
* php5-mcrypt
* mysql-server
* curl
* vim

