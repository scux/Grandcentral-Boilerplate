<label for="<?= $_FIELD->get_name(); ?>">
	<?= $_FIELD->get_label(); ?>
	<span class="help"></span>
</label>
<div class="wrapper">
	<?php if ($_FIELD->get_descr() != null) : ?><div class="help"><?= $_FIELD->get_descr(); ?></div><?php endif ?>
	<div class="field">
		
		<div class="nodata" <?= $hideNodata ?>>Add an attribute to store more data about an item. For instance, store a description or a quantity.</div>
		<ol class="data"><?= $data; ?></ol>
		<ul class="add"><?= $addbuttons; ?></ul>

		<pre class="template">
			<?php foreach ($template as $key => $html): ?>
			<div class="<?=$key?>"><?=$html?></div>
			<?php endforeach ?>
		</pre>
		
	</div>
</div>