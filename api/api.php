<?php
/**
 * Description: This is the description of the document.
 * You can add as many lines as you want.
 * Remember you're not coding for yourself. The world needs your doc.
 * Example usage:
 * <pre>
 * if (Example_Class::example()) {
 *    echo "I am an example.";
 * }
 * </pre>
 *
 * @author		Michaël V. Dandrieux <mvd@eranos.fr>
 * @copyright	Copyright ©2015 Hands
 * @license		http://grandcentral.fr/license MIT License
 * @access		public
 * @link		http://grandcentral.fr
 */
/********************************************************************************************/
//	Allow Cross-origin
/********************************************************************************************/
	header("Access-Control-Allow-Origin: *");
	header('Access-Control-Allow-Credentials: true');
	header('Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE');
	header('Access-Control-Max-Age: 86400');
	header('Access-Control-Allow-Headers: Content-Type');

/********************************************************************************************/
//	Some Debug
/********************************************************************************************/
//	sentinel::debug(__FUNCTION__.' in '.__FILE__.' line '.__LINE__, $_PARAM['api']);
?>
