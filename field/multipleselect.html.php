<label for="<?= $_FIELD->get_name(); ?>">
	<span><?= $_FIELD->get_label(); ?></span>
	<span class="help"></span>
</label>
<div class="wrapper">
	<div class="field">
		<input  type="hidden" name="<?= $_FIELD->get_name(); ?>" <?php if ($_FIELD->is_disabled()): ?>disabled="disabled" <?php endif ?>value="">
		<div class="selected">
			<ol data-nodata="<?= $_FIELD->get_placeholder()?>"><?php foreach ($selected as $li): ?>
				<li data-item="<?=$li->get_nickname()?>">
					<button class="delete" type="button"></button>
					<div class="icon"></div>
					<span class="title"><?=$li['title']?></span>
					<input type="hidden" name="<?=$_FIELD->get_name()?>[]" value="<?=$li->get_nickname()?>" />
				</li>
				<?php endforeach ?></ol>
		</div>
		<div class="available" data-name="<?=$name?>" data-values="<?=$values?>" data-valuestype="<?=$valuestype?>">
			<div class="refine"><input type="search" placeholder="Refine" /></div>
			<ul class="choices"><!-- Welcome Ajax --></ul>
		</div>
		<div class="clear"><!-- Clearing floats --></div>
	</div>
</div>