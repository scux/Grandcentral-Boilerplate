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
//	$_APP->bind_file('css', 'css/zoning.css');
//	$_APP->bind_file('script', 'js/multipleselect.js');

/********************************************************************************************/
//	Make the form
/********************************************************************************************/
//	Get the section
//	list($app, $id) = explode('_', $_POST['handled_app']);
//	$section = i('section', $id);
	
//	Get the app
	$section = i('section', 'live');
	
//	Fetch the section
	$p = array(
		'value' => $section['app'],
	);
	$appField = new field_app('temp', $p);
?>