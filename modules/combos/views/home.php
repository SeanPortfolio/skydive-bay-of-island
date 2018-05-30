<?php

$combo_sql = "SELECT pmd.`name`,
                     c.`price`, 
                     c.`photo`, 
                     pmd.`url`,
                     pmd.`description` 
              FROM `combos` c
              LEFT JOIN `page_meta_data` pmd ON pmd.`id` = c.`page_meta_data_id`
              WHERE c.`featured` = 'Y' 
              AND pmd.`status` = 'A' 
              ORDER BY pmd.`rank` 
              LIMIT 3";

$combo_arr = fetch_all($combo_sql);

if(!empty($combo_arr))
{
	$counter = 0;
	foreach ($combo_arr as $combo) {
		$counter++;
		$title        = $combo['name'];
		$thumb_photo  = $combo['photo'];
		$price        = $combo['price'] ? '<h4 class="specials__price"><span>From</span> '.$combo['price'].'</h4>' : '';
        $url          = $combo['url'];

        $description  = html_entity_decode(htmlspecialchars_decode($combo['description']));
        $description  = strip_tags($description);
        $descriptionCut = strlen($description) > 160 ? substr($description, 0, 160).'...' : $description;

		$comboItem .= <<<HTML

            <div class="combos__item rounded__border" style="background-image: url({$thumb_photo});">
                <div class="combos__content text-center">
                    <h3 class="section__heading section__heading--yellow specials__heading">
                        {$title}
                    </h3>
                    {$price}
                    <p class="specials__text">{$descriptionCut}</p>
                </div>
                <a href="{$page_combodeals->full_url}/{$url}" class="combo__link"></a>
            </div>   
HTML;

	}

	$comboView =<<<HTML
        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <header class="section__header">
                            <h3 class="section__heading section__heading--alt">Skydive Combos</h3>
                        </header>
                    </div>  
                </div>
                <div class="row">
                    <div class="col-md-10 col-md-push-1">
                        <div class="combos">
                            {$comboItem}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <a href="{$page_combodeals->full_url}" class="btn btn--link">View All Combos</a>
                    </div>
                </div>
            </div>
        </section>
HTML;
	
	$tags_arr['mod_view'] .= $comboView;
}

?>