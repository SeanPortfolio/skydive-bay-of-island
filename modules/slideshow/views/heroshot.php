<?php

$sectionCls .= ' heroshot__wrapper';

$slideshow_view = <<<HTML

		<div class="container-fluid heroshot" style="background-image: url({$page_photo});">			
      		<div class="page__photo__caption">
                <p class="page__photo__caption__text">{$page_photo_caption}</p>
                {$homeIconsView}
            </div>
		</div>
HTML;



?>