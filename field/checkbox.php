<?php
/**
 * Description: This is the description of the document.
 * You can add as many lines as you want.
 * Remember you're not coding for yourself. The world needs your doc.
 * Example usage:
 * <pre>
 * if (Example_Class::example()) {
 *    echo "I am an example.";
 * }
 * </pre>
 * 
 * @package		The package
 * @author		Michaël V. Dandrieux <mvd@hands.agency>
 * @author		Sylvain Frigui <sf@cafecentral.fr>
 * @copyright	Copyright © 2004-2013, Café Central
 * @license		http://www.cafecentral.fr/fr/licences GNU Public License
 * @access		public
 * @link		http://www.cafecentral.fr/fr/wiki
 */
/********************************************************************************************/
//	Some vars
/********************************************************************************************/	
	$li = '';
	$i = 0;
	$item = null;

/********************************************************************************************/
//	Override prepare values ot get more from the object
/********************************************************************************************/
/**
 * Prépare la liste des valeurs de type bunch
 * 
 * @param	string	Refine the values using a string
 * @return	array 	la liste des valeurs traitées sous forme de tableau
 * @access	protected
 */
	if (!function_exists('prepare_values_bunch_typology'))
	{
		function prepare_values_bunch_typology($vals, $refine = null)
		{
		//	Some vars
			$values = '';
		//	création du bunch
			$env = (env == 'admin' && !empty($_SESSION['pref']['handled_env'])) ? $_SESSION['pref']['handled_env'] : env;
			$bunch = new bunch(null, null, $env);
		//	on formate les données entrées
			switch (true)
			{
				case is_string($vals):
					$vals = array(array('item' => $vals));
					break;
				case isset($vals['item']):
					$tmp = $vals;
					$vals = null;
					$vals = array($tmp);
					break;
			}
		//	analyse des données reçues
			$countTable = 0;
			foreach ($vals as $value)
			{
				$table = $value['item'];
				$params = (isset($value['param'])) ? $value['param'] : null;
			//	Default order
				$params['order()'] = 'elementid DESC, family DESC';
			//	Get all status
				$params['status'] = array('live', 'asleep');
			//	Refine ?
				if (isset($refine)) $params['title'] = '%'.$refine.'%';
				// print'<pre>';print_r($value);print'</pre>';
				$bunch->get($table, $params);
				$countTable++;
			}
		//	création de la liste des valeurs
			foreach ($bunch as $value)
			{
				$table = $value->get_table();
			//	Prepare id, title and descr for values
				// $id = $table.'_'.$value['id'];
				$title = (isset($value['title']) && !empty($value['title'])) ? $value['title'] : $value['key'];
				$descr = (isset($value['descr']) && !empty($value['descr'])) ? $value['descr'] : null;
				$color = (isset($value['color']) && !empty($value['color'])) ? $value['color'] : null;
				$icon = (isset($value['icon']) && !empty($value['icon'])) ? $value['icon'] : null;
			//	BAM
				// if ($countTable > 1) $values[$table][] = array('id' => $value->get_nickname(), 'title' => $title, 'descr' => $descr);
				// else 
				$data = array('id' => $value->get_nickname(), 'title' => $title, 'descr' => $descr, 'color' => $color, 'icon' => $icon);
				if ($countTable > 1) $data['item'] = $table;
				$values[] = $data;
			}
			return $values;
		}
	}

/********************************************************************************************/
//	Build the options
/********************************************************************************************/
	$_FIELD = $_PARAM['field'];
//	$values = $_FIELD->prepare_values();
	$values = prepare_values_bunch_typology($_FIELD->get_values());
//	print'<pre>';print_r($values);print'</pre>';
	// TODO : colgroup

	if (is_array($values))
	{
		foreach ($values as $key => $option)
		{
			//	entête si plusieurs items
			if (isset($option['item']) && $option['item'] != $item)
			{
				$li .= '<li><h4>'.$option['item'].'</h4></li>';
				$option['item'] = $item;
			}
		//	checked
			$checked = (in_array($option['id'], (array) $_FIELD->get_value())) ? ' checked="checked"' : null;
			$class = ($checked) ? 'checked' : null;
		//	descr
			$descr = (isset($option['descr']) && !empty($option['descr'])) ? '<span class="descr">'.$option['descr'].'</span>' : null;
		//	Color
			$color = (isset($option['color']) && !empty($option['color'])) ? $option['color'] : null;
		//	<li>
			$li .= '
			<li class="'.$class.'" style="background-color:#'.$color.'">
				<input type="checkbox" value="'.$option['id'].'" name="'.$_FIELD->get_name().'[]" id="ID'.$_FIELD->get_name().$i.'"'.$checked.'/>
				<label for="ID'.$_FIELD->get_name().$i.'">
					<span class="title">'.$option['title'].'</span>
					'.$descr.'
				</label>
			</li>';
			$i++;
		}
	}
?>