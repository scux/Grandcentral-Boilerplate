<?php
/**
 * Handle media files
 *
 * @author	Sylvain Frigui <sf@hands.agency>
 * @access	public
 * @link	http://grandcentral.fr
 */
class apiMedia extends _apis
{
	public $nameLen = 32;
/**
 * Request
 * @param string The method
 * @access	public
 */
	public function request($request)
	{
	//	Execute method depending of request
		switch ($request)
		{
			case 'get':
			//	Map the hash
				$this->map_hash(array('file', 'width', 'height'));
			//	Call
				$this->$request($this->param['file'], $this->param['width'], $this->param['height']);
				break;
			case 'post':
			//	Call
				$this->$request();
				break;
		}
	}
/**
 * Get a media or a thumbnail
 *
 * @param string The filename of the media to get (4f95b934f4c9fdf3.jpg)
 * @param	int  The optional width for image resize in px (400)
 * @param	int  The optional height for image resize in px
 * @access	public
 */
	public function get($file, $width = null, $height = null)
	{
	//	Some vars
		$width = (isset($width)) ? (int) $width : $width = null;
		$height = (isset($height)) ? (int) $height : $height = null;
		
	//	Add the folder to the url
		$this->param['url'] = '/image/'.$file;
		
	//	Tumbnail the F* out of the image
		$original = media($this->param['url']);
		$originalUrl = $original->get_url();
		$thumbnail = $original->thumbnail($width, $height);
		$thumbnailUrl = $thumbnail->get_url();

	//	Meta
		$this->result['meta'] = array(
			'status' => 'success',
			'width' => $width,
			'height' => $height,
		);
	//	Data
		$this->result['data'] = array(
			'original' => $originalUrl,
			'thumbnail' => $thumbnailUrl
		);
	}
/**
 * Post a media
 *
 * @data	data	array	An associated array of files under the $_FILES format OR a single cell called base64 and containing a base 64 encoded media
 * @access	public
 */
	public function post()
	{
	//	Some vars
		$mediaApp = app('media');
		$mediaRoot = $mediaApp->get_templateroot();
		$mediaUrl = $mediaApp->get_templateurl();
		$path['image'] = '/image';
		$path['video'] = '/video';
	
	//	TEST	
	//	$_POST['base64'] = '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';
	
	//	We have some medias in base64 strings
		if (isset($_POST['base64']) && !empty($_POST['base64']))
		{	
		//	Decode
			$imgdata = base64_decode($_POST['base64']);
			
		//	Build a random name
			$name = $this->getRandomname();
		//	Get mime (type and extention)
			$f = finfo_open();
			$mime_type = finfo_buffer($f, $imgdata, FILEINFO_MIME_TYPE);
			list($type, $ext) = explode('/', $mime_type);
			$type = 'image'; // $file['type'];
			
		//	Complete path
			$filePath = $path[$type].'/'.$name.'.'.$ext;
			$fileRoot = $mediaRoot.$filePath;
			$fileUrl = SITE_URL.$mediaUrl.$path[$type].'/'.$name.'.'.$ext;
			
		//	Write file
			if (file_put_contents($fileRoot, $imgdata))
			{
			//	Meta
				$this->result['meta'] = array(
					'status' => 'success',
				);
			//	Data
				$this->result['data'][$name.'.'.$ext] = array(
					'path' => $filePath,
					'root' => $fileRoot,
					'url' => $fileUrl,
					'file' => $name.$ext,
				);
			}
		//	Can't move
			else
			{
			//	Meta
				$this->result['meta'] = array(
					'status' => 'fail',
					'msg' => 'Sorry, can\'t upload this base 64 file',
				);
			}
		}
	
	//	Loop through files
		if (isset($_FILES))
		{
			foreach($_FILES as $id => $file)
			{
			//	Build a random name
				$name = $this->getRandomname();
				$ext = pathinfo($file['name'], PATHINFO_EXTENSION);
				$type = 'image'; // $file['type'];
				
			//	Complete path
				$filePath = $path[$type].'/'.$name.'.'.$ext;
				$fileRoot = $mediaRoot.'/'.$filePath;
				$fileUrl = SITE_URL.$mediaUrl.$path[$type].'/'.$name.'.'.$ext;
				
			//	Move file
				if (move_uploaded_file($file['tmp_name'], $fileRoot))
				{
				//	Meta
					$this->result['meta'] = array(
						'status' => 'success',
					);
				//	Data
					$this->result['data'][$file['name']] = array(
						'path' => $filePath,
						'root' => $fileRoot,
						'url' => $fileUrl,
						'file' => $name.$ext,
					);
				}
			//	Can't move
				else
				{
				//	Meta
					$this->result['meta'] = array(
						'status' => 'fail',
						'msg' => 'Sorry, can\'t upload this file',
					);
				}
			}
		}
	}

/**
 * Build a random name
 *
 * @access	public
 */
	public function getRandomname()
	{
		$chars = "abcdefghijklmnopqrstuvwxyz0123456789";
		$size = strlen( $chars );
		$str = null;
		for( $i = 0; $i < $this->nameLen; $i++ ) $str .= $chars[ rand( 0, $size - 1 ) ];
		return $str;
	}
}
?>