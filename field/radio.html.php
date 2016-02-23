<label>
	<span><?= $_FIELD->get_label(); ?></span>
	<span class="help"></span>
</label>
<div class="wrapper">
	<?php if ($_FIELD->get_descr() != null) : ?><div class="help"><?= $_FIELD->get_descr(); ?></div><?php endif ?>
	<ol class="field">
		<?= $li; ?>
	</ol>
</div>