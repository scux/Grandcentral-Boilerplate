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
	$filemaxsize = str_replace('M', '', ini_get('upload_max_filesize'));
	
/********************************************************************************************/
//	Bind
/********************************************************************************************/
	$_APP->bind_file('css', 'css/media.css');
	$_APP->bind_file('script', 'js/media.js');
	$_APP->bind_code('script', '
		$(document).ready(function()
		{
			$("[data-type=\'media\']").upload(
			{
				app:"field",
				template:"media.upload",
				folder:"/image",
				maxsize:"'.$filemaxsize.'",
				acceptedTypes:
				[
					"image/png",
					"image/jpeg",
					"image/gif",
					"video/quicktime",
					"video/mp4",
				],
			});
		});
	');
	
/********************************************************************************************/
//	Some vars
/********************************************************************************************/
//	The data from the DB
	$data = '';
//	The html templates for jQuery
	$template = '';
//	A counter
	$count = 0;

/********************************************************************************************/
//	Print the data from the Database
/********************************************************************************************/
	$values = $_FIELD->get_value();
	
	foreach ((array) $values as $key => $value)
	{
	//	Fetch media
		$media = media($value['url']);
		$path = mb_substr($media->get_root(), mb_strpos($media->get_root(), '/media/') + 7); /* TODO Make a method out of this*/
		$title = (isset($value['title'])) ? $value['title'] : null;
		$data .= '
		<li>
			<button class="delete"></button>
			<a>
				<span class="preview">'.$media->thumbnail(120, null).'</span>
				<span class="info">'.$media->get_key().' • '.strtoupper($media->get_extension()).' • '.$media->get_size().'</span>
			</a>
			<input type="hidden" name="'.$_FIELD->get_name().'['.$count.'][url]" value="'.$path.'" />
			<textarea name="'.$_FIELD->get_name().'['.$count.'][title]">'.$title.'</textarea>
		</li>';
		$count++;
	}
	
/********************************************************************************************/
//	Now we can build the templates used when creating new fields
/********************************************************************************************/
	$template = '
	<li style="display:none;">
		<button class="delete"></button>
		<a>
			<span class="preview"></span>
			<span class="info"></span>
		</a>
		<input type="hidden" name="'.$_FIELD->get_name().'[][url]" value="" disabled="disabled" />
		<textarea name="'.$_FIELD->get_name().'[][title]" disabled="disabled" placeholder="Add a legend"></textarea>
	</li>';
?>