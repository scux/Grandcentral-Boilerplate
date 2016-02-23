/*********************************************************************************************
/**	* Grand Central ajax call (everything goes in POST, but current GET is rerooted)
 	* @author	mvd@hands.agency
**#******************************************************************************************/
(function($)
{	
//	Here we go!
	$.upload = function(options, callbacks, element)
	{
	//	Use "plugin" to reference the current instance of the object
		var plugin = this;
	//	this will hold the merged default, and user-provided options
		plugin.settings = {}
		var $element = $(element), // reference to the jQuery version of DOM element
		element = element;	// reference to the actual DOM element
	
	//	Plugin's variables
		var vars = {
			tests : {
				filereader: typeof FileReader != 'undefined',
				dnd: 'draggable' in document.createElement('span'),
				mobile : ( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)),
				formdata: !!window.FormData,
				progress: "upload" in new XMLHttpRequest
			}, 
			support : {
				filereader: document.getElementById('filereader'),
				formdata: document.getElementById('formdata'),
				progress: document.getElementById('progress')
			}
		}

	//	The "constructor"
		plugin.init = function()
		{
		//	the plugin's final properties are the merged default and user-provided options (if any)
			plugin.settings = $.extend({}, vars, options);
					
		//	Some vars
			$field = $element;
			$form = $field.closest('form');

			$loading = $field.find('.loading');
			$progress = $loading.find('progress');
			
			plugin.settings.maxsize = plugin.settings.maxsize * 1048576; /* from Mo to octets */
			
			var holder = document.getElementById('holder');
			var fileupload = document.getElementById('upload');
		
			"filereader formdata progress".split(' ').forEach(function (api)
			{
				if (vars.tests[api] === false)
				{
					vars.support[api].className = 'fail';
				}
				else
				{
			 	   // FFS. I could have done el.hidden = true, but IE doesn't support
				    // hidden, so I tried to create a polyfill that would extend the
				    // Element.prototype, but then IE10 doesn't even give me access
				    // to the Element object. Brilliant.
					vars.support[api].className = 'hidden';
				}
			});
		
		//	Run the basic tests & init
			if (vars.tests.dnd && !vars.tests.mobile)
			{ 
				$element.find('.uploadzone').bind(
				{
					dragover:function()
					{
						$element.find('.upload').addClass('ready');
						return false;
					},
					dragend:function()
					{
						$element.find('.upload').removeClass('ready');
						return false;
					},
					dragleave:function()
					{
						$element.find('.upload').removeClass('ready');
						return false;
					},
					drop:function(e)
					{
					//	Hide text and show progressbar
						$element.find('.upload').removeClass('ready');
						$element.find('.uploadzone').find('.placeholder').hide();
						$loading.show();
					
					//	Upload
						e.preventDefault();
						plugin.readfiles(e.originalEvent.dataTransfer.files);
					}
				});
			}
			else
			{
			//	Show fileupload
				holder.className = 'hidden';
				fileupload.className = '';
				fileupload.querySelector('input').onchange = function ()
				{
					plugin.readfiles(this.files);
				};
			}
			
		//	Delete a file
			$element.find('.data').on('click', '.delete', function(e)
			{
				e.preventDefault();
				$(this).closest('li').hide('fast', function(){$(this).remove()});
			});
		}
		
	//	Visually append the uploaded file
		plugin.appendFile = function(file, errorCode)
		{
		//	Some vars
		//	var media = $('<li class="new" data-info="'+file.type+' • '+(file.size ? (file.size/1024|0)+' K' : '')+'"><a href="#"><span class="preview"></span><span class="title">' + file.name + '</span></a></li>');			
			template = $element.find('.template').html();
			var media = $(template);
			
		//	We can upload
			if (vars.tests.filereader === true)
			{
				var reader = new FileReader();
				reader.onload = function (event)
				{
				//	Append and enable
					$element.find('.upload').after(media);
					media.attr('style', '');
					
				//	Upload!
					if (!errorCode)
					{
					//	Enable fields
						media.find('*:disabled').prop('disabled', false);
					//	Save original file name
						media.attr('data-file', file.name);
					//	Make sure the array is well formed (should be out of the loop)
						plugin.reorder();
					}
				//	Something went wrong in the client-side tests
					else
					{
						switch(errorCode)
						{
							case 'filetoolarge':
								media.attr('class', 'error filetoolarge');
								break;
							case 'typenotaccepted':
								media.attr('class', 'error typenotaccepted');
								break;
						}
						media.find('textarea').html(errorCode);
					}
				
				//	Preview
					if (file.type.substr(0, 5) == 'image')
					{
						var preview = new Image();
					//	preview.src = event.target.result;
					//	preview.width = 173; // a fake resize
					}
					if (file.type.substr(0, 5) == 'video')
					{
						var preview = document.createElement('video');
					}
					if (typeof('preview') != undefined) media.find('.preview').html(preview);

				};
				reader.readAsDataURL(file);
			}
		}

	//	Read and upload the files
		plugin.readfiles = function(files)
		{
		//	Create a form data object
			var formData = vars.tests.formdata ? new FormData() : null;
	
		//	Add the ajx params
			formData.append('app', options.app);
			formData.append('template', options.template);
			formData.append('folder', options.folder);
	
		//	Append the files
		    for (var i = 0; i < files.length; i++)
			{
			//	Assume all is fine
				errorCode = null;
			//	Check for size limit
				if (files[i].size > plugin.settings.maxsize) errorCode = 'filetoolarge';
			//	Check for file types
				else if (typeof(plugin.settings.acceptedTypes) == undefined || $.inArray(files[i].type, plugin.settings.acceptedTypes) == -1) errorCode = 'typenotaccepted';
				
			//	OK or KO ?
				if (errorCode) plugin.appendFile(files[i], errorCode);
				else
				{
					if (vars.tests.formdata) formData.append('file-'+[i], files[i]);
					plugin.appendFile(files[i]);
				}
			}
						
		//	Make the bitches sortable
			$element.find('.data').sortable(
			{
				update:function()
				{
					plugin.reorder();
				}
			});

		//	Now post a new XHR request
		    if (vars.tests.formdata)
			{	
		 		var xhr = new XMLHttpRequest();
				api = SITE_URL+'/api.json/v2/media';
				xhr.open('POST', api);
		
			//	Done !
				xhr.onload = function()
				{
					response = JSON.parse(xhr.response);
				//	Debug
					$.each(response.data, function(original, file)
					{
					console.log(file);
					
   					//	Get the preview element in the DOM
						$preview = $element.find('.data').find('[data-file="'+original+'"]');
					//	fill it up
						$preview.find('img').attr('src', file.url);
						
					//	Add file url to the form
						$preview.find('input').val(file.path);
					}); 
				}

				if (vars.tests.progress)
				{
					xhr.upload.onprogress = function (event)
					{
						if (event.lengthComputable)
						{
							var complete = (event.loaded / event.total * 100 | 0);
							$progress.val(complete);
						//	Finished
							if (complete == '100')
							{
							//	Hide text and show progressbar
								$element.find('.uploadzone').find('.placeholder').show();
								$loading.hide();
							}
						}
					}
				}
		
			//	Send !
				xhr.send(formData);
		    }
		}
		
	//	Reorder the array & make sure the array is well formed
		plugin.reorder = function()
		{
			i = 0;
			$element.find('.data').find('li:not(.upload)').each(function()
			{
				$li = $(this);
			//	For each media, keep the fields at the same array level				
				$li.find('[name]').each(function()
				{
				//	regexp, catch all [0-9] or [] in the name of the field
					$(this).attr('name', $(this).attr('name').replace(/\[(\d?)\]/i, '['+i+']'));
				});
				i++;
			});
		}

	//	Fire up the plugin!
		plugin.init();
	}

//	Add the plugin to the jQuery.fn object
	$.fn.upload = function(options, callbacks)
	{
		return this.each(function()
		{
			if (undefined == $(this).data('upload'))
			{
				var plugin = new $.upload(options, callbacks, this);
				$(this).data('upload', plugin);
			}
		});
	}
})( jQuery );