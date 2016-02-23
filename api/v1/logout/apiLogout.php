<?php
/**
 * Log out humans
 *
 * @author	Sylvain Frigui <sf@hands.agency>
 * @access	public
 * @link	http://grandcentral.fr
 */
class apiLogout extends _apis
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
 * Log out a human
 * @access	public
 * @arg	login	array	A possible text (test=true)
 */
	public function get()
	{
	//	Log the user out
		if (isset($_SESSION['user']) && $_SESSION['user']->exists())
		{
		//	Logout!
			if (!isset($_GET['test'])) $_SESSION['user']->logout();
			
		//	Status
			$status = 'success';
		}
	//	Credentials are not ok
		else
		{
		//	Status
			$status = 'fail';
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