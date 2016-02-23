$(document).ready(function () {
/*********************************************************************************************
/**	* Multiple
* 	* @author	mvd@hands.agency
**#******************************************************************************************/
	$('.zoning').multipleselect({		
		app:'field',
		theme:'default',
		template:'/zoning.available',
	});

/*********************************************************************************************
/**	* Popup
* 	* @author	mvd@hands.agency
**#******************************************************************************************/
	$('.zoning .selected li .title').popup(
	{
		app: 'field',
		theme: 'default',
		template: 'zoning.config',
		width:'60%',
		handled_app: ''+$(this).parent().find('input').val()+'',
	});
});