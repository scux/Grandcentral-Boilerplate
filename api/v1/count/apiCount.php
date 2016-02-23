<?php
/**
 * Count items
 *
 * @author	Sylvain Frigui <sf@hands.agency>
 * @access	public
 * @link	http://grandcentral.fr
 */
class apiCount extends _apis
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
				$this->map_hash(array('item'));
			//	Call
				$this->$request($this->param['item']);
				break;
		}
	}
/**
 * Get the count of some items
 * @param string	The item you want to get (cast)
 * @arg	param	array	An associated array (param[status]=live&amp;param[system]=true)
 * @access	public
 */
	public function get($item)
	{
	//	Some vars
		$d = array();
	
	//	Transform commas into array
		if (isset($_GET['field']))
		{
			$_GET['field'] = explode(',', $_GET['field']);
		}
		
	//	Do we have an id, params or nothing?
		if (isset($_GET['param'])) $p = $_GET['param'];
		else $p = null;

	//	Get one item, or all of the items
		$data = count::get($this->param['item'], $p);

	//	Meta
		$this->result['meta'] = array(
			'status' => 'success',
			'count' => $data,
			'item' => $item,
		);
	}
}
?>