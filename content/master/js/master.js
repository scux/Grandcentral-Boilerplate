/*********************************************************************************************
/**	* Grand Central ajax call (everything goes in POST, but current GET is rerooted)
 	* @author	mvd@hands.agency
**#******************************************************************************************/
(function($)
{	
//	Here we go!
	$.ajx = function(options, callbacks, element)
	{
	//	Use "plugin" to reference the current instance of the object
		var plugin = this;
	//	this will hold the merged default, and user-provided options
		plugin.settings = {}
		var $element = $(element), // reference to the jQuery version of DOM element
		element = element;	// reference to the actual DOM element
		
	//	Plugin's variables
		var vars = {
		}

	//	The "constructor"
		plugin.init = function()
		{
		//	the plugin's final properties are the merged default and user-provided options (if any)
			plugin.settings = $.extend({}, vars, options);
			
		//	Some vars
			mime = (typeof(plugin.settings.mime) != 'undefined') ? plugin.settings.mime : 'html';
			async = (typeof(plugin.settings.async) != 'undefined') ? plugin.settings.async : true;
			url = SITE_URL+'/ajax.'+mime;
			
		//	Reroute the _GET (currently declared in the master)
			if (typeof(_GET) != 'undefined') plugin.settings._GET = _GET;

		//	Call
			$.ajax(
			{
				type:'POST',
				url:url,
				async:async,
				context:this,
				data:plugin.settings,
			})
			.done(function(html)
			{
			//	Return HTML
				if ($element.length) $element.html(html);
			//	Execute callback (make sure the callback is a function)
				if ((typeof(callbacks) != 'undefined') && (typeof(callbacks['done']) == "function")) callbacks['done'].call($element, html);	
			})
			.fail(function( jqXHR, textStatus )
			{
			//	console.log( "Request failed: " + textStatus );
				console.log( "Request failed: " + jqXHR.responseText );
			});
			
		}

	//	Fire up the plugin!
		plugin.init();
	}

//	Add the plugin to the jQuery.fn object
	$.fn.ajx = function(options, callbacks)
	{
		return this.each(function()
		{
		//	if (undefined == $(this).data('ajx'))
		//	{
				var plugin = new $.ajx(options, callbacks, this);
				$(this).data('ajx', plugin);
		//	}
		});
	}
	
/*********************************************************************************************
/**	* Lazyload
 	* @author	@mvdandrieux
**#******************************************************************************************/
//	Get rid of the original image in javascript (leave it in the DOM for SEO)
	$('[data-original]').attr('src', '').css('background-image', '');
//	Lasyload !
    $('[data-original]').lazyload(
	{
    	effect : "fadeIn"
	});
})( jQuery );