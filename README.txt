Buildout zur Installation von Magento und der Bingenheim/Savia Selectline Schnittstelle 
========================================================================================

Installation (Getestet mit Debian 6 und Ubuntu 12.10):

    $ sudo apt-get install libpng-dev libjpeg-dev gcc make build-essential bin86 unzip libpcre3-dev zlib1g-dev git libssl-dev libghc6-bzlib-dev
    $ sudo apt-get install libcurl4-openssl-dev libxml2-dev  libjpeg-dev libpng12-dev  libgd2-xpm-dev libmcrypt-dev libfreetype6-dev gettext  
    $ sudo apt-get install python python-virtualenv
    $ sudo apt-get install imagemagick libpcre3-dev autoconf

    $./parts/php-build/bin/pecl install apc
    add extension=apc.so to php.ini
    
    virtual env .
    bin/buildout bootstrap.py
    bin/buildout 
    bin/buildout install init-magento-db
