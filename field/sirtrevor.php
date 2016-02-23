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
 * @package		The package
 * @author		Michaël V. Dandrieux <mvd@eranos.fr>
 * @copyright	Copyright © 2004-2013, Café Central
 * @license		http://www.cafecentral.fr/fr/licences GNU Public License
 * @access		public
 * @link		http://www.cafecentral.fr/fr/wiki
 */
/********************************************************************************************/
//	Bind
/********************************************************************************************/
//	Apps
	$app = app('sirtrevor');
	$app->load();
//	Css
	$_APP->bind_css('css/sirtrevor.css');
//	Script
	$_APP->bind_script('js/sirtrevor.js');
	$_APP->bind_code('script', '
		new SirTrevor.Editor(
		{
			el:$(".js-st-instance"),
			blockTypes: ["Text", "Heading", "List", "Quote"]
		});
	');

/********************************************************************************************/
//	Some vars
/********************************************************************************************/
	$_FIELD = $_PARAM['field'];
	$value = $_FIELD->get_value();
	$attrs = $_FIELD->get_attrs();
?>