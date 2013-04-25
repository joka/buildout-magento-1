<?php
// Magento login information
$mage_url = 'http://hobby.developlocal.sativa.jokasis.de/index.php/api/soap?wsdl';
$mage_user = 'webshop_api';
$mage_api_key = 'oxXCcvIAhdXcw';
// Initialize the SOAP client
$soap = new SoapClient( $mage_url );
// Login to Magento
$session_id = $soap->login( $mage_user, $mage_api_key );
echo $session_id;
