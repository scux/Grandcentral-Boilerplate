<?php
/**
 * Search the content of a map
 *
 * @author	Sylvain Frigui <sf@hands.agency>
 * @access	public
 * @link	http://grandcentral.fr
 */
class apiSearch extends _apis
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
				$this->map_hash(array('map', 'limit'));
			//	Call
				$this->$request($this->param['map'], $this->param['limit']);
				break;
		}
	}
/**
 * Get a search result
 *
 * @param int	The map you want to search on (1)
 * @param int	The optional limit of results you want to get (50)
 * @arg	q	string	The compulsory query string (q=los angeles)
 * @arg	field	string	A comma separated list of fields for filtering the returned data (field=id,title,lat,lng)
 * @access	public
 */
	public function get($map, $limit = 50)
	{
	//	Some vars
		$q = (isset($_GET['q'])) ? $_GET['q'] : trigger_error('Sorry, you need and query _GET[q] here', E_USER_ERROR);
		$tables = array('human', 'cast', 'brand', 'public', 'typology', 'analysis', 'region');
		
	//	Transform commas into array
		if (isset($_GET['field']))
		{
			$_GET['field'] = explode(',', $_GET['field']);
		}
	
	//	Our Query
		$param = array(
			'map' => $map,
		);
	//	Fetch results
		$search = new searchFulltext('public');
		$data = $search->search($q, $tables, $limit, $param);
		
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
				'data' => $tmp,
			);
		}
	
	//	Meta
		$this->result['meta'] = array(
			'status' => 'success',
			'q' => $q,
		);
	//	Data
		$this->result['data'] = $d;
	}
}
?>