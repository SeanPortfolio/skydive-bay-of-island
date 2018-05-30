<?php

$tags_arr['body_cls'] .= ' combo-page';

$combo_sql = "SELECT pmd.`name`,
                     c.`price`, 
                     c.`thumb_photo`, 
                     pmd.`url`,
                     pmd.`description`
              FROM `combos` c
              LEFT JOIN `page_meta_data` pmd ON pmd.`id` = c.`page_meta_data_id`
              WHERE pmd.`status` = 'A' 
              ORDER BY pmd.`rank`";

$combo_arr = fetch_all($combo_sql);

if(!empty($combo_arr))
{
	$counter = 0;
	foreach ($combo_arr as $combo) {
		$counter++;
		$title        = $combo['name'];
		$thumb_photo  = $combo['thumb_photo'];
		$price        = $combo['price'] ? '<h4 class="specials__price"><span>Only </span> $ '.$combo['price'].'</h4>' : '';
        $url          = $combo['url'];

        $description  = html_entity_decode(htmlspecialchars_decode($combo['description']));
        $description  = strip_tags($description);
        $descriptionCut = strlen($description) > 60 ? substr($description, 0, 60).'...' : $description;

        $comboItem .= <<<HTML
            <div class="col-md-4 combos-grid">
                <div class="mod-grid rounded__border">
                    <div class="mod-grid__img">
                        <a href="{$page_combodeals->full_url}/{$url}" class="zoom__wrapper mod-grid__img__link">
                            <span class="zoom" style="background-image: url({$thumb_photo})"></span>
                        </a>
                    </div>
                    <div class="mod-grid__content text-center">
                        <header class="section__header">
                            <div class="motif motif--yellow-stroke"></div>
                            <h3 class="section__heading section__heading--yellow specials__heading">
                                <a href="{$page_combodeals->full_url}/{$url}" title="{$title}">{$title}</a>
                            </h3>
                            {$price} 
                        </header>
                        <p class="specials__text">{$descriptionCut}</p>
                        <a href="{$page_combodeals->full_url}/{$url}" class="btn">Explore</a>
                    </div>
                </div>   
            </div>
HTML;

	}

    $comboView =<<<HTML
        <section class="section section--bg combo-wrap" style="background-image:url({$bgSkydive});">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2">
                        <header class="section__header">
                            <h2 class="section__heading">
                                {$skydiveHeading}
                            </h2>
                        </header>
                        <p class="section__text">{$skydiveDescription}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 combos-grid-wrap">
                        <div class="row">
                            {$comboItem}
                        </div>
                    </div>
                </div>
            </div>
        </section>
HTML;
	
	$tags_arr['mod_view'] .= $comboView;
}

?>