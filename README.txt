Buildout zur Installation von Magento und der Bingenheim/Savia Selectline Schnittstelle 
========================================================================================

This deployment uses buildout to build and configure the servers to deploy Magento.
Please read buildout.cfg to see all system configurations.

Installation
-------------

Install Dependencies (tested with Debian 6 and Ubuntu 12.10):

    $ sudo apt-get install libpng-dev libjpeg-dev gcc make build-essential bin86 unzip libpcre3-dev zlib1g-dev git libssl-dev libghc6-bzlib-dev
    $ sudo apt-get install libcurl4-openssl-dev libxml2-dev  libjpeg-dev libpng12-dev  libgd2-xpm-dev libmcrypt-dev libfreetype6-dev gettext  
    $ sudo apt-get install python python-virtualenv
    $ sudo apt-get install imagemagick libpcre3-dev autoconf libltdl-dev cmake

Create an isolated python environment:
    $virtualenv .

Run buildout to build/configure all server:
    $ bin/python bootstrap.py
    $ bin/buildout 
    
Setup Mysql and start supervisor (server to controll process states):
    $ bin/buildout install init-mysql-db

Check that every server runs fine:
    $ bin/supervisorctl status

Run the magento installer
    $ bin/buildout install magento-install

Enjoy magento:

    http://127.0.0.1:9010/admin


Update Server configurations
-----------------------------

Edit template files

    $ vim etc/php-ini.in

Rerun buildout:

    $ bin/buildout

Change Magento configuration
----------------------------

Don't use the Webinterface to configure magento or change files in var/www. 
The files in var/www or the mysql database can be overriden by buildout.
Instead edit magento-conf buildout part and rerun buildout
(cfgrepo/config/magento.cfg gives you an example how to modify locale.xml).

You can use wiz to list available config options:
$  bin/whiz config-get global/pdf

Add an extension module to magento
----------------------------------



 
