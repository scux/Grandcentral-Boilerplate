<?php
	print'<pre style="width:700px;">';print_r($_POST);print'</pre>';
	
	
	$value = isset($_POST['test']) ? $_POST['test'] : null;
	$f = new fieldSirtrevor2('test', array('value' => $value));
	$a = new attrSirtrevor2($value);
	
	echo '<form method="post">'.$f.'<input type="submit" value="submit" id=""></form>';
	echo $a;
?>