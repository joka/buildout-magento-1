#!/bin/bash

source resty
resty  api.developlocal.sativa.jokasis.de
POST /categories < src/organicseeds_webshop_api/organicseeds_webshop_api/tests/testdata/categories_post.json 
POST /item_groups < src/organicseeds_webshop_api/organicseeds_webshop_api/tests/testdata/item_groups_post.json 
POST /vpe_types < src/organicseeds_webshop_api/organicseeds_webshop_api/tests/testdata/vpe_types_post.json 
POST /unit_of_measures < src/organicseeds_webshop_api/organicseeds_webshop_api/tests/testdata/unit_of_measures_post.json 
POST /items < src/organicseeds_webshop_api/organicseeds_webshop_api/tests/testdata/items_post.json 
