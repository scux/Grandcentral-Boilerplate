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
 * @copyright	Copyright © 2004-2012, Café Central
 * @license		http://www.cafecentral.fr/fr/licences GNU Public License
 * @access		public
 * @link		http://www.cafecentral.fr/fr/wiki
 */

/********************************************************************************************/
//	Routine
/********************************************************************************************/
	$_FIELD = $_PARAM['field'];
	
	if (!function_exists('crymeahidden'))
	{
		function crymeahidden($name, $value, $return = array())
		{
			if (!is_array($value))
			{
				$return[$name] = $value;
			}
			else
			{
				foreach ($value as $k => $v)
				{
					$return = crymeahidden($name.'['.$k.']', $v, $return);
				}
			}
			return $return;
		}
	}
	
	$hiddens = crymeahidden($_FIELD->get_name(), $_FIELD->get_value());
?>