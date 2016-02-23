<?php
/**
 * Description: This is the description of the document.
 * You can add as many lines as you want.
 * Remember you're not coding for yourself. The world needs your doc.
 * Example usage:
 * <pre>
 * if (Example_Class::example() {
 *    echo "I am an example.";
 * }
 * </pre>
 * 
 * @package		The package
 * @author		Michaël V. Dandrieux <mvd@cafecentral.fr>
 * @author		Sylvain Frigui <sf@cafecentral.fr>
 * @copyright	Copyright © 2004-2012, Café Central
 * @license		http://www.cafecentral.fr/fr/licences GNU Public License
 * @access		public
 * @link		http://www.cafecentral.fr/fr/wiki
 */
/********************************************************************************************/
//	DEBUG
/********************************************************************************************/
	// print'<pre>';print_r($_POST);print'</pre>';

/********************************************************************************************/
//	Go
/********************************************************************************************/
	$response = array('code' => 'fail');
	if (!empty($_POST['login']['login']) && !empty($_POST['login']['password']))
	{
    //  Fetch user
        $user = i('human', $_POST['login']['login']);

    //  Sucess
        if ($user->is_valid_password($_POST['login']['password']))
		{
        //  Log me
            $user->login();
        //  Show my face & response
            $profilepic = (isset($user['profilepic']) && !$user['profilepic']->is_empty()) ? $user['profilepic']->unfold()[0]->get_url(true) : null;
            $response = array('code' => 'success', 'data' => array('profilepic' => $profilepic));
        }
    }
?>
<?=json_encode($response)?>