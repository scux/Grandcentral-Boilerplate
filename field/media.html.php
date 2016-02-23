<input type="hidden" name="<?=$_FIELD->get_name()?>" value="" />
<label for="<?= $_FIELD->get_name(); ?>">
	<span><?= $_FIELD->get_label(); ?></span>
	<span class="help"></span>
</label>
<div class="wrapper">
	<?php if ($_FIELD->get_descr() != null) : ?><div class="help"><?= $_FIELD->get_descr(); ?></div><?php endif ?>
	<span class="field">
		<input type="hidden" name="<?= $_FIELD->get_name(); ?>" />

		<ol class="data">
			<li class="upload">
				<p id="upload" class="hidden"><input type="file"></p>
				<div id="holder" class="uploadzone">
					<p class="placeholder"><?=$_FIELD->get_placeholder()?></p>
					<p id="filereader">File API &nbsp; FileReader API not supported</p>
					<p id="formdata">XHR2's FormData is not supported</p>
					<p id="progress">XHR2's upload progress isn't supported</p>
					<div class="loading"><progress id="uploadprogress" min="0" max="100" value="0">0</progress></div>
				</div>
			</li>
			<?= $data; ?>
		</ol>
		<pre class="template">
			<?=$template; ?>
		</pre>
		
	</span>
</div>