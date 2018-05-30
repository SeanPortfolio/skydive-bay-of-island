<?php
$curentDate = date("Y-m-d");

$sqlSpecials = "SELECT 
                    s.`id`, 
                    s.`price`,
                    s.`date_start`, 
                    s.`date_end`,  
                    pmd.`name`,
                    pmd.`thumb_photo`, 
                    pmd.`description`,
                    pmd.`url`
                FROM `page_has_special` phs
                LEFT JOIN `specials` s
                	ON (s.`id` = phs.`special_id`)
                LEFT JOIN `page_meta_data` pmd
                    ON (pmd.`id` = s.`page_meta_data_id`)
                WHERE phs.`page_id` = {$page_id}
                	AND pmd.`status` = '".FLAG_ACTIVE."'
                    AND ('{$curentDate}' BETWEEN  s.`date_start` AND  s.`date_end`)
                ORDER BY pmd.`rank` ASC";

$specials_arr = fetch_all($sqlSpecials);

if(!empty($specials_arr)){

	$counter = 0;

	foreach ($specials_arr as $special) {
		
		$counter++;
		$title        = $special['name'];
		$thumb_photo  = $special['thumb_photo'];
		$price        = $special['price'] ? '<h4 class="specials__price"><span>Only </span> $ '.$special['price'].'</h4>' : '';
        $url          = $special['url'];

        $description  = html_entity_decode(htmlspecialchars_decode($special['description']));
        $description  = strip_tags($description);
        $descriptionCut = strlen($description) > 60 ? substr($description, 0, 60).'...' : $description;

        $specialItems .= <<<HTML
            <div class="col-md-4 combos-grid">
                <div class="mod-grid rounded__border">
                    <div class="mod-grid__img">
                        <a href="{$page_specials->full_url}/{$url}" class="zoom__wrapper mod-grid__img__link">
                            <span class="zoom" style="background-image: url({$thumb_photo})"></span>
                        </a>
                    </div>
                    <div class="mod-grid__content text-center">
                        <header class="section__header">
                            <div class="motif motif--yellow-stroke"></div>
                            <h3 class="section__heading section__heading--yellow specials__heading">
                                <a href="{$page_specials->full_url}/{$url}" title="{$title}">{$title}</a>
                            </h3>
                            {$price} 
                        </header>
                        <p class="specials__text">{$descriptionCut}</p>
                        <a href="{$page_specials->full_url}/{$url}" class="btn">Explore</a>
                    </div>
                </div>   
            </div>
HTML;

	}

    $specialItemsView =<<<HTML
        <section class="section combo-wrap">
            <div class="container showcase__grid__wrapper">
                <div class="row">
                    <div class="col-md-8 col-md-push-2">
                        <header class="section__header">
                            <h2 class="section__heading section__heading--alt">Hot Deals &amp; Specials</h2>
                        </header>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 combos-grid-wrap">
                        <div class="row showcase__grid">
                            {$specialItems}
                        </div>
                    </div>
                </div>
            </div>
        </section>
HTML;
	
	$tags_arr['mod_view'] .= $specialItemsView;
}


?>