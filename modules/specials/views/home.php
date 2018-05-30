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
                ORDER BY pmd.`rank` ASC
                LIMIT 3";



$specials_arr = fetch_all($sqlSpecials);

if(!empty($specials_arr))
{
	$counter = 0;
    $specialItem = '';
	foreach ($specials_arr as $special) {
		$counter++;
		$title        = $special['name'];
		$thumb_photo  = $special['thumb_photo'];
		$price        = $special['price'] ? '<h4 class="specials__price"><span>From</span> &#36; '.$special['price'].'</h4>' : '';
        $url          = $special['url'];
        $date_start   = date("Y-m-d", strtotime($special['date_start']));
        $date_end     = date("Y-m-d", strtotime($special['date_end']));
        $description  = html_entity_decode(htmlspecialchars_decode($special['description']));
        $description  = strip_tags($description);
        $descriptionCut = strlen($description) > 130 ? substr($description, 0, 130).'...' : $description;

        $specialItem .= <<<HTML
        <div class="col-md-4 text-center specials">
            <h3 class="section__heading section__heading--yellow specials__heading">
                <a href="{$page_specials->full_url}/{$url}" >
                    {$title}
                </a>
            </h3>
            {$price}
            <p class="specials__text">
                {$descriptionCut}
            </p>
            <a href="{$page_specials->full_url}/{$url}" class="btn btn--red">Explore</a>
        </div>
            
HTML;
    }

    $specialView =<<<HTML
        <section class="section bg--black">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <header class="section__header">
                            <h1 class="section__heading section__heading--white section__heading--alt">Hot Deals &amp; Specials</h1>                            
                        </header>
                    </div>
                </div>
                <div class="row">
                    {$specialItem}
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <a href="{$page_specials->full_url}" class="btn btn--link btn--link-yellow">View All Hot Deals &amp; Specials</a>
                    </div>
                </div>
            </div>
        </section>
HTML;
	
	$tags_arr['mod_view'] .= $specialView;
}

?>