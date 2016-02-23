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
//	Vars
/********************************************************************************************/
	$_FIELD = $_PARAM['field'];
	
/********************************************************************************************/
//	Bind
/********************************************************************************************/
	$_APP->bind_file('css', 'css/master.css');
	$_APP->bind_file('script', 'js/master.js');
	
/********************************************************************************************/
//	construction du champ app
/********************************************************************************************/
	$page = i('page');
	$p = array(
		'label' => 'type : ',
		'values' => array_keys($page->get_authorised_mime()),
		'valuestype' => 'array',
		'value' => 'html'
	);
	$field = new fieldSelect($_FIELD->get_name().'[type]', $p);
	
/********************************************************************************************/
//	Préchargement auto
/********************************************************************************************/
	$value = $_FIELD->get_value();

//	type
	if (isset($value['type']) && !empty($value['type'])) $field->set_value($value['type']);
//	template
	$template = (isset($value['key']) & !empty($value['key'])) ? $value['key'] : null;
?>