=================
API Documentation
=================

Upload Items and Categories to the Webshop
==========================================

.. automodule:: organicseeds_webshop_api.services
   :noindex:

POST /items
----------

.. autoclass:: organicseeds_webshop_api.services.items_post
   :noindex:

Schema definitions
____________________

.. autoclass:: organicseeds_webshop_api.schemata.UnitOfMeasure
   :noindex:
   :members:

.. autoclass:: organicseeds_webshop_api.schemata.VPEType
   :noindex:
   :members:

.. autoclass:: organicseeds_webshop_api.schemata.Item
   :noindex:
   :members:


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

