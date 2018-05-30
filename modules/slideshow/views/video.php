<?php

$sectionCls .= ' video__wrapper';

$videoCaption = (!empty($youtubeVideoCaption)) ? '<p class="page__photo__caption__text">'.$youtubeVideoCaption.'</p>' : '';

$slideshow_view = <<<HTML

	<div class="video__wrapper--item">
		<div class="cover-video" data-id="{$youtube_id}"></div>
		<div class="page__photo__caption page__photo__caption--ghost">
	  		{$videoCaption}
			{$homeIconsView}
		</div>
	</div>

HTML;

?>