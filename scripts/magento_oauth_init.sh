# sudo gem install oauth
# System-->Permissions-->Users-->[select the admin]-->REST Role-->assign the formerly created REST admin role]
# http://www.aschroder.com/2012/04/introduction-to-the-magento-rest-apis-with-oauth-in-version-1-7/
# http://github.com/requests/requests-oauthlib

oauth \
  --verbose \
   --query-string \
   --consumer-key 98vrw053iuj0lnrotu08rlshk36yy9b5 \
   --consumer-secret 5f6a9p8ccb47kmx7j5fygdbftcb0bc8m \
   --access-token-url http://developlocal.sativa.jokasis.de/oauth/token \
   --authorize-url http://developlocal.sativa.jokasis.de/admin/oauth_authorize \
   --request-token-url http://developlocal.sativa.jokasis.de/oauth/initiate \
   authorize
