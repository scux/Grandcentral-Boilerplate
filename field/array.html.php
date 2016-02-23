<label for="<?= $_FIELD->get_name(); ?>">
	<span><?= $_FIELD->get_label(); ?></span>
	<span class="help"></span>
</label>
<div class="wrapper">
	<?php if (isset($hackToTextarea)): ?>This array format has more than one level and is not currently supported for edition<pre><?= json_encode($_FIELD->get_value()) ?></pre><?php else : ?>
	<?php if ($_FIELD->get_descr() != null) : ?><div class="help"><?= $_FIELD->get_descr() ?></div><?php endif ?>
	<div class="field">
		
		<ol class="data" data-nodata="Add video links from YouTube, Vimeo or Dailymotion."><?= $data; ?></ol>
		<ul class="add"><?= $addbuttons; ?></ul>

		<pre class="template">
			<?php foreach ($template as $key => $html): ?>
			<div class="<?=$key?>"><?=$html?></div>
			<?php endforeach ?>
		</pre>
		
		<?php endif ?>
	</div>
</div>