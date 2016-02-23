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
 * @copyright	Copyright ©2014 Eranos
 * @license		http://www.cafecentral.fr/fr/licences GNU Public License
 * @access		public
 * @link		http://www.cafecentral.fr/fr/wiki
 */	
/********************************************************************************************/
//	Some vars
/********************************************************************************************/
	$dir = app('media')->get_templateurl().'/favicon';
	$handledItem = (defined('item')) ? i(item, current) : i('page', current);
//	Find the og image
	$ogImage = null;
	switch (true)
	{
	//	Books: show mockup
		case isset($handledItem['mockupcover'][0]) && !$handledItem['mockupcover']->is_empty():
			$ogImage = $handledItem['mockupcover'][0]['url'];
			break;
	//	Events + collections : show cover
		case isset($handledItem['cover'][0]) && !$handledItem['cover']->is_empty():
			$ogImage = $handledItem['cover'][0]['url'];
			break;
		
		default:
			$ogImage = '/favicon/favicon-96x96.png';
			break;
	}
	$ogImage = media($ogImage)->get_url();
?>