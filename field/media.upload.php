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
 * @author		Michaël V. Dandrieux <mvd@hands.agency>
 * @author		Sylvain Frigui <sf@cafecentral.fr>
 * @copyright	Copyright © 2004-2013, Café Central
 * @license		http://www.cafecentral.fr/fr/licences GNU Public License
 * @access		public
 * @link		http://www.cafecentral.fr/fr/wiki
 */
/********************************************************************************************/
//	Upload files
/********************************************************************************************/
//	Build path
	$app = app('media');
	$root = $app->get_templateroot('site').'/';
	$url = $app->get_templateurl('site').'/';
	
//	Add user folder
	if (isset($_POST['folder']))
	{
		$root = str_replace('//', '/', $root.$_POST['folder'].'/');
		$url = str_replace('//', '/', $url.$_POST['folder'].'/');
	}

//	Loop through received files
	$return = array();
	foreach($_FILES as $id => $file)
	{
	//	Random name
		$ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
		$name = substr(md5(rand()), 0, 16);
	//	Complete path
		$fileRoot = $root.$name.'.'.$ext;
		$fileUrl = $url.$name.'.'.$ext;
	//	Move file
		if (move_uploaded_file($file['tmp_name'], $fileRoot)) $return[$file['name']] = array('name' => $name.'.'.$ext, 'url' => SITE_URL.$fileUrl);
		else $return[$file['name']] = 'ko';
	}
?>