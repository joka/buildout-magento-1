=================
API Documentation
=================

Upload Items and Categories to the Webshop
==========================================

.. automodule:: organicseeds_webshop_api.services
   :noindex:

POST /item_groups
------------------

.. autofunction:: organicseeds_webshop_api.services.item_groups_post

Schema definitions
____________________

.. autoclass:: organicseeds_webshop_api.schemata.ItemGroup


Example json data (yaml syntax):
__________________________________

.. literalinclude:: item_groups_post.yaml



POST /items
----------

.. autofunction:: organicseeds_webshop_api.services.items_post

Schema definitions
____________________

.. autoclass:: organicseeds_webshop_api.schemata.UnitOfMeasure

.. autoclass:: organicseeds_webshop_api.schemata.VPEType

.. autoclass:: organicseeds_webshop_api.schemata.Item


Example json data (yaml syntax):
__________________________________

.. literalinclude:: items_post.yaml

Return codes
=============

- status code: 200

  body: {"status": "succeeded"}

- status code: 400

  body: {"status": "errors", "errors": errors }
  With errors being a JSON dictionary with the keys “location”, “name” and “description”.
  location is the location of the error. It can be “querystring”, “header” or “body”
  name is the eventual name of the value that caused problems
  description is a description of the problem encountered.

