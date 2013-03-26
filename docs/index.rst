.. OrganicSeeds Webshop Schnittstelle documentation master file, created by
   sphinx-quickstart on Thu Mar 14 11:56:40 2013.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

=============================================================
Welcome to OrganicSeeds Webshop Schnittstelle's documentation
==============================================================

Contents:
=========


.. toctree::
   :maxdepth: 2

API Documentation
=================

Upload Items and Categories to the Webshop
------------------------------------------

.. services::
   :modules: organicseeds_webshop_api.services
   :service: items

.. literalinclude:: items_post.py

Return codes
____________

- status code: 200
  body: {"status": "succeeded"}

- status code: 400
  body: {"status": "errors", "errors": errors }
     With errors being a JSON dictionary with the keys “location”, “name” and “description”.
     location is the location of the error. It can be “querystring”, “header” or “body”
     name is the eventual name of the value that caused problems
     description is a description of the problem encountered.


Development
===========

- Testcoverage: http://test_coverage_python.develop.sativa.jokasis.de
- installation:


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

