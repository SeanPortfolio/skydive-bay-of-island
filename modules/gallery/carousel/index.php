<?php

require_once $classdir.'/Helper.class.php';

$galleriesQuery = fetch_all("SELECT `id`,
							        `full_path`,
							        `thumb_path`,
							        `video_id`,
							        `width`,
							        `height`,
							        `photo_group_id`,
							        `alt_text`,
							        `caption`
							        FROM `photo`
							        WHERE `photo_group_id` = '".$gallery_id."'
							        AND `full_path` != ''
							        AND `thumb_path` != ''
							        ORDER BY `rank`");

if (!empty($galleriesQuery)) {

	$photoItem = '';
	$counter = 0;
	foreach ($galleriesQuery as $item) {
		$counter++;
		$id             = $item['id'];
		$full_path      = $item['full_path'];
		$thumb_path     = $item['thumb_path'];
		$video_id       = $item['video_id'];
		$width          = $item['width'];
		$height         = $item['height'];
		$photo_group_id = $item['photo_group_id'];
		$alt_text       = $item['alt_text'];
		$caption        = $item['caption'];
		$itemUrl     = ($video_id) ? 'href="https://www.youtube.com/watch?v='.$video_id.'"' : 'href="'.Helper::getFullUrl($full_path).'"';

		$photoItem .= <<<HTML
            <div class="photo__item swipebox_item" {$itemUrl}>
                <div class="photo__item__content rounded__border">           
					<span style="background-image:url({$thumb_path})" class="photo__img"></span>
                </div>
            </div>
HTML;

	}

	$photoView =<<<HTML
        <section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section__header">
							<h2 class="section__heading">{$carousel_title}</h2>
						</div>
					</div>
				</div>
				<div class="row ">
					<div class="col-md-12 {$carousel_id}">
						{$photoItem}
					</div>
				</div>
			</div>
        </section>
HTML;
	
	$tags_arr['photos_view'] .= $photoView;
}

?>