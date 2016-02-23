<?php
/**
 * Get login status
 *
 * @author	Sylvain Frigui <sf@hands.agency>
 * @access	public
 * @link	http://grandcentral.fr
 */
class apiLoginstatus extends _apis
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
			//	Call
				$this->$request();
				break;
		}
	}
/**
 * Gets the login status of a human
 * @access	public
 */
	public function get()
	{
	
	
	//	User exists and credentials are ok
		if ($_SESSION['user']->is_logged())
		{
			$status = 'connected';
		//	Data: send back the human
			foreach ($_SESSION['user'] as $key => $value)
			{
				$data[$key] = $value->get();
			}
		}
	//	Credentials are not ok
		else
		{
			$status = 'unknown';
		}
		
	//	Meta
		$this->result['meta'] = array(
			'status' => $status,
		);
	//	Data
		if (isset($data)) $this->result['data'] = $data;
	}
}
?>