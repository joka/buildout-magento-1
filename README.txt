
Deployment to install Magento and the webshop api webservice for Bingenheim/Satvia selecline 
============================================================================================

# This deployment uses buildout to build and configure the servers to run Magento and the 
# webshop api webservice:
#
#   - 'mysql', database to run magento
#   - 'php-fpm', php factcgi process to run magento
#   - 'ngix', main web server
#   - 'webhops_api', python webservice to access magento
#   - 'supervisor', daemon to controll process states
# 
# Log rotation is configured for all of these.The log rotation configuration file is in 
# parts/logrotate.conf and this needs to be symlinked into the main logrotate configuration.
# 
# The buildout is splitted in different files:
#
#   - configuration.cfg: configure hostnames, ports, config and log files
#   - magento_stores_conf.cfg: magento stores configuration (used to generate locale.xml)
#   - base.cfg: build dependencies/server
#
#   - develop.cfg : custumization for the developoment environment on the sever
#   - staging.cfg : custumization for the staging environment on the sever
#   - production.cfg : custumization for the prodcution environment on the sever
#
#   - buildout.cfg: default buildout file, extend here configuration.cfg, develop.cfg, staging.cfg or production.cfg

Installation
-------------

A.  To checkout the source code / buildout you need a bitbucket.com acckount with uploaded ssh-key.
    They ssh-key should be added to you ssh-agent: 
        $ ssh-add

0.1 Install Dependencies (tested with Debian 6 and Ubuntu 12.10):

    $ sudo apt-get install libpng-dev libjpeg-dev gcc make build-essential bin86 unzip libpcre3-dev zlib1g-dev git libssl-dev libghc6-bzlib-dev
    $ sudo apt-get install libcurl4-openssl-dev libxml2-dev  libjpeg-dev libpng12-dev  libgd2-xpm-dev libmcrypt-dev libfreetype6-dev gettext  
    $ sudo apt-get install python python-virtualenv
    $ sudo apt-get install imagemagick libpcre3-dev autoconf libltdl-dev cmake openssh-client

0.2 Install Dependencies Mac OSX:

    use http://mxcl.github.com/homebrew/ or similar to install dependencies

1  Checkout this buildout repository:
    
    $ mkdir magnento 
    $ cd magento
    $ git clone https://organic_seeds@bitbucket.org/organic_seeds/magento_buildout.git . 
    $ git submodule init
    $ git submodule update

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


6. Generate the magento config (locale.xml)

    $ bin/magento-update-conf 


Update server configuration
-----------------------------

Edit template files

    $ vim etc/php-ini.in

Rerun buildout:

    $ bin/buildout

Update Magento configuration
----------------------------

Don't use the admin panel to configure magento or change files in var/www. 
These can be overriden by buildout.

Instead modify configuration.cfg or magento-stores-conf.cfg and rergenerate locale.xml:

    $ bin/magento-update-conf

You can use wiz to list available config options
(https://github.com/classyllama/Wiz):

    $ bin/whiz config-get global/pdf

Add an extension module to magento
----------------------------------

For common extensions edit the modman part in configuration.cfg
(https://github.com/colinmollenhour/modman/wiki/Tutorial).
Rerun buildout:

    $ bin/buildout

PHP coding style guide
--------------------------------

- Code generation with MTool if needed
- Use observers and theme interface whenever possible instead of core overrides.
- https://wiki.magento.com/display/MAGE2DOC/PHP+Coding+Standards+and+Practices#PHPCodingStandardsandPractices-3.CodingStyle
- PHPUnit oder functional test browser tests, try 99% code coverage

Python coding style guide
--------------------------------

- pep8, pyflakes, pepp-257
- http://docs.pylonsproject.org/en/latest/community/codestyle.html 
- 99% test coverage

Use the GIT version control system
---------------------------------

http://git-scm.com/book
http://ndpsoftware.com/git-cheatsheet.html#loc=index

Commit every atomic modifcation.

update:
    $ git pull --rebase     
commit:
    $ git add changed file
    $ git commit -m"my change"
update:
    $ git pull --rebase     
push to upstream:
    $ git push

For complex modifcations use features branches and merging 
(http://nakedstartup.com/2010/04/simple-daily-git-workflow):
 





 
