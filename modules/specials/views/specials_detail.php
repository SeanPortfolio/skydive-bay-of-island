<?php

$tags_arr['body_cls'] .= ' combo-single-page';

$sqlSpecials = "SELECT 
                    s.`id`, 
                    s.`price`, 
                    pmd.`id` AS `meta_data_id`,
                    pmd.`name`,
                    pmd.`photo`, 
                    pmd.`description`,
                    pmd.`gallery_id`,
                    pmd.`booking_url`,
                     pmd.`title`, 
                     pmd.`meta_description`,
                     pmd.`og_title`, 
                     pmd.`og_image`, 
                     pmd.`og_meta_description`
                FROM `specials` s
                LEFT JOIN `page_meta_data` pmd
                    ON (pmd.`id` = s.`page_meta_data_id`)
                WHERE pmd.`url` = '{$segment1}' 
                    AND pmd.`status` = 'A'
                ORDER BY pmd.`rank` ASC";

$specials_arr = fetch_row($sqlSpecials);

$specials_description  = html_entity_decode(htmlspecialchars_decode($specials_arr['description']));
$specials_description  = str_replace("&nbsp;", ' ', $specials_description);
$price                 = $specials_arr['price'] ? '$'.$specials_arr['price'] : '';
$gallery_id            = $specials_arr['gallery_id'];

$meta_page_id          = $specials_arr['meta_data_id'];

$tags_arr['heading']      = $specials_arr['name'];
$tags_arr['introduction'] = $specials_description;

$tags_arr['title']              = $specials_arr['title'];
$tags_arr['mdescr']             = $specials_arr['meta_description'];
$tags_arr['og_url']             = $htmlroot.$page_specials->full_url.'/'.$specials_arr['url'];
$tags_arr['og_meta_description']= $specials_arr['og_meta_description'];
$tags_arr['og_title']           = $specials_arr['og_title'];
$tags_arr['og_image']           = $htmlroot.((!empty($specials_arr['og_image'])) ? $specials_arr['og_image'] : $specials_arr['photo']);

$page_photo = $specials_arr['photo'];

if(!empty($price)){
    if(!empty($specials_arr['booking_url'])){
        $bookingBtn = '<a href="'.$specials_arr['booking_url'].'" target="_blank" class="btn">Book Now</a>';
    }else{
        $bookingBtn = '';
    }
    $tags_arr['mod_view'] .= <<<HTML
    
        <section class="section bg--black">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <header class="section__header">
                            <h3 class="section__heading section__heading--yellow">{$specials_arr['name']} From {$price}</h3>
                        </header>
                        {$bookingBtn}
                        <a href="{$page_contact->full_url}?subject=Enquiry about {$specials_arr['name']} specials" class="btn btn--white">Enquire</a>
                    </div>
                </div>
            </div>
        </section>
    
HTML;
}

?>