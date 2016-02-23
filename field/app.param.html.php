<ol>
<?php foreach ($fields as $field) : ?>
	<li class="<?= $field->get_type(); ?>">
		<label for="<?= $field->get_name(); ?>"><?= $field->get_label(); ?><span class="help"></span></label>
		<?php $field->set_label(''); ?>
		<div class="wrapper">
			<?php if ($field->get_descr() != null) : ?><div class="help"><?= $field->get_descr(); ?></div><?php endif ?>
			<?= $field; ?>
		</div>
	</li>
<?php endforeach; ?>
</ol>