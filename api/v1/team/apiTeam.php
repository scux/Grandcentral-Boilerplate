<?php
/**
 * Handle items
 *
 * @author	Sylvain Frigui <sf@hands.agency>
 * @access	public
 * @link	http://grandcentral.fr
 */
class apiTeam extends _apis
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
				$this->map_hash(array('map'));
			//	Call
				$this->$request($this->param['map']);
				break;
		}
	}
/**
 * Get the team of a map
 * @param int	The current map (1)
 * @arg	field	string	A comma separated list of fields for filtering the returned data (field=id,key,title)
 * @access	public
 */
	public function get($map)
	{
	//	Some vars
		$d = array();
	
	//	Transform commas into array
		if (isset($_GET['field']))
		{
			$_GET['field'] = explode(',', $_GET['field']);
		}
		
	//	Fetch the humans
		$fetch = new fetch($_SESSION['user']);
		$data = $fetch->get_humans(array('map' => $map));
		$data->order('title');

	//	Format data as a uniform array
		foreach ($data as $i)
		{
		//	Open a tmp array for the item
			$tmp = array();
			
		//	If we filter the fields
			if (isset($_GET['field']))
			{
				foreach ($_GET['field'] as $field)
				{
					if (isset($i[$field])) $tmp[$field] = $i[$field]->get();
				}
			}
		//	Otherwise, store everything
			else
			{
				foreach ($i as $key => $value)
				{
					$tmp[$key] = $value->get();
				}
			}
		//	Add to the array
			$d[] = $tmp;
		}
		
	//	Meta
		$this->result['meta'] = array(
			'status' => 'success',
			'count' => $data->count,
		);
	//	Data
		$this->result['data'] = $d;
	}
}
?>