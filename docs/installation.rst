Install Servers
===============

This deployment uses buildout to build and configure the servers to run Magento and the
webshop api webservice:

   - 'mysql:mysqld', mariadb database to run magento
   - 'php-fpm', php factcgi process to run magento
   - 'redis', nosql database to cache magento code and sessions
   - 'ngix', main web server
   - 'webhops_api', python webservice to access magento
   - 'supervisor', daemon to control process states

Log rotation is configured for all of these.The log rotation configuration file is in
parts/logrotate.conf and this needs to be symlinked into the main logrotate configuration.

The buildout is splitted in different files:

   - ``configuration.cfg`` : configure hostnames, ports, config and log files
   - ``magento_stores_conf.cfg`` : magento stores configuration (used to generate locale.xml)
   - ``base.cfg`` : build dependencies/server

   - ``develop_local.cfg`` : custumization for the local developoment environment
   - ``develop.cfg`` : custumization for the developoment environment on the sever
   - ``staging.cfg`` : custumization for the staging environment on the sever
   - ``production.cfg`` : custumization for the prodcution environment on the sever

   - ``buildout.cfg``: default buildout file, extend here configuration.cfg, develop.cfg, staging.cfg or production.cfg

Installation
-------------

Install Dependencies

Example for Debian 6 and Ubuntu 12.10::

    $ sudo apt-get install gcc make build-essential autoconf libltdl-dev cmak ebin86 unzip libpcre3-dev zlib1g-dev libssl-dev libghc6-bzlib-dev
    $ sudo apt-get install libcurl4-openssl-dev libxml2-dev  libjpeg-dev libpng12-dev libgd2-xpm-dev libmcrypt-dev libfreetype6-dev gettext libaio-dev
    $ sudo apt-get install python
    $ sudo apt-get install imagemagick

For Mac OSX use http://mxcl.github.com/homebrew/ or similar to install dependencies

To checkout the source code / buildout you need a bitbucket.com acckount with uploaded ssh-key.
They ssh-key should be added to you ssh-agent::

        $ ssh-add

Checkout the source code and buildout repository::

    $ mkdir magnento
    $ cd magento
    $ git clone https://organic_seeds@bitbucket.org/organic_seeds/magento_buildout.git .
    $ git submodule init
    $ git submodule update

Compile Python 2.7::

    $ cd python
    $ python boostrap.py
    $ bin/buildout
    $ ../

Run buildout to build/configure all server::

    $ bin/python bootstrap.py
    $ bin/buildout

Check that every server runs fine::

    $ bin/supervisorctl status
    $ bin/mysql

Add your domain (magento base url) to /etc/hosts::

    $ echo "127.0.0.1 develop.sativa.jokasis.de hobby.develop.sativa.jokasis.de resell.develop.sativa.jokasis.de profi.develop.sativa.jokasis" | sudo tee -a  /etc/hosts"

Proxy develop.sativa.jokasis.de to develop.sativa.jokasis.de:9010, magento needs to run without port numbers.

Log into the mangento admin panel http://develop.sativa.jokasis.de/admin:

   * create initial pages/blocks: system -> GermanSetup -> DISABLE Steuer-Einstellungen, Konfigurations-Einstellungen, -> GermanSetupAusführen




