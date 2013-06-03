===============================
REST Webshop API Documentation
===============================

Webservice to mange the webshop (magento) data.


Usage
========

* url development: http://api.develop.sativa.jokasis.de

* example usage (with curl wrapper resty https://github.com/micha/resty:

.. code-block:: bash

   resty  api.develop.sativa.jokasis.de

   <Method> <url>                                <path>    <body> (content-type text/json, utf-8)
   DELETE   api.develop.sativa.jokasis.de/categories "{}"
   POST     api.develop.sativa.jokasis.de/categories < categories_post.json

* example json/yaml data is found in: src/organicseeds_webshop_api/organicseeds_webshop_api/tests/testdata/


Create Items, ItemGroups and Categories
=======================================

.. automodule:: organicseeds_webshop_api.services


POST /categories
------------------

.. autofunction:: organicseeds_webshop_api.services.categories_post

**Example json data (yaml):**

.. literalinclude:: testdata/categories_post.yaml
   :language: yaml


DELETE /categories
--------------------

.. autofunction:: organicseeds_webshop_api.services.categories_delete


POST /item_groups
------------------

.. autofunction:: organicseeds_webshop_api.services.item_groups_post

**Example json data (yaml):**

.. literalinclude:: testdata/item_groups_post.yaml
   :language: yaml


DELETE /item_groups
--------------------

.. autofunction:: organicseeds_webshop_api.services.item_groups_delete


POST /unit_of_measures
----------------------

.. autofunction:: organicseeds_webshop_api.services.unit_of_measures_post

**Example json data (yaml):**

.. literalinclude:: testdata/unit_of_measures_post.yaml
   :language: yaml


DELETE /unit_of_measures
--------------------------

.. autofunction:: organicseeds_webshop_api.services.unit_of_measures_delete


PUT /unit_of_measures
------------------------

.. autofunction:: organicseeds_webshop_api.services.unit_of_measures_put


POST /vpe_types
----------------------

.. autofunction:: organicseeds_webshop_api.services.vpe_types_post

**Example json data (yaml):**

.. literalinclude:: testdata/vpe_types_post.yaml
   :language: yaml


DELETE /vpe_types
----------------------

.. autofunction:: organicseeds_webshop_api.services.vpe_types_delete


PUT /vpe_types
---------------

.. autofunction:: organicseeds_webshop_api.services.vpe_types_put


POST /items
------------

.. autofunction:: organicseeds_webshop_api.services.items_post

**Example json data (yaml):**

.. literalinclude:: testdata/items_post.yaml
   :language: yaml


DELETE /items
-----------------

.. autofunction:: organicseeds_webshop_api.services.items_delete


PUT /items
------------

.. autofunction:: organicseeds_webshop_api.services.items_put


Create and update Customers
============================


Get and Update Orders (and Invoices)
====================================

GET /orders
-----------
.. autofunction:: organicseeds_webshop_api.services.orders_get


PUT /orders
-----------
.. autofunction:: organicseeds_webshop_api.services.orders_put


PUT /invoices
-------------
.. autofunction:: organicseeds_webshop_api.services.invoices_put


Get Items, ItemGroups, Categories
========================================


GET /items/<id>
----------------
.. autofunction:: organicseeds_webshop_api.services.item_get


GET /item_groups/<id>
---------------------
.. autofunction:: organicseeds_webshop_api.services.item_group_get


GET /categories/<id>
---------------------


Search Items, ItemGroups, Categories
=====================================


GET /search
-----------
.. autofunction:: organicseeds_webshop_api.services.search_get


Return codes
=============

- status code: 200

  body: {"status": "succeeded"}

- status code: 400 - Bad request

  The request data is not valid.

  body: {"status": "errors", "errors": errors }
  With errors being a JSON dictionary with the keys “location”, “name” and “description”.
  location is the location of the error. It can be “querystring”, “header” or “body”
  name is the eventual name of the value that caused problems
  description is a description of the problem encountered.

- status code: 500 - Internal Server error

  Something totally unexpected happend.

  Read WebhsopAPI log files for details.

- status code: 502  - Bad Gateway

  There are errors communication with the webshop (magento).

  body: {“status”: “errors”, “errors”: errors } .
  With errors being a JSON dictionary with the keys “location”, “name” and “description”.
  Read Magento log files for more details.


Use Cases
==========


Create Items, ItemGroups and Categories
---------------------------------------

.. literalinclude:: use_cases/create_items_item_groups_and_categories.rst
   :language: rst


Update Groups and Categories
-------------------------------

.. literalinclude:: use_cases/update_item_groups_and_categories.rst
   :language: rst


Update Items
------------

.. literalinclude:: use_cases/update_items.rst
   :language: rst


Get and Update Orders
----------------------

.. literalinclude:: use_cases/get_and_update_orders.rst
   :language: rst


Get Items, ItemGroups and Categories
------------------------------------

.. literalinclude:: use_cases/get_items_item_groups_and_categories_data.rst
   :language: rst


Search Items, ItemGroups and Categories
-----------------------------------------

.. literalinclude:: use_cases/search_items_item_groups_and_categories.rst
   :language: rst


Basic fields
==================

Identifier
----------
.. autoclass:: organicseeds_webshop_api.schemata.Identifier

String
----------------
.. autoclass:: organicseeds_webshop_api.schemata.String

StringTranslation
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.StringTranslation

Decimal
----------------
.. autoclass:: organicseeds_webshop_api.schemata.Decimal

Float
----------------
.. autoclass:: organicseeds_webshop_api.schemata.Float

Float2DecPoints
----------------
.. autoclass:: organicseeds_webshop_api.schemata.Float2DecPoints

Float4DecPoints
----------------
.. autoclass:: organicseeds_webshop_api.schemata.Float4DecPoints

URL
----------------
.. autoclass:: organicseeds_webshop_api.schemata.URL

RelativeFilePathUnix
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.RelativeFilePathUnix

Integer
----------------
.. autoclass:: organicseeds_webshop_api.schemata.Integer

IntegerGtEqNull
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.IntegerGtEqNull

IntegerGtNull
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.IntegerGtNull

Identifier
----------------
.. autoclass:: organicseeds_webshop_api.schemata.Identifier

ShopID
----------------
.. autoclass:: organicseeds_webshop_api.schemata.ShopID

WebsiteID
----------------
.. autoclass:: organicseeds_webshop_api.schemata.WebsiteID

CustomerGroup
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.CustomerGroup

TaxClass
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.TaxClass

Address
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.Address

OrderItem
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.OrderItem


Complex fields with inheritance
=====================================

Some attribute groups are inherit from category to item_group.
They have a group field for semantical grouping (attributes for
profi customers, download documents, ..)
The order field sort the attributes of one group (ascending).

TextAttribute
-------------------

.. autoclass:: organicseeds_webshop_api.schemata.TextAttribute
.. autoclass:: organicseeds_webshop_api.schemata.TextLink

MeasureAttribute
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.MeasureAttribute

BoolAttribute
-------------------
.. autoclass:: organicseeds_webshop_api.schemata.BoolAttribute

WeekmatrixAttribute
------------------------
.. autoclass:: organicseeds_webshop_api.schemata.WeekmatrixAttribute

FileAttribute
--------------
.. autoclass:: organicseeds_webshop_api.schemata.FileAttribute

LinkAttribute
------------------
.. autoclass:: organicseeds_webshop_api.schemata.LinkAttribute


Complex fields without inheritance
========================================

Shop
----------------
.. autoclass:: organicseeds_webshop_api.schemata.Shop

WebsitePrice
----------------
.. autoclass:: organicseeds_webshop_api.schemata.WebsitePrice

TierPrice
----------------
.. autoclass:: organicseeds_webshop_api.schemata.TierPrice

SynonymsTranslation
---------------------
.. autoclass:: organicseeds_webshop_api.schemata.SynonymsTranslation

Quality
----------------
.. autoclass:: organicseeds_webshop_api.schemata.Quality

TaxClass
----------------
.. autoclass:: organicseeds_webshop_api.schemata.TaxClass

KW (calendar week)
-------------------
.. autoclass:: organicseeds_webshop_api.schemata.KW


Schema enties
================

BasicNode (base schema)
--------------------------
.. autoclass:: organicseeds_webshop_api.schemata.BasicNode

Category
--------
.. autoclass:: organicseeds_webshop_api.schemata.Category

ItemGroup
------------
.. autoclass:: organicseeds_webshop_api.schemata.ItemGroup

ItemGroupGet
------------
.. autoclass:: organicseeds_webshop_api.schemata.ItemGroupGet

(VPEType)
---------------
.. autoclass:: organicseeds_webshop_api.schemata.VPEType

(UnitOfMeasure)
-----------------
.. autoclass:: organicseeds_webshop_api.schemata.UnitOfMeasure

Item
----
.. autoclass:: organicseeds_webshop_api.schemata.Item

ItemUpdate
-------------
.. autoclass:: organicseeds_webshop_api.schemata.ItemUpdate

ItemGet
-------------
.. autoclass:: organicseeds_webshop_api.schemata.ItemGet

Order
-------------
.. autoclass:: organicseeds_webshop_api.schemata.Order

OrderUpdate
-------------
.. autoclass:: organicseeds_webshop_api.schemata.OrderUpdate

OrderItem
-------------
.. autoclass:: organicseeds_webshop_api.schemata.OrderItem

Invoice
-------
.. autoclass:: organicseeds_webshop_api.schemata.Invoice

InvoiceResult
-------------
.. autoclass:: organicseeds_webshop_api.schemata.InvoiceResult
