<?php

$sqlActivities = "SELECT pmd.`name`,
	        pmd.`url`,
	        pmd.`full_url`,
	        pmd.`photo`,
	        pmd.`thumb_photo`,
	        pmd.`short_description` AS description,
	        (SELECT IF(MIN(a.`price`), REPLACE(FORMAT(MIN(a.`price`), 2), '.00', ''), 'POA')
			FROM `activities` a 
			WHERE a.`activity_category_id` = gp.`id`) AS price
	  FROM `general_pages` gp
	  LEFT JOIN `page_meta_data` pmd 
	  		ON (pmd.`id` = gp.`page_meta_data_id`)
	  WHERE gp.`is_category` = '".FLAG_YES."' 
	  AND pmd.`status` = '".FLAG_ACTIVE."' 
	  ORDER BY pmd.`rank`";


$arrActivities = fetch_all($sqlActivities);

if(!empty($arrActivities))
{
	$counter   = 0;
	$activityItem = '';

	foreach ($arrActivities as $activity) {
		$counter++;
		$title        = $activity['name'];
		$thumb_photo  = $activity['thumb_photo'];
		$price        = $activity['price'] ? '<h4 class="specials__price"><span>From </span> &#36; '.$activity['price'].'</h4>' : '';
        $url          = $activity['full_url'];

        $description  = html_entity_decode(htmlspecialchars_decode($activity['description']));
        $description  = strip_tags($description);
        $descriptionCut = strlen($description) > 60 ? substr($description, 0, 60).'...' : $description;

        $activityItem .= <<<HTML
            <div class="col-md-4 combos-grid">
                <div class="mod-grid rounded__border">
                    <div class="mod-grid__img">
                        <a href="{$htmlroot}{$url}" class="zoom__wrapper mod-grid__img__link">
                            <span class="zoom" style="background-image: url({$thumb_photo})"></span>
                        </a>
                    </div>
                    <div class="mod-grid__content text-center">
                        <header class="section__header">
                            <div class="motif motif--yellow-stroke"></div>
                            <h3 class="section__heading section__heading--yellow specials__heading">
                                <a href="{$htmlroot}{$url}" title="{$title}">{$title}</a>
                            </h3>
                            {$price} 
                        </header>
                        <p class="specials__text">{$descriptionCut}</p>
                        <a href="{$htmlroot}{$url}" class="btn">Explore</a>
                    </div>
                </div>   
            </div>
HTML;

	}

    $activityView =<<<HTML
        <section class="section section--bg section--overlay" style="background-image:url({$bgSkydive});">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2">
                        <header class="section__header section__header--bg">
                            <h2 class="section__heading section__heading--yellow">
                                <span>Our</span> PRICES
                            </h2>
                        </header>
                        <p class="section__text">{$pricingSectionDescription}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 combos-grid-wrap">
                        <div class="row">
                            {$activityItem}
                        </div>
                    </div>
                </div>
            </div>
        </section>
HTML;
	
	$tags_arr['mod_view'] .= $activityView;
}
?>