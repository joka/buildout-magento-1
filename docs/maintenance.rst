Maintenance Tasks
===================


Manage Magento items/categories
--------------------------------

see api.rst


Magento-database restore backup
-------------------------------

TODO


Magento-database reset
-----------------------

.. code-block:: bash

    $ bin/supervisorctl shutdown

    $ rm -rf var/mysql/data

    $ bin/buildout install init-mysql-db

    $ bin/mysql -D magento < etc/magento_database_basic_views_26_04_2013.sql

upload categories/items


Magento-cache reset
---------------------

.. code-block:: bash

    $ bin/supervisorctl restart redis
    $ bin/whiz cache-clear


Magento-sessions reset
----------------------

.. code-block:: bash

    $ bin/supervisorctl restart redis


Webshop-API databse reset
-------------------------

.. code-block:: bash

    $ bin/supervisorctl stop webshopapi

    $ rm -rf var/webshopapi_database/Data.fs*

    $ bin/supervisorctl start  webshopapi


Reinstall/Update Magento
------------------------

* update magento version in configuration.cfg

* download magento_*tar.gz to downloads/

remove all magento files::
    $ rm -rf /var/www/*

reinstall::
    $ bin/buildout -o
