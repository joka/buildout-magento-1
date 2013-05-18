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


Magento-database create backup
------------------------------

manual complete database backup::

    $ bin/mysqldump -A --add-drop-database  --single-transaction > backupfile.sql


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

    $ bin/supervisorctl stop webshop_api

    $ rm -rf var/webshopapi_database/Data.fs*

    $ bin/supervisorctl start webshop_api


Update Magento
------------------------

* update magento version in configuration.cfg

* download magento_*tar.gz to downloads/

remove all magento files::
    $ rm -rf /var/www/*

rerun buildout::

    $ bin/buildout -o

clear magento cache::

    $ bin/whiz cache-clear

run all tests::

    $ bin/pytest -m"not loadtest"


Reinstall Magento
------------------------

stop supervisor::

    $ bin/supervisorctl shutdown

remove all magento and database files::

    $ rm -rf /var/www/*
    $ rm -rf /var/mysql/data
    $ rm -rf var/webshopapi_database/Data.fs*

rerun buildout::

    $ bin/buildout -o
