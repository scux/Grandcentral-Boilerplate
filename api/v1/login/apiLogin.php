<?php
/**
 * Log in humans
 *
 * @author	Sylvain Frigui <sf@hands.agency>
 * @access	public
 * @link	http://grandcentral.fr
 */
class apiLogin extends _apis
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
 * Login a human
 * @arg	login	array	The array of login and password (login[login]=test&login[password]=123)
 * @access	public
 */
	public function get()
	{
	//	Fetch human
		$human = i('human', $_GET['login']['login']);
	
	//	User exists and credentials are ok
		if ($human->is_valid_password($_GET['login']['password']))
		{
		//	Status
			$status = 'success';
		//	Data: send back the human
			foreach ($human as $key => $value)
			{
				$data[$key] = $value->get();
			}
			
		//	Login
			$human->login();
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