<?php

$tags_arr['body_cls'] .= ' combo-single-page';

$combo_sql = "SELECT c.`id`, 
                     c.`photo`, 
                     c.`price`, 
                     c.`page_meta_data_id`,
                     pmd.`name`,
                     pmd.`gallery_id`,
                     pmd.`description`, 
                     pmd.`url`,
                     pmd.`booking_url`,
                     pmd.`title`, 
                     pmd.`meta_description`,
                     pmd.`og_title`, 
                     pmd.`og_image`, 
                     pmd.`og_meta_description`
              FROM `combos` c 
              LEFT JOIN `page_meta_data` pmd ON pmd.`id` = c.`page_meta_data_id`
              WHERE pmd.`url` = '".$segment1."'";

$combo_arr    = fetch_row($combo_sql);
$meta_page_id = $combo_arr['page_meta_data_id'];
$combo_id     = sha1($combo_arr['page_meta_data_id']);
$gallery_id   = $combo_arr['gallery_id'];

$combo_desc = html_entity_decode(htmlspecialchars_decode($combo_arr['description']));

$tags_arr['title']              = $combo_arr['title'];
$tags_arr['mdescr']             = $combo_arr['meta_description'];
$tags_arr['og_url']             = $htmlroot.$page_combodeals->full_url.'/'.$combo_arr['url'];
$tags_arr['og_meta_description']= $combo_arr['og_meta_description'];
$tags_arr['og_title']           = $combo_arr['og_title'];
$tags_arr['og_image']           = $htmlroot.((!empty($combo_arr['og_image'])) ? $combo_arr['og_image'] : $combo_arr['photo']);

$tags_arr['heading']      = $combo_arr['name']; 
$tags_arr['introduction'] = $combo_desc;
$page_photo = $combo_arr['photo'];

$btnBackToDeals = '<a href="'.$page_combodeals->full_url. '" class="btn btn--blue btn--back">Back to deals</a>';
$tags_arr['btn_back_to_deals'] = $btnBackToDeals;

$bookingBtn = '';
if (!empty($combo_arr['price'])) {
    if (!empty($combo_arr['booking_url'])) {
        $bookingBtn = '<a href="'.$combo_arr['booking_url'].'" target="_blank" class="btn">Book Now</a>';
    }

    $tags_arr['mod_view'] .= <<<HTML
    
        <section class="section bg--black">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <header class="section__header">
                            <h3 class="section__heading section__heading--yellow">{$combo_arr['name']} From $ {$combo_arr['price']}</h3>
                        </header>
                        {$bookingBtn}
                        <a href="{$page_contact->full_url}?subject=Enquiry about {$combo_arr['name']} combo" class="btn btn--white">Enquire</a>
                    </div>
                </div>
            </div>
        </section>
    
HTML;
}



?>