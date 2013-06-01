#!/bin/sh

#bin/supervisorctl stop webshop_api
#cp etc/webshop_database_with_testdata.fs var/webshopapi_database/Data.fs 
#bin/supervisorctl start webshop_api

bin/mysqldump -A --add-drop-database  --single-transaction > etc/magento_database_basic_views_WITH_TESTDATA_CURRENT.sql
