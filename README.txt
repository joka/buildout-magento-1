Buildout zur Installation von Magento und der Bingenheim/Savia Selectline Schnittstelle 
========================================================================================

This deployment uses buildout to build and configure the servers to deploy Magento.
Please read buildout.cfg to see all system configurations.

Installation
-------------

1.a Install Dependencies (tested with Debian 6 and Ubuntu 12.10):

    $ sudo apt-get install libpng-dev libjpeg-dev gcc make build-essential bin86 unzip libpcre3-dev zlib1g-dev git libssl-dev libghc6-bzlib-dev
    $ sudo apt-get install libcurl4-openssl-dev libxml2-dev  libjpeg-dev libpng12-dev  libgd2-xpm-dev libmcrypt-dev libfreetype6-dev gettext  
    $ sudo apt-get install python python-virtualenv
    $ sudo apt-get install imagemagick libpcre3-dev autoconf libltdl-dev cmake

1.b Install Dependencies Mac OSX:

    use http://mxcl.github.com/homebrew/ or similar to install dependencies

2. Create an isolated python environment:
    $virtualenv .

3. Run buildout to build/configure all server:
    $ bin/python bootstrap.py
    $ bin/buildout 
    
   Setup Mysql and start supervisor (server to controll process states):
    $ bin/buildout install init-mysql-db

   Check that every server runs fine:
    $ bin/supervisorctl status

4. Add your domain (magento base url) to /etc/hosts:

    $ echo "127.0.0.1 develop.sativa.jokasis.de hobby.develop.sativa.jokasis.de resell.develop.sativa.jokasis.de profi.develop.sativa.jokasis" | sudo tee -a  /etc/hosts"

5a Import databse with categories, websites, stores and views !!overrides database!!: 

    $ bin/mysql < etc/magento_database_basic_views_14_03_2013.sql

5b Or run the magento installer 

    $ bin/buildout install magento-install

   Log into the mangento admin panel:

    http://127.0.0.1:9010/admin

   Add root categories manually: 

    go to cataglog-> manage categories
    add and activate ch_hobby, ch_profi, ch_resell, fr_hobby, fr_resell, fr_profi, de_hobby, de_resell
 
   Add websites, stores, views manually: 
   
    got to system-> manage stores
    add websites chwebsite, frwebsite, dewebsite

    add stores and select the right website / root category:  ch_hobby, ch_profi, fr_hobby, fr_resell, fr_profi, de_hobby, de_resell

    add storeviews for every language: de_ch_hobby, fr_ch_hobby..  fr_fr_hobby, ...


6. Generate the magento config (lokale.xml)

    $ bin/magento-update-conf 



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



 
