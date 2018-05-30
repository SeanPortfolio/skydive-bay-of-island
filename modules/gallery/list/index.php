<?php

$galleryListView = '';
$galleryIds       = array();

require 'nav.php';

if (!empty($galleryIds)) {

	$sqlGalleryPhotos ="SELECT `full_path`, `thumb_path`, MD5(`photo_group_id`) AS group_key,
            `photo_group_id`, CONCAT(`width`,'x',`height`) AS size, `video_id`, `alt_text`
            FROM `photo`
            WHERE `photo_group_id` IN (".implode(',', array_keys($galleryIds)).")
            ORDER BY `photo_group_id`, `rank`";

    $galleryPhotos = fetch_all($sqlGalleryPhotos);

    if (!empty($galleryPhotos)) {
        foreach ($galleryPhotos as $photo) {

            $photoVideoId = $photo['video_id'];
            $photoGroupId = $photo['photo_group_id'];

            $photoCls     = (!empty($photoVideoId)) ? ' swipebox-video' : ' swipebox';

            $lightBoxContentUrl = (!empty($photoVideoId)) ? "https://www.youtube.com/watch?v={$photoVideoId}" : $photo['full_path'];

            $dataGroupKeys = "all,{$photo['group_key']}";

            $pageGalleryView .= <<<HTML
	            <a href="{$lightBoxContentUrl}" class="showcase__item col-xs-12 col-sm-4 col-md-3 {$photoCls}" data-swipe-rel="{$photoGroupId}" data-groups="{$dataGroupKeys}">
	                <figure class="zoom__wrapper rounded__border">
                        <span class="showcase__item__img" style="background-image: url({$photo['thumb_path']})"></span>
                    </figure>
	            </a>
HTML;

        }

        $pageGalleryView = <<<HTML
    		<div class="row">
	        	<div class="col-xs-12 showcase">
		            <div class="showcase__gallery" id="shuffle">
		                    {$pageGalleryView}
		            </div>
		        </div>
HTML;

    }

    $tags_arr['mod_view'] .= <<<HTML
        <section class="section">
            {$galleryListView}
            <div class="container">
                {$pageGalleryView}
            </div>
        </section>
HTML;
}



?>