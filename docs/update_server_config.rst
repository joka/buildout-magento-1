Update Server configurations
============================

Mind to understand installation first and have a look at the buildout (*cfg) files.

php configuration
-----------------------------

Edit template files::

    $ vim etc/php-ini.in

Rerun buildout::

    $ bin/buildout -o

Restart php::

    $ bin/supervisorctl restart php-fpm

nginx configuration
-----------------------------

Edit global template files::

    $ vim etc/nginx.conf.in

or the nginx parts in configuration.cfg::

    $ vim configuration.cfg

Rerun buildout::

    $ bin/buildout -o

Restart nginx::

    $ bin/supervisorctl restart nginx

webshop_api configuration
---------------------------------

Edit the webshopapix parts in configuration.cfg::

    $ vim configuration.cfg

Rerun buildout::

    $ bin/buildout -o

Restart webshop_api::

    $ bin/supervisorctl restart webshop_api


documentation
---------------


Edit *rst fils in docs/*

run python sphinx compiler::

    $ bin/webshop_api_build_docs

read docs/html or docs/latex/OrganicSeedsWebshopSchnittstelle.pdf


 Magento configuration
----------------------------

Don't use the admin panel to configure magento or change files in var/www.
These can be overriden by buildout.

Magento scopes are described here: http://www.magentocommerce.com/knowledge-base/entry/understanding-store-scopes.
To change store or website scope configuration modify magento-stores-conf.cfg
and rergenerate locale.xml::

    $ bin/magento-update-conf

To change global configuration or to add default data with SQL add an
extensions upgrade profile.



    $ cd src/organicseeds_profile

    get the current version number
    $ cat app/code/local/Organicseeds/Profile/etc/config.xml
    generate upgrade profile to new version
    $ zf upgrade mage-module organicseeds/profile to  0.0.2
    add upgrade code
    $ vim app/code/local/Organicseeds/Profile/sql/organicseeds_profile_setup/mysql4-upgrade-0.0.1-0.0.2.php

You can use wiz to list available config options
(https://github.com/classyllama/Wiz):

    $ bin/whiz config-get global/pdf

Add an extension module to magento
----------------------------------

For common extensions edit the modman part in configuration.cfg
(https://github.com/colinmollenhour/modman/wiki/Tutorial).
Rerun buildout:

    $ bin/buildout
