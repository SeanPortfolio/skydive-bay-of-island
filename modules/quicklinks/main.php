<?php
###############################################################################################################################
## Make the Quicklinks
###############################################################################################################################

$quicklinksContentView = '';

$isHomePage    = ($main_page_id == $page_home->id);
$sqlExtra      = (empty($isHomePage)) ? ' LIMIT 3' : '';

$arrQuicklinks = fetch_all("SELECT pmd.`quicklink_menu_label` AS button_label, 
        pmd.`quicklink_heading` as label,
        pmd.`menu_label` as menu_label,
        pmd.`title`, 
        pmd.`short_description`, 
        pmd.`full_url`,
        pmd.`quicklink_thumb_photo` AS thumb_photo, 
        pmd.`quicklink_photo` AS photo
    FROM `page_meta_data` pmd
    LEFT JOIN `page_has_quicklink` phq
        ON(phq.`quicklink_page_id` = pmd.`id`)
    WHERE pmd.`status` = 'A'
        AND phq.`page_id` = '{$meta_page_id}'
        AND pmd.`quicklink_photo` != ''
    ORDER BY pmd.`rank` ASC
    {$sqlExtra}");

if(!empty($arrQuicklinks)){

    require_once "views/list.php";

    $quicklinksContentView =<<<HTML
        <section class="section quicklinks-holder">
            <div class="container">
                <div class="row row-fs">
                    {$quicklinksView}
                </div>
            </div>
        </section>
HTML;

}

$tags_arr['quicklinks_view'] .= $quicklinksContentView;

?>