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
                FROM `specials` s
                LEFT JOIN `page_meta_data` pmd
                    ON (pmd.`id` = s.`page_meta_data_id`)
                WHERE s.`featured` = 'Y'
                    AND pmd.`status` = 'A'
                    AND ('{$curentDate}' BETWEEN  s.`date_start` AND  s.`date_end`)
                ORDER BY pmd.`rank`";

$specials_arr = fetch_all($sqlSpecials);

if(!empty($specials_arr))
{
    $counter = 0;
    $specialItem = '';
    foreach ($specials_arr as $special) {
        $counter++;
        $title        = $special['name'];
        $thumb_photo  = $special['thumb_photo'];
        $price        = $special['price'] ? '$'.$special['price'] : '';
        $url          = $special['url'];
        $description  = html_entity_decode(htmlspecialchars_decode($special['description']));
        $description  = strip_tags($description);
        $descriptionCut = strlen($description) > 150 ? substr($description, 0, 150).'...' : $description;

        $specialItem .= <<<HTML
            <div class="specials__item">
                <div class="specials__item__wrap rounded__border bg--yellow">
                    <div class="row">
                        <div class="col-md-6 specials__item__content-wrap specials__item__content-wrap--img">
                            <a href="{$page_specials->full_url}/{$url}" class="zoom__wrapper">
                                  <span style="background-image:url({$thumb_photo})" class="zoom"></span>
                             </a>
                        </div>
                        <div class="col-md-6 specials__item__content-wrap">
                            <div class="specials__item__content">
                                <h3 class="section__heading specials__item__heading">
                                    <a href="{$page_specials->full_url}/{$url}">{$title}</a>
                                </h3>
                                <p class="specials__item__desc">$descriptionCut</p>
                                <a href="{$page_specials->full_url}/{$url}" class="btn">Explore</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
HTML;
    }

    $specialView =<<<HTML
        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <header class="section__header">
                            <h1 class="section__heading">Hot Deals &amp; Specials</h1>   
                        </header>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-10 col-md-push-1 specials-carousel">
                        {$specialItem}
                    </div>
                </div>
            </div>
        </section>
HTML;
    
    $tags_arr['mod_view'] .= $specialView;
}

?>


