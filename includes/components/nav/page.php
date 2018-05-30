<?php
/*
include_once "{$classdir}/mobile_detect.php";

if( !function_exists('side_navigation') )
{
    $level = 0;

    function side_navigation($parent = 0, $current_page = '')
    {

        global $max_pages, $max_pages_generation, $level, $page_arr, $rootfull, $static_map_img, $page_gallery, $downloadPhotoURL ;


        $sql = "SELECT gp.`id` AS page_id, pmd.`menu_label`, pmd.`title`, pmd.`full_url`, pmd.`url`, gp.`parent_id`, gp.`is_category`, pmd.`icon`
        FROM general_pages gp
        LEFT JOIN `page_meta_data` pmd
        ON(pmd.`id` = gp.`page_meta_data_id`)
        WHERE pmd.`status` = 'A'
        AND gp.`parent_id` = '$parent'
        AND (pmd.`menu_label` != '')
        AND (pmd.`is_top_position` = '".FLAG_NO."')
        ORDER BY pmd.`rank` ASC";

        $pages  = fetch_all($sql);

        $html   = '';

        if( !empty($pages) )
        {
            $total_pages = count($pages);

            foreach ($pages as $page)
            {

                $page_id              = $page['page_id'];
                $is_category          = $page['is_category'];
                $item_cls             = ($page['url'] === $current_page || $page_id === $page_arr['parent_id']) ? 'active' : '';
                $item_cls_a           = '';
                $item_toggle          = '';
                $url                  = $page['full_url'];
                $urlTarget            = '';
                $icon_display         = $page['icon'];

                $sub_menu      = '';
                $icon          = '';
                $icon2         = '';
                $home_cls      = '';
                $icon_sub_menu = '';
                $icon_left     = '';
               
                if($page_gallery->id == $page_id && !empty($downloadPhotoURL)) {

                    $url = $downloadPhotoURL;

                    $urlTarget  = ' target="_blank"';

                }

                $sub_menu  .= side_navigation($page_id, $current_page );

                if($item_cls == 'active'){
                    $icon_left = '<i class="fa fa-caret-left icon-left"></i>';
                }

                if( $sub_menu )
                {
                    $icon = '';
                    $icon2 = '<i class="fa fa-caret-down main-icon"></i>';
                    $item_cls .= ' dropdown menu-large';

                    $item_cls_a .= ' dropdown-toggle';
                    $item_toggle_a .= ' data-toggle="dropdown"';

                    $sub_menu = '<ul class="dropdown-menu megamenu row">'.$sub_menu.'</ul>';

                }

                //$page['menu_label'] = ($page_id == '1') ? '<i class="fa fa-home"></i>' : $page['menu_label'];
                
                if($item_cls) $item_cls = ' class="'.trim($item_cls).'"';
                if($item_cls_a) $item_cls_a = ' class="'.trim($item_cls_a).'" '.$item_toggle_a;

               // if($item_cls_a) {
                    $icon_sub_menu = '<i class="fa '.$icon_display.'"></i>';
                //}


                $html .= '<li'.$item_cls.'>';
                $html .= '<a href="'.$url.'" title="'.$page['title'].'" '.$urlTarget. $item_cls_a . '>'.$icon_sub_menu.$page['menu_label'].'</a>'. $icon_left;
                $html .= $icon;
                $html .= $sub_menu;
                $html .= '</li>';
            }
            return sprintf('%s', $html);
        }
        return $html;
    }
}

if( !function_exists('operators_list') )
{
 
    function operators_list(){
        global $page_id;


        $operators_query = fetch_all("SELECT 
                                        o.`name`, 
                                        o.`description`, 
                                        o.`thumb_photo` 
                                      FROM
                                        `operator_has_category` oc 
                                      LEFT JOIN  `operators` o ON oc.`operator_id` = o.`id`
                                      WHERE oc.`category_id` = '{$page_id}'
                                      AND o.`status` = 'A' 
                                      ORDER BY o.`rank` ASC");

        $operator_output = '<ul id="table" class="operators-columns" data-columns="2">';


        foreach($operators_query as $item){

            $photo       = $item['thumb_photo'];
            $description = substr($item['description'], 0, 100) . '...';

            $operator_output .= '<li class="data">
                                    <span class="operators-columns__item">
                                        <span class="operators-columns__item--photo">
                                            <img src="'.$photo.'" />
                                        </span>
                                        <span class="operators-columns__item--description">
                                            '.$description.'
                                        </span>
                                    </span>
                                 </li>';
        }

        $operator_output .= '</ul>';

        $operator_size = count($operators_query);

        $html = <<<HTML
            <div class="row content-row">
                <div class="col-xs-12">
                    {$operator_output}
                    <input type="hidden" value="{$operator_size}" id="operator_size" name="operator_size" />
                    <div class="paging-container" id="tablePaging"></div>
                </div>
            </div>
HTML;

        return ($operator_size > 0) ? $html : '';
    }
}


$side_id = ($page_parent_id == 0) ? $page_id : $page_parent_id;

$side_menu       = side_navigation($side_id, $page);
$operators_block = operators_list($side_id, $page);

$content = $tags_arr['content'];

$tags_arr['page-content'] = ($side_menu) ? '<div class="container page-content-holder">
                                            <div class="row page-content-holder-row">
                                                <div class="col-xs-12 col-md-3 side-holder">
                                                    <nav id="side-navigation" role="navigation">
                                                        <ul>'.$side_menu.'</ul>
                                                    </nav>
                                                </div>
                                            </div>
                                           </div>     
                                            ' : '';
if($page_parent_id == 0 && !$side_menu){
    $tags_arr['page-content'] = '<div class="container page-content-holder">
                                            <div class="row page-content-holder-row">

                                            </div>
                                </div>';    
}

*/ 
?>