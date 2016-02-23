/*********************************************************************************************
/**	* Form validation plugin
 	* @author	@mvdandrieux
**#******************************************************************************************/
(function($)
{	
//	Here we go!
	$.multipleselect = function(element, options, callbacks)
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
		//	Shortcut
			var $available = $element.find('.available');
		//	Hacky var to put up with 'out'
		//	which fires even after receive...
			var received;
			
		//	Ajax parameters
			options.param =
			{
				name:$available.data('name'),
				values:$available.data('values'),
				valuestype:$available.data('valuestype'),
			};
			
		//	Make the selected sortable
			$element.find('.selected ol').sortable(
			{
				items:'li',
				axis:'y',
			/*	containment: 'parent', */
				revert: 100,
				placeholder:'placeholder',
			//	tolerance:'pointer',
				over:function(event, ui)
				{
					received = false;
				//	$(this).addClass('ui-sortable-hover');
				},
				out:function(event, ui)
				{
				//	$(this).removeClass('ui-sortable-hover');
				},
				receive:function(event, ui)
				{
				//	Test if not present
					li = ui.item;
					value = li.data('item');
					count = $(this).find('input:not(:disabled)[value="'+value+'"]').length;

				//	Refuse if item already exists
					if (count > 0)
					{
					//	Hacky way to destroy the new forbidden element
						$(this).data()['ui-sortable']['currentItem'].remove();
					//	And shake your head to say No, No, No...
						$(this).parent().effect('shake', {times:2}, 300);
					}
				//	Accept otherwise
					else
					{
					//	Enable the input
						$input = $(this).data()['ui-sortable']['currentItem'].find('input');
						$input.prop('disabled', false);
						received = true;
						
					//	Execute callback (make sure the callback is a function)
					//	if ((typeof(callbacks.receive) != 'undefined') && (typeof(callbacks.receive) == "function")) callbacks.receive.call(this, li);
					}
		    	}
			});
			
		//	Load the available choices
			plugin.loadChoices($element);

		//	Delete a selected
			$element.on('click', '.selected li .delete', function()
			{
				$(this).parent().hide('slide', { direction: "down" }, 100, function()
				{
					$(this).remove();

				});
			});
			
		//	Refine on the available choices
			$element.find('.refine input[type="search"]').searchasyoutype(
			{	
				app:'field',
				template:'/multipleselect.available',
				param:options.param,
				target:$element.find('ul.choices'),
			},
			{
			//	Callback
				done:function()
				{
					field = $(this).closest('li[data-type]');
					plugin.resort(field);
				},
			});
		}
		
	//	Load the available choices
		plugin.loadChoices = function(field)
		{
			field.find('.available ul.choices').ajx(options,
			{
			//	Callback
				done:function()
				{
					field = $(this).closest('li[data-type]');
					plugin.resort(field);
				},
			});
		}
		
	
	//	Make the available choices draggable and connected to the sortable
		plugin.resort = function(field)
		{
			field.find('.available ul li').draggable(
			{
				connectToSortable:field.find('.selected ol'),
				helper:'clone',
				revert: 'invalid',
				cursorAt: { left: 50 },
				revertDuration: 100,
				start:function(event, ui)
				{
				//	Make the helper look like the source
					ui.helper.css(
					{
						height:$(this).outerHeight(),
					});
				//	Hide dragged available
					$(this).hide();
				},
				stop:function(event, ui)
				{
				//	Show the available back
					$(this).show();
				},
			});
			
		//	Allow drag on slick slides
			$('*[draggable!=true]','.slick-track').unbind('dragstart');
			$('.ui-draggable').on("draggable mouseenter mousedown",function(event){
			    event.stopPropagation();
			});
		}
		

	//	Fire up the plugin!
		plugin.init();
	}

//	Add the plugin to the jQuery.fn object
	$.fn.multipleselect = function(options, callbacks)
	{
		return this.each(function()
		{
			if (undefined == $(this).data('multipleselect'))
			{
				var plugin = new $.multipleselect(this, options, callbacks);
				$(this).data('multipleselect', plugin);
			}
		});
	}
})(jQuery);