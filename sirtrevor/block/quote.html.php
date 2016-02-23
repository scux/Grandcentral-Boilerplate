<blockquote class="block-quote">
	<p><?= mb_substr($_PARAM['block']['data']['text'], 2);?></p>
	<?php if (!empty($_PARAM['block']['data']['cite'])): ?>
	<cite><?= $_PARAM['block']['data']['cite'];?></cite>
	<?php endif ?>
</blockquote>
