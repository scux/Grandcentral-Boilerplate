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
 * @copyright	Copyright ©2015 Hands Agency
 * @license		http://www.cafecentral.fr/fr/licences GNU Public License
 * @access		public
 * @link		http://www.cafecentral.fr/fr/wiki
 */
/********************************************************************************************/
//	Some apps
/********************************************************************************************/
	load(
		'jquery',
		'jquery.ui',
		'bootstrap',
		'lazyload',
		'minify-master'
	);

/********************************************************************************************/
//	Some vars
/********************************************************************************************/
	$_PAGE = $_APP->param['page'];

/********************************************************************************************/
//	Some binds
/********************************************************************************************/
//	Script
	$_APP->bind_script('master/js/master.js');
	$_APP->bind_script('master/js/snap.svg-min.js');
//	css
	$_APP->bind_css('master/css/master.css');
	$_APP->bind_css('master/font/icomoon/style.css');

//	Reroot get in ajax & constants
	$_APP->bind_code("script", "
	//	Some vars
	//	var _GET = ".json_encode($_GET).";
		var _GET = {};
	//	Some consts
		var ITEM = $('meta[property=\"gc:item\"]').attr('content');
		var SITE_URL = '".SITE_URL."';
		var ADMIN_URL = '".ADMIN_URL."';
		var ENV = $('body').data('env');
	");

/********************************************************************************************/
//	Bind sections here
/********************************************************************************************/
//	afficher toutes les sections liées
	$_PAGE->bind_section();

/********************************************************************************************/
//	Some snippets
/********************************************************************************************/
	$_APP->bind_snippet('meta', 'master/snippet/meta/meta');

	$minifier = new MinifyMaster();
?>
