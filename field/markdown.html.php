<label for="<?= $_FIELD->get_name(); ?>">
	<?= $_FIELD->get_label(); ?>
	<span class="help"></span>
</label>
<div class="wrapper">
	<?php if ($_FIELD->get_descr() != null) : ?><div class="help"><?= $_FIELD->get_descr(); ?></div><?php endif ?>
	<span class="field">
			
		<p>Implement http://hallojs.org/demo/markdown/</p>
	
		<textarea <?=$_FIELD->get_attrs();?>><?=$_FIELD->get_cleaned_value();?></textarea>
		
	</span>
</div>