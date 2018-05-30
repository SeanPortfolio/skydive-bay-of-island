<?php

$secondaryNav   = '';
$primaryNav     = '';
$current_page   = $page;

$sql = "SELECT gp.`id` AS page_id, pmd.`menu_label`, pmd.`title`, pmd.`full_url`, 
        pmd.`url`, gp.`parent_id`, pmd.`is_top_position`,
        (SELECT GROUP_CONCAT(`mod_id`) FROM `module_pages` WHERE `page_id` = gp.`id`) AS page_mods
        FROM general_pages gp
        LEFT JOIN `page_meta_data` pmd
        ON(pmd.`id` = gp.`page_meta_data_id`)
        WHERE pmd.`status` = 'A'
        AND gp.`parent_id` = 0
        AND (pmd.`menu_label` != '')
        ORDER BY pmd.`rank` ASC";


$pages  = fetch_all($sql);


if( !empty($pages) )
{
    foreach ($pages as $page)
    {

        $menu_page_id  = $page['page_id'];
        $page_mods_arr = explode(',', $page['page_mods']);
        $item_cls      = ($page['url'] === $current_page || $menu_page_id === $page_arr['parent_id']) ? 'active' : '';
        $page_menu     = $page['menu_label'];
        $page_type     = $page['is_top_position'];   
        
        if($page['url'] == $page_giftvouchers->url || $page['url'] == $page_shop->url){
            $url = $page_booking->full_url;        
        }else{
            $url = $page['full_url'];       
        }

        $sub_menu  = '';
        $icon      = '';
        $home_cls  = '';
        $more_link = '';

        $module_child_pages = array();

    
        $sql = "SELECT gp.`id` AS page_id, pmd.`menu_label`, pmd.`title`,
            pmd.`full_url`, pmd.`url`
            FROM general_pages gp
            LEFT JOIN `page_meta_data` pmd
            ON(pmd.`id` = gp.`page_meta_data_id`)
            WHERE pmd.`status` = 'A'
            AND gp.`parent_id` = '{$menu_page_id}'
            AND pmd.`menu_label` != ''
            ORDER BY pmd.`rank` ASC";


        $child_pages  = fetch_all($sql);

        if( !empty($module_child_pages) )
        {
            $child_pages = array_merge($module_child_pages, $child_pages);
        }

        if( !empty($child_pages) )
        {

            $icon = '<i class="glyphicons glyphicons-chevron-down toggle-sub-nav"></i>';
            $item_cls .= ' has-menu';

            
            foreach ($child_pages as $child_page)
            {
                $is_active           = ( $child_page['url'] === $current_page ) ? ' class="active"' : '';
                $child_page_full_url = $child_page['full_url'];
                $child_page_menu     = $child_page['menu_label'];

                $sub_menu .= '<li'.$is_active.'><a href="'.$child_page_full_url.'" title="'.$child_page['title'].'">'.$child_page_menu.'</a></li>';
            }

        }


        if($item_cls) $item_cls = ' class="'.trim($item_cls).'"';

        $listCls = ($page_type === 'Y') ? 'secondary-nav__sub-nav' : 'primary-nav__sub-nav';

        $nav_item  = '';
        $nav_item .= '<li'.$item_cls.'>';
        $nav_item .= '<a href="'.$url.'" title="'.$page['title'].'">'.$page_menu.'</a>';
        $nav_item .= $icon;
        $nav_item .= ($sub_menu) ? '<ul class="'.$listCls.'">'.$sub_menu.$more_link.'</ul>' : '';
        $nav_item .= '</li>';


        if( $page_type === 'Y' )
        {
            $secondaryNav .= $nav_item;
        }
        elseif( $page_type === 'N' )
        {
            $primaryNav .= $nav_item;
        }
    }
}

$tags_arr['nav-secondary']   = ($secondaryNav) ? '<ul class="secondary-nav__list">'.$secondaryNav.'</ul>' : '';
$tags_arr['nav-main'] = ($primaryNav) ? '<ul class="primary-nav__list">'.$primaryNav.'</ul>' : '';

?>