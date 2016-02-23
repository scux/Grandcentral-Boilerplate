<?php
/**
 * Build a digest of all user's data
 *
 * @author	Sylvain Frigui <sf@hands.agency>
 * @access	public
 * @link	http://grandcentral.fr
 */
class apiDigest extends _apis
{
	public $tables = array('human', 'typology', 'analysis', 'brand', 'public', 'region', 'cast');
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
				$this->map_hash(array('map', 'limit'));
			//	Call
				$this->$request($this->param['map'], $this->param['limit']);
				break;
		}
	}
/**
 * Get a digest
 *
 * @param int	The map you want to search on (1)
 * @param int	The optional limit of results you want to get (50)
 * @arg	field	string	A comma separated list of fields for filtering the returned data (field=id,title,lat,lng)
 * @access	public
 */
	public function get($map, $limit = 50)
	{
	//	Some vars
		$d = array();
		$limitDivided = ceil($limit / count($this->tables));
		
	//	Transform commas into array
		if (isset($_GET['field']))
		{
			$_GET['field'] = explode(',', $_GET['field']);
		}
	
	//	Fetch results
		$data = new bunch();
		foreach ($this->tables as $table)
		{
			$data->get($table, array
			(
				'created' => '> '.date('Y-m-d', strtotime('60 days ago')),
				'map' => 'map_'.$map,
				'limit()' => $limitDivided,
				'status' => 'live',
			));
		}
		
	//	Format data as a uniform array
		foreach ($data as $item)
		{
		//	Open a tmp array for the item
			$tmp = array();
		//	If we filter the fields
			if (isset($_GET['field']))
			{
				foreach ($_GET['field'] as $field)
				{
					if (isset($item[$field])) $tmp[$field] = $item[$field]->get();
				}
			}
		//	Otherwise, store everything
			else
			{
				foreach ($item as $key => $value)
				{
					$tmp[$key] = $value->get();
				}
			}
		//	Add to the array
			$d[] = array(
				'item' => $item->get_table(),
				'authority' => $this::get_authority($item, $this->tables),
				'data' => $tmp
			);
		}
		
	//	Order by aut
		usort($d, function($a, $b)
		{
		    return $b['authority'] - $a['authority'];
		});
	
	//	Meta
		$this->result['meta'] = array(
			'status' => 'success',
		);
	//	Data
		$this->result['data'] = $d;
	}
	
/**
 * Get the authority of an item in the digest
 * @access	public
 */
	private static function get_authority($item, $tables)
	{
	//	Som vars
		$auth = 0;
		$scale = array(
		//	Age
			'age' => array(
				'updatedthismonth' => 5,
				'updatedthisday' => 10,
				'updatedthishour' => 10,
				'updatedthisminute' => 15,
				'updatedstillyoung' => 15,
				'createdthismonth' => 10,
				'createdthisday' => 30,
				'createdthishour' => 30,
				'createdthisminute' => 30,
				'createdstillyoung' => 30,
			),
		//	Amount of medias
			'media' => array(
				'onemedia' => 5,
			),
		//	Place in the list of items
			'priority' => array(
				'onepriority' => 3,
			),
		//	Amount of people working on the item	
			/* Later */
		//	Mine or not mine
			/* Later */
		);
		
	//	Age
		$age = $scale['age'];
		$today   = new DateTime('today');
		$dates = array(
			'updated' => new DateTime($item['updated']->get()),
			'created' => new DateTime($item['created']->get()),
		);
		foreach ($dates as $key => $date)
		{
			if ($date->format('Y-m') == $today->format('Y-m')) $auth += $age[$key.'thismonth'];
			if ($date->format('Y-m-d') == $today->format('Y-m-d')) $auth += $age[$key.'thisday'];
			if ($date->format('Y-m-d h') == $today->format('Y-m-d h')) $auth += $age[$key.'thishour'];
			if ($date->format('Y-m-d h:i') == $today->format('Y-m-d h:i')) $auth += $age[$key.'thisminute'];
			$diff = $date->diff($today)->days;
			if ($diff <= $age[$key.'stillyoung']) $auth += $age[$key.'stillyoung'] - $diff;
		}
			
	//	Media
		$media = $scale['media'];
		if (isset($item['media']) && !empty($item['media'])) $auth += count($item['media']) * $media['onemedia'];
		
	//	Place
		$priority = $scale['priority'];
		$auth += (count($tables) - array_search($item->get_table(), $tables)) * $priority['onepriority'];
	
		
		return $auth;
	}
}
?>