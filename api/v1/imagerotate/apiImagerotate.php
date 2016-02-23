<?php
/**
 * Rotate an image with a given angle
 *
 * @author	Sylvain Frigui <sf@hands.agency>
 * @access	public
 * @link	http://grandcentral.fr
 */
class apiImagerotate extends _apis
{
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
				$this->map_hash(array('file', 'degrees'));
			//	Call
				$this->$request($this->param['file'], $this->param['degrees']);
				break;
		}
	}
/**
 * Rotate an image with a given angle
 *
 * @param string The filename of the media to get (4f95b934f4c9fdf3.jpg)
 * @param	int  Rotation angle, in degrees. The rotation angle is interpreted as the number of degrees to rotate the image clockwise (90)
 * @access	public
 */
	public function get($file, $degrees)
	{
	//	Some vars
		$mediaApp = app('media');
		$mediaRoot = $mediaApp->get_templateroot();
		$mediaUrl = $mediaApp->get_templateurl();
		$path['image'] = '/image';
		
	//	Chargement
		$source = imagecreatefromjpeg($mediaRoot.$path['image'].'/'.$file);
	//	Rotation
		$rotate = imagerotate($source, 360-$degrees, 0);
		
		imagejpeg($rotate, $mediaRoot.$path['image'].'/'.$file);

	//	Libération de la mémoire
		imagedestroy($source);
		imagedestroy($rotate);

	//	Meta
		$this->result['meta'] = array(
			'status' => 'success',
			'degrees' => $degrees,
		);
	//	Data
		$this->result['data'] = array(
			'url' => $mediaUrl.$path['image'].'/'.$file,
		);
	}
}
?>