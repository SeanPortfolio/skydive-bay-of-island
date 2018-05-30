<?php

$galleryTabs = '';

$tabs = fetch_all("SELECT `id`, MD5(`id`) AS hashed_key, `menu_label`
FROM `photo_group`
WHERE `show_on_gallery_page` = 'Y'
AND `type` = 'G'
AND `menu_label` != ''
ORDER BY `menu_label`");

if( !empty($tabs) && count($tabs) > 1 )
{
    
    // $galleryTabs = '<nav class="tab-nav">';

    $galleryTabs = '<div class="container"><div class="gallery-nav text-center">';
    $galleryTabs .= '<a class="shuffle-trigger btn btn--blue btn--sea-blue-hover active" title="All Photos" href="#" data-group="all">All Photos</a>';

    foreach ($tabs as $tab)
    {
        $galleryIds[$tab['id']] = $tab['menu_label'];
        $galleryTabs .= '<a class="shuffle-trigger btn btn--blue btn--sea-blue-hover" title="'.$tab['menu_label'].'" href="#" data-group="'.$tab['hashed_key'].'">'.$tab['menu_label'].'</a>';
    }

    // $galleryTabs .= '</nav>';

    $galleryTabs .= '</div></div>';
}
else
{
    $galleryIds[$tabs[0]['id']] = $tabs[0]['menu_label'];
}


$galleryListView .= $galleryTabs;

?>