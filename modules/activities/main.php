<?php 

$activityContentView = '';

$sqlActivities = "SELECT a.`id` AS activityPricingId,
                IF(a.`price`, REPLACE(FORMAT(a.`price`, 2), '.00', ''), 'POA') AS price,
                pmd.`name`,
                pmd.`menu_label`,
                pmd.`heading`,
                pmd.`photo`,
                pmd.`thumb_photo`,
                pmd.`description`,
                pmd.`booking_url`
            FROM `activities` a
            LEFT JOIN `page_meta_data` pmd 
                ON (pmd.`id` = a.`page_meta_data_id`)
            WHERE a.`activity_category_id` = '{$page_id}'            
            AND pmd.`status` = '".FLAG_ACTIVE."' 
            ORDER BY pmd.`rank`";

$arrActivities = fetch_all($sqlActivities);


foreach($arrActivities AS $activity){

    $activityId          = $activity['activityPricingId'];
    $activityLabel       = $activity['menu_label'];
    $activityDescription = $activity['description'];
    $activityRate        = $activity['price'];
    $activityBoiokingUrl = $activity['booking_url'];
    $activityPhoto       = $activity['thumb_photo'];

    $activityBookingBtnView = '';

    if(!empty($activityBoiokingUrl)){
        $activityBookingBtnView = <<<HTML
            <p class="grid__row__btn-outer  text-center">
                <a href="{$activityBoiokingUrl}" class="btn btn__red" target="_blank">Book Now</a>
            </p>
HTML;

    }

    $activityContentView .= <<<HTML
        <div class="grid__row rounded__border">
            <div class="grid__row__img-outer">
                <span class="grid__row__img" style="background-image: url({$activityPhoto})"></span>
            </div>
            <div class="grid__row__content">
                <div class="motif grid__row__motif"></div>
                <h2 class="grid__row__heading">
                    {$activityLabel} 
                    <span class="grid__row__price">&#36; {$activityRate}</span>
                </h2>
                <span class="grid__row__hr"></span>
                <div class="grid__row__desc">{$activityDescription}</div>
                {$activityBookingBtnView}
            </div>

        </div>

HTML;
}

$tags_arr['mod_view'] .= <<<HTML

    <section class="section section--bg section--overlay" style="background-image:url({$bgActivity})">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <header class="section__header">
                        <h3 class="section__heading">Skydive Packages</h3>
                    </header>
                    <p class="section__text">Choose your {$page_menu_label} Skydive Package from the below options! </p>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-md-10 col-md-push-1">
                    {$activityContentView}
                </div>
            </div>
        </div>
    </section> 

HTML;

?>
