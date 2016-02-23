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
//	Some binds scripts & css files
/********************************************************************************************/
	$_APP->bind_css('css/form.css');
	$_APP->bind_script('js/placeholder.js');
?>
<div class="container">
	<div class="block-form form-login">
		<div class="block-header">
			<h1><?= t('S\'identifier') ?></h1>
			<p class="block-descr"><?= t('Veuillez vous identifier pour accéder à votre compte'); ?></p>
		</div>
		<div class="block-content">
			<form action="<?= i('page', 'artisan.login.routine')['url']; ?>" method="post" accept-charset="utf-8" novalidate>
				<fieldset>
					<?= new fieldText('email', array(
						'label' => t('Email'),
						'id' => 'email',
						'placeholder' => t('Email')
					)) ?>
					<?= new fieldPassword('password', array(
						'label' => t('Mot de passe'),
						'id' => 'password',
						'placeholder' => t('Mot de passe')
					)) ?>
					<div class="block-button">
						<a href="<?= i('page', 'loglost')['url'] ?>" class="btn btn-grey btn-small"><?= t('Mot de passe oublié') ?></a>
						<?= new fieldButton('submit', array(
							'value' => t('Se connecter'),
							'class' => 'pull-right'
						)) ?>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>