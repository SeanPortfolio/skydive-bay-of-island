<?php
###############################################################################################################################
## Fetch Website Settings
###############################################################################################################################

function fetchSettings()
{
    $sql = "SELECT
            gs.`company_name`,
            gs.`start_year`,
            gs.`email_address`,
            gs.`phone_number`,
            gs.`free_phone_number`,
            gs.`address`,
            gs.`second_address`,
            gs.`js_code_head_close`,
            gs.`js_code_body_open`,
            gs.`js_code_body_close`,
            gs.`adwords_code`,
            gs.`slideshow_speed`,
            gs.`homepage_slideshow_caption`,
            gs.`youtube_id`,
            gs.`homepage_caption`,
            gs.`mailchimp_api_key`,
            gs.`mailchimp_list_id`,
            gs.`map_latitude`,
            gs.`map_longitude`,
            gs.`map_address`,
            gs.`map_styles`,
            gs.`map_heading`,
            gs.`map_description`,
            gs.`map_zoom_level`, 
            gs.`map_marker_latitude`, 
            gs.`map_marker_longitude`,
            gs.`booking_url`,
            gs.`gift_voucher_url`,
            gs.`tripadvisor_widget_code`,
            gs.`instagram_username`,
            gs.`instagram_client_id`,
            gs.`instagram_access_token`,
            gs.`booking_terms_and_conditions`,
            gs.`plantrip_description`,
            gs.`review_background`,
            gs.`home_photo`,
            gs.`skydive_combo_title`, 
            gs.`skydive_combo_description`, 
            gs.`pricing_section_title`, 
            gs.`pricing_section_description`, 
            gs.`footer_explore_photo`,
            gs.`footer_explore_caption`,
            gs.`footer_explore_url`,
            gs.`bg_skydive`,
            gs.`bg_reviews`,
            gs.`bg_activity`,
            gs.`activity_section_title`,
            gs.`activity_section_description`,
            gs.`home_secondary_video`,
            gs.`home_secondary_img`
            FROM
            `general_settings` gs
            WHERE
            gs.`id` = '1'
            LIMIT 1";
    
    return fetch_row($sql);

}

function fetchImportantPages()
{

    $sql = "SELECT ip.`imppage_name` AS name,
            pmd.`url`,
            pmd.`full_url`,
            pmd.`name` AS menu_name,
            pmd.`menu_label`,
            pmd.`title`,
            gp.`id` AS pg_id
        FROM
          `general_importantpages` ip
        LEFT JOIN
          `general_pages` gp ON(gp.`id` = ip.`page_id`)
        LEFT JOIN
          `page_meta_data` pmd ON(gp.`page_meta_data_id` = pmd.`id`)
        WHERE
          pmd.`status` = 'A' AND pmd.`url` != ''";

    $result = fetch_all($sql);

    $return_arr = array();

    foreach( $result as $key => $array )
    {

        $this_importantpage_url  = ($this_importantpage_name != '')  ? $array['url'] : 'home' ;

        $this_importantpage_name = strtolower(str_replace(' ','',$array['name']));

        $return_arr["impage_{$this_importantpage_name}"] = (object) array(
            'menu_label' => (($array['menu_label'])?$array['menu_label']:$array['menu_name']),
            'url' => $this_importantpage_url,
            'full_url' => $array['full_url'],
            'id' => $array['pg_id'],
            'title' => $array['title']
        );
    }



    return $return_arr;
}

$settings_arr = array_merge( fetchSettings(), fetchImportantPages() );

include "$incdir/formatSettings.php";

###############################################################################################################################
## Fetch Page Information
###############################################################################################################################

function get_content( $pg_meta_id )
{

    $output = '';
    
    if( $pg_meta_id )
    {

        $rows = fetch_all("SELECT `id` FROM `content_row` WHERE `page_meta_data_id` = '{$pg_meta_id}' ORDER BY `rank`");

        if( !empty($rows) )
        {
            foreach ($rows as $row)
            {
                $columns = fetch_all("SELECT `content`, `css_class` FROM `content_column` WHERE `content_row_id` = '{$row['id']}' ORDER BY `rank`");

                if( !empty($columns) )
                {
                    $output .= '<div class="row content-row">';
                    
                    foreach ($columns as $column)
                    {
                        $output .= '<div class="'.$column['css_class'].'">'.$column['content'].'</div>';
                    }
               
                    $output .= '</div>';
                }
            }
        }
    }

    return $output;
}

function fetchPageInfo( $pg_url )
{
    global $settings_arr;

    $sql = "SELECT pmd.`id` AS page_meta_id,
            gp.`id` AS page_id,
            gp.`is_category`,
            pmd.`menu_label`,
            pmd.`heading`,
            pmd.`sub_heading`,
            pmd.`introduction`,
            pmd.`url`,
            pmd.`full_url`,
            pmd.`description`,
            pmd.`quicklink_heading`,
            pmd.`photo`,
            pmd.`thumb_photo`,
            pmd.`photo_caption`,
            pmd.`title`,
            pmd.`meta_description`,
            pmi.`value` AS mrobots,
            gp.`parent_id`,
            pmd.`slideshow_id`,
            pmd.`gallery_id`,
            pmd.`jump_gallery_id`,
            gp.`template_id`,
            gp.`slideshow_type`,
            pmd.`og_title`,
            pmd.`og_meta_description`,
            pmd.`og_image`,
            pmd.`page_youtube_id`
        FROM
          `general_pages` gp
        LEFT JOIN
          `page_meta_data` pmd ON(pmd.`id` = gp.`page_meta_data_id`)
        LEFT JOIN
          `page_meta_index` pmi ON(pmi.`id` = pmd.`page_meta_index_id`)
        WHERE
          pmd.`url` = '{$pg_url}' AND pmd.`status` = 'A'
        LIMIT 1";


    $page_data = fetch_row($sql);

    if( !empty($page_data) )
    {
       $content              = get_content( $page_data['page_meta_id'] );   
       $content              = str_replace("&nbsp;", ' ', $content);     
       $page_data['content'] = $content;
    }

    return $page_data;
}

$page_home = $settings_arr['impage_home']->url;
$page_404  = $settings_arr['impage_404']->url;


$total_url_segments = count($uri_segments);
$ignore_urls        = array($settings_arr['impage_blog']->url);
$current_full_url   = implode('/', $uri_segments);
$page_index         = 0;

if( empty($uri_segments) )
{
    $page_url = $page_home;
  
}
elseif($total_url_segments > 0)
{
  
    for ($i=($total_url_segments - 1); $i >=0 ; $i--)
    { 
        $segment = $uri_segments[$i];
        
        $page_url = fetch_value("SELECT pmd.`url`
            FROM `general_pages` gp
            LEFT JOIN `page_meta_data` pmd
            ON(pmd.`id` = gp.`page_meta_data_id`)
            WHERE pmd.`url` = '{$segment}'
            AND pmd.`status` = 'A'
            LIMIT 1");

        if( $page_url )
        {
            break;
        }
    }
    
    if( $page_url ) {

        $page_index            = (array_search($page_url, $uri_segments) + 1);
        $page_options          = array_slice($uri_segments, $page_index);
        $page_options_full_url = implode('/', $page_options);
        
        if(!empty($page_options_full_url) && !in_array($page_url, $ignore_urls)){

            $pageIsCategory = fetch_value("SELECT gp.`id`
                FROM `general_pages` gp
                LEFT JOIN `page_meta_data` pmd
                ON(pmd.`id` = gp.`page_meta_data_id`)
                WHERE pmd.`full_url` = '/{$page_url}'
                AND pmd.`status` = 'A'
                LIMIT 1");

            if(!empty($pageIsCategory)){

                $page_options_full_url = $page_url;

            }
        }
       
        $is_valid_url = fetch_value("SELECT `id` FROM `page_meta_data`
            WHERE (`full_url` = '/{$current_full_url}' OR `full_url` = '/{$page_options_full_url}')
            AND `status` = 'A'
            LIMIT 1");
        

        if( !$is_valid_url && !in_array($page_url, $ignore_urls))
        {
            $page_url = $page_404;
            header("HTTP/1.1 404 Not Found");
        }

    }
    else
    {
        $page_url = $page_404;
        header("HTTP/1.1 404 Not Found");
    }

}

$page_arr = fetchPageInfo($page_url);


###############################################################################################################################
## Page Insert Tags
###############################################################################################################################

$formatted_arr = array_merge($page_arr, $settings_arr);


$tags_arr = array();

// Page Inserts
$page_title                 = $tags_arr['title']          = $formatted_arr['title'];                                              ## Metatag Title >> inc_formattemp.php
$tags_arr['og_title']       = ($formatted_arr['og_title']) ? $formatted_arr['og_title'] : $formatted_arr['title'];                                              ## Metatag Title >> inc_formattemp.php
$tags_arr['og_mdescr']      = ($formatted_arr['og_meta_description']) ? $formatted_arr['og_meta_description'] : $formatted_arr['meta_description'];  
$tags_arr['mdescr']         = $formatted_arr['meta_description'];                                   ## Metatag Description
$mrobots                    = $tags_arr['mrobots']                    = $formatted_arr['mrobots'];      ## Metatag Robots >> inc_formattemp.php
$tags_arr['mauthor']        = 'Tomahawk';                                                           ## Metatag Author
$heading                    = $tags_arr['heading']                    = $formatted_arr['heading'];
$introduction               = $tags_arr['introduction']               = $formatted_arr['introduction'];
$quicklink_heading          = $tags_arr['quicklink_heading']          = $formatted_arr['quicklink_heading'];
$sub_heading                = $tags_arr['sub_heading']                = $formatted_arr['sub_heading'];
$page_language_code         = $tags_arr['lang_iso_code']              = $formatted_arr['iso_code'];
$page_content               = $tags_arr['content']                    = $formatted_arr['content'];               ## Page Content

// Company/Website Inserts
$company_name = $company                    = $tags_arr['company']                    = $formatted_arr['company_name'];             ## Company Name
$tags_arr['copyright']      = $formatted_arr['copyright'];                                                       ## e.g. Copyright 2007 - 2010. Company. >> inc_formattemp.php
$tags_arr['credits']        = $formatted_arr['credits'];                                                         ## e.g. Website design by Webdirectionz @ Tomahawk >> inc_formattemp.php
$mainBookingUrl             = $tags_arr['booking_url']                 = $formatted_arr['booking_url'];         
$mainGiftVoucherUrl         = $tags_arr['gift_voucher_url']              = $formatted_arr['gift_voucher_url'];       

$company_email_address      = $tags_arr['company_email_address']       = $formatted_arr['email_address'];      ## Company email(s)
$phone_number               = $tags_arr['phone_number']                = $formatted_arr['phone_number'];
$free_phone_number          = $tags_arr['free_phone_number']           = $formatted_arr['free_phone_number'];
$skype_username             = $tags_arr['skype_username']              = $formatted_arr['skype_username'];
$company_address            = $tags_arr['company_address']             = nl2br($formatted_arr['address']);       ## Company address
$company_second_address     = $tags_arr['company_second_address']      = nl2br($formatted_arr['second_address']);       ## Company address
$comp_emails                = get_email_list($company_email_address);
$primary_email              = $tags_arr['primary_email'] = $comp_emails->primaryEmail;

$homepage_slideshow_caption = $tags_arr['homepage_slideshow_caption']  = $formatted_arr['homepage_slideshow_caption'];
$homepage_slideshow_url     = $tags_arr['homepage_slideshow_url']      = $formatted_arr['homepage_slideshow_url'];

$youtube_id                 = $formatted_arr['page_youtube_id'];
$youtubeVideoCaption        = $formatted_arr['homepage_caption'];

$mailchimp_api_key          = $tags_arr['mailchimp_api_key']           = $formatted_arr['mailchimp_api_key'];
$mailchimp_list_id          = $tags_arr['mailchimp_list_id']           = $formatted_arr['mailchimp_list_id'];

$mapHeading                 = $formatted_arr['map_heading'];
$mapAddress                 = $formatted_arr['map_address'];
$zoomLevel                  = $formatted_arr['map_zoom_level'];
$latitude                   = $formatted_arr['map_latitude'];
$longitude                  = $formatted_arr['map_longitude'];
$markerLatitude             = $formatted_arr['map_marker_latitude'];
$markerLongitude            = $formatted_arr['map_marker_longitude'];

$instagramUsername          = $formatted_arr['instagram_username'];
$instagramAccessToken       = $formatted_arr['instagram_access_token'];
$instagramClientId          = $formatted_arr['instagram_client_id'];

$bookingTermsAndConditions  = $formatted_arr['booking_terms_and_conditions'];

$footerExplorePhoto         = $tags_arr['footer_explore_photo']  = $formatted_arr['footer_explore_photo'];
$footerExploreCaption       = $tags_arr['footer_explore_caption']  = $formatted_arr['footer_explore_caption'];
$footerExploreURL           = $tags_arr['footer_explore_url']  = $formatted_arr['footer_explore_url'];

$bgSkydive                  = $tags_arr['bg_skydive']  = $formatted_arr['bg_skydive'];
$bgReviews                  = $tags_arr['bg_reviews']  = $formatted_arr['bg_reviews'];
$bgActivity                 = $tags_arr['bg_activity']  = $formatted_arr['bg_activity'];

$skydiveHeading             = $tags_arr['skydive_combo_title']  = $formatted_arr['skydive_combo_title'];
$skydiveDescription         = $tags_arr['skydive_combo_description']  = $formatted_arr['skydive_combo_description'];

$pricingSectionHeading      = $tags_arr['pricing_section_title']  = $formatted_arr['pricing_section_title'];
$pricingSectionDescription  = $tags_arr['pricing_section_description']  = $formatted_arr['pricing_section_description'];

$activitySectionHeading     = $tags_arr['activity_section_title']  = $formatted_arr['activity_section_title'];
$activitySectionDescription = $tags_arr['activity_section_description']  = $formatted_arr['activity_section_description'];

$homeContentVideo           = $tags_arr['home_secondary_video']  = $formatted_arr['home_secondary_video'];
$homeContentImg             = $tags_arr['home_secondary_img']  = $formatted_arr['home_secondary_img'];

/*
$adwards            = $tags_arr['adwords_code']       = ( !$is_local ) ? $formatted_arr['adwords_code'] : '';
$js_code_head_close = $tags_arr['js_code_head_close'] = ( !$is_local ) ? $formatted_arr['js_code_head_close'] : '';
$js_code_body_open  = $tags_arr['js_code_body_open']  = ( !$is_local ) ? $formatted_arr['js_code_body_open'] : '';
$js_code_body_close = $tags_arr['js_code_body_close'] = ( !$is_local ) ? $formatted_arr['js_code_body_close'] : ''; */

$adwards            = $tags_arr['adwords_code'] = $formatted_arr['adwords_code'];
$js_code_head_close = $tags_arr['js_code_head_close'] = $formatted_arr['js_code_head_close'];
$js_code_body_open  = $tags_arr['js_code_body_open']  = $formatted_arr['js_code_body_open'];
$js_code_body_close = $tags_arr['js_code_body_close'] = $formatted_arr['js_code_body_close']; 

$tags_arr['root']      = $htmlroot;                                                                     ## For use to direct the template to the root of the website for css, js & image files
$tags_arr['fromroot']  = $fromroot;

// Code Variables                                                 ## Variables with information about the current page
$main_page_id         = $page_id                                = $formatted_arr['page_id'];              ## Page Id
$meta_page_id         = $formatted_arr['page_meta_id']; 
$page_full_url        = $formatted_arr['full_url'];              ## Full Url
$page                 = $page_url                               = $formatted_arr['url'];
$isCategoryPage       = $formatted_arr['is_category'];
$template_id          = $formatted_arr['template_id'];          ## Template Id
$slideshow_type       = $formatted_arr['slideshow_type'];    

$page_parent_id       = $formatted_arr['parent_id'];            ## Page Parent Id
$absparent_id         = getAbsoluteParentId($page_id);          ## Absolute Parent Id
$slideshow_id         = $formatted_arr['slideshow_id'];         ## Slideshow Id
$gallery_id           = $formatted_arr['gallery_id'];           ## gallery Id
$jump_gallery_id      = $formatted_arr['jump_gallery_id'];      ## Jump gallery Id
$page_photo           = ($formatted_arr['photo']) ? $formatted_arr['photo'] : '';
$page_thumb_photo     = ($formatted_arr['thumb_photo']) ? $formatted_arr['thumb_photo'] : '';
$page_photo_caption   = ($formatted_arr['photo_caption']) ? $formatted_arr['photo_caption'] : '';
$page_menu_label      = $formatted_arr['menu_label'];
//$page_youtube_id      = $formatted_arr['youtube_id'];
$og_page_photo        = (is_file("{$rootfull}{$formatted_arr['og_image']}")) ? $formatted_arr['og_image'] : $page_photo;
$tags_arr['og_image'] = ($og_page_photo) ? "{$htmlroot}{$og_page_photo}" : '';
$tags_arr['og_url']   = "{$htmlroot}{$_SERVER['REQUEST_URI']}";

###### Dynamically generated page segments/options ##########
$segment1 = ${"option{$page_index}"};
$segment2 = ${"option".($page_index+1)};
$segment3 = ${"option".($page_index+2)};
$segment4 = ${"option".($page_index+3)};

$number_of_module_tags   = fetch_value("SELECT tn.`tmpl_nummoduletags`
    FROM `templates_normal` tn
    WHERE tn.`tmpl_id` = '$template_id'");

// Important Pages
$page_home              = $formatted_arr['impage_home'];
$page_contact           = $formatted_arr['impage_contact'];
$page_blog              = $formatted_arr['impage_blog'];
$page_reviews           = $formatted_arr['impage_reviews'];
$page_gallery           = $formatted_arr['impage_gallery'];
$page_404               = $formatted_arr['impage_404'];
$page_specials          = $formatted_arr['impage_specials'];
$page_combodeals        = $formatted_arr['impage_combodeals'];
$page_pricing           = $formatted_arr['impage_pricing'];

$page_booking           = $formatted_arr['impage_booking'];

$page_chinesepage       = $formatted_arr['impage_chinesepage']; 
$page_koreanpage        = $formatted_arr['impage_koreanpage'];
$page_japanesepage      = $formatted_arr['impage_japanesepage'];


// Initializing Empty Tags                                              ## Tags made for later use
$tags_arr['book_now']                 = '';
$tags_arr['scripts-load-top']         = '';
$tags_arr['style-int']                = '';                                   ## Position held for internal styles
$tags_arr['style-ext']                = '';                                   ## Position held for external styles
$tags_arr['script-ext']               = '';                                   ## Position held for external scripts
$tags_arr['script-onload']            = '';                                   ## Position held for onload scripts
$tags_arr['module']                   = '';
$tags_arr['body_cls']                 = '';
$tags_arr['mod_view']                 = '';
$tags_arr['script-inline']            = '';
$tags_arr['body_html']                = '';
$tags_arr['heading_after_view']       = ''; 
$tags_arr['footer_blog_view']         = '';

$tags_arr['main_cls']                 = '';
$tags_arr['main_intro_cls']           = 'col-xs-12 col-md-10 col-md-offset-1';
$tags_arr['main_content_cls']         = 'col-xs-12';
$tags_arr['main_section_cls']         = '';
$tags_arr['main_section_heading']     = '';

$tags_arr['main_content_left_cls']    = 'col-xs-12 col-md-12';
$tags_arr['main_content_right_cls']   = 'col-xs-12 col-md-12';

$tags_arr['home_content_video']       = '';
$tags_arr['home_content_booking_btn'] = '';

$tags_arr['instagram_view']           = '';
$tags_arr['testimonial_view']         = '';
$tags_arr['cta_view']                 = '';  
$tags_arr['buttons']                  = ''; 
$tags_arr['price']                    = ''; 
$tags_arr['mod_extra_view']           = ''; 
$tags_arr['quicklinks_view']          = ''; 
$tags_arr['photos_view']              = '';
$tags_arr['page-content']             = '';
$tags_arr['section-header-cls']       = '';
$tags_arr['section-text-cls']         = '';
$tags_arr['btn_back_to_deals']        = '';


// Template assets file paths
$tags_arr['favicon_path']   = get_file_path('/favicon.ico');
$tags_arr['css_path']       = get_file_path('/assets/css/'.(($is_local) ? '_main_xl.css' : 'main.css'));
$tags_arr['modernizr_path'] = get_file_path('/assets/js/libs/min/modernizr-2.8.3.min.js');
$tags_arr['vender_js_path'] = get_file_path('/assets/js/libs/min/vendor.js');
$tags_arr['js_path']        = get_file_path('/assets/js/'.(($is_local) ? 'unmin/main.js' : 'min/main.js'));

$tags_arr['ex_meta_taga'] = '';
/*
$tags_arr['ex_meta_taga'] = <<< H
<meta name="robots" content="{$mrobots}">
\t<meta name="googlebot" content="{$mrobots}">
H;
*/

$jsVars = array(
    'globals' => array(
        'slideshowSpeed' => $formatted_arr['slideshow_speed']
    )
);


###############################################################################################################################
## COMMON View 
###############################################################################################################################

if(!empty($introduction)){
    $introduction  = str_replace("&nbsp;", ' ', $introduction);
    $tags_arr['introduction'] = '<p class="main__intro--desc">'.$introduction.'</p>';
}


$newsletter_view = '';

if( $mailchimp_api_key &&  $mailchimp_api_key )
{
    $newsletter_view = '<div class="newsletter__wrapper">
        <h3 class="section__heading footer__heading">Our NEWSLETTER</h3>
        <form action="#" id="news-signup-form" method="post">
            <div class="form-group">
                <input type="email" class="form-control" name="signup-email" id="signup-email" placeholder="Enter your email" autocomplete="off">
            </div>
            <div class="form-group">
                <button type="submit" id="newsletter-submit" name="signup" value="singup" class="btn btn__red btn--full-width">SIGN UP NOW</button>
            </div>
            <p class="msg"></p>
        </form>
    </div>';
}

$tags_arr['newsletter_view'] = $newsletter_view;


$footerContactView = '';
$footerContactView .= '<h3 class="section__heading footer__heading">Get in TOUCH</h3>';
//$footerContactView .= (!empty($free_phone_number)) ? '<p><a href="tel:'.$phone_number.'" class="footer__link">'.$free_phone_number.'</a></p>' : '';
$footerContactView .= (!empty($phone_number)) ? '<p><a href="tel:'.$phone_number.'" class="footer__link">'.$phone_number.'</a></p>' : '';
$footerContactView .= (!empty($company_email_address)) ? '<p><a href="mailto:'.$company_email_address.';" class="footer__link footer__link--email">' . $company_email_address.'</a></p>' : '';
$footerContactView .= (!empty($company_address)) ? '<p>'.$company_address.'</p>' : '';
$footerContactView .= (!empty($company_second_address)) ? '<p>'.$company_second_address.'</p>' : '';

$tags_arr['footer_contact_view'] = $footerContactView;

if($page_id !== $page_home->id){
    $tags_arr['body_cls'] .= ' general-pages';
} else{
    $tags_arr['body_cls'] .= ' home';
}

$tags_arr['phone']    = 'tel:'.$phone_number;

###############################################################################################################################
## FLAG DROPDOWN
###############################################################################################################################
$krFlagLink = '';
$jpFlagLink = '';
$cnFlagLink = '';
$enFlagLink = '';

$arrFlagURLs = array();

if(!empty($page_chinesepage->full_url)){
    $cnFlagLink = <<<HTML
        <li>
            <a href="https://www.skydivebayofislands.com/zh" target="_blank">
                <span class="secondary-nav__flag-item flag-cn flag-switch" data-flag="cn"></span>
            </a>
        </li>
HTML;

    $arrFlagURLs['cn'] = $page_chinesepage->full_url;

}

if(!empty($page_koreanpage->full_url)){
    $krFlagLink = <<<HTML
        <li>
            <a href="{$page_koreanpage->full_url}">
                <span class="secondary-nav__flag-item flag-kr flag-switch" data-flag="kr"></span>
            </a>
        </li>
HTML;

    $arrFlagURLs['kr'] = $page_koreanpage->full_url;
}

if(!empty($page_japanesepage->full_url)){
    $jpFlagLink = <<<HTML
        <li>
            <a href="{$page_japanesepage->full_url}">
                <span class="secondary-nav__flag-item flag-jp flag-switch" data-flag="jp"></span>
            </a>
        </li>
HTML;

    $arrFlagURLs['jp'] = $page_japanesepage->full_url;

}

if(!empty($page_home->full_url)){
    $enFlagLink = <<<HTML
        <li>
            <a href="{$page_home->url}">
                <span class="secondary-nav__flag-item flag-en flag-switch" data-flag="en"></span>
            </a>
        </li>
HTML;
}


$flagKey  = 'en';

if(in_array($page_full_url, $arrFlagURLs)){
   
    $flagKey = array_search($page_full_url, $arrFlagURLs);

}


$languageFlag = <<<HTML
    <a href="javascript:;" class="secondary-nav__flag-handler">
        <span class="secondary-nav__flag-item flag-{$flagKey} flag-switch" data-flag="{$flagKey}"></span> <i class="fa fa-angle-down secondary-nav__flag__icon"></i>
    </a>
    <ul class="flag-dropdown">
        {$cnFlagLink}
        <!--{$krFlagLink}
        {$jpFlagLink}
        {$enFlagLink}-->
    </ul>
HTML;

//$languageFlag = ''; //comented to go live -> Courtney asked

$tags_arr['language-select'] = '<div class="secondary-nav__flag">'
            .$languageFlag.
            '</div>';

$tags_arr['language-select-mobile'] = '<div class="secondary-nav__flag secondary-nav__flag--mobile">'
            .$languageFlag.
            '</div>';

$tags_arr['gallery-link'] = $page_gallery->full_url;

###############################################################################################################################
## FOOTER EXPLORE VIEW
###############################################################################################################################
$tags_arr['footer_explore_view']     = '';

if(!empty($footerExploreURL) && !empty($footerExploreCaption) && !empty($footerExplorePhoto)){

    $footerExploreView = <<<HTML
        <h3 class="section__heading footer__heading">Travelling South?</h3>
        <article class="footer__item">
            <div class="footer__item__img">
                <a href="{$footerExploreURL}" title="Explore" class="zoom__wrapper rounded__border">
                    <span style="background-image:url({$footerExplorePhoto})" class="zoom"></span>
                </a>
            </div>
            <div class="footer__item__content">
                <h2 class="footer__item__heading">{$footerExploreCaption}</h2>
                <p class="footer__item__btn"><a href="{$footerExploreURL}" title="Explore" class="btn btn--link" target="_blank">Explore</a></p>
            </div>              
        </article>
HTML;
    
    $tags_arr['footer_explore_view']     = $footerExploreView;

}

###############################################################################################################################
## HOME PAGE CONTENT VIEW
###############################################################################################################################

if($page == $page_home->url){

    $tags_arr['main_section_heading'] .= <<<HTML
        <header class="section__header section__header--bg">
            <h2 class="section__heading section__heading--yellow">
                <span>Go</span> JUMP
            </h2>
        </header> 
HTML;

    if(!empty($homeContentVideo) && !empty($homeContentImg)){
        $tags_arr['main_content_left_cls']          = 'col-md-7 home-content';
        $tags_arr['main_content_right_cls']         = 'col-md-5';

        $tags_arr['home_content_video'] = <<<HTML
            <div class="content__video__wrapper bg--yellow rounded__border">
                <a href="" class="content__video__link zoom__wrapper" data-toggle-popup="#content__video">
                    <span class="content__video zoom" style="background-image: url({$homeContentImg})"></span>
                    <span class="content__video__icon"><i class="glyphicons glyphicons-play"></i></span>
                </a>
            </div>
HTML;
        $tags_arr['body_html'] .= <<<HTML
        <div class="popup" id="content__video" tabindex="-1" role="dialog">
            <a class="close" href="#content__video"><i class="fa fa-times"></i></a>
            <iframe width="100%" height="97%" class="modal__video" data-src="https://www.youtube.com/embed/{$homeContentVideo}?rel=0&amp;version=3&amp;autoplay=1&amp;controls=1&amp;showinfo=0&amp;loop=0" frameborder="0"></iframe>
        </div>
HTML;

    }

    if(!empty($mainBookingUrl)){
          $tags_arr['home_content_booking_btn']  = <<<HTML
            <p class="btn-outer">
                <a href="{$mainBookingUrl}" class="btn btn__red" target="_blank">Book Now</a>
            </p>
HTML;
    }

    ## HOME PAGE CTA View
    $tags_arr['cta_view'] = <<<HTML
        <section class="section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="cta___wrapper">
                            <span class="cta__badge"></span>
                            <h3 class="cta__heading">Free Pickup &amp; drop off</h3>
                            <p class="cta__caption">Within the Bay of Islands</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
HTML;


}

###############################################################################################################################
## Booking Button Views
###############################################################################################################################
$tags_arr['booking-btn-mob']     = ''; 
$tags_arr['booking-btn-main']    = ''; 

if(!empty($mainBookingUrl)){

    $tags_arr['booking-btn-mob'] = <<<HTML
        <a href="{$mainBookingUrl}" class="btn btn__wide_orange header__btn header__btn--sml" target="_blank">Book Now <i class="arrow arrow--white"></i></a>
HTML;

   $tags_arr['booking-btn-main'] = <<<HTML
        <div class="primary-nav__btn">                           
            <a href="{$mainBookingUrl}" class="btn header__btn hidden-xs hidden-sm" target="_blank">Book Now</a>
        </div>
HTML;

}
###############################################################################################################################
## Gift Voucher Button Views
###############################################################################################################################
$tags_arr['gift-voucher-btn-mob']    = ''; 
$tags_arr['gift-voucher-btn-main']   = ''; 

if(!empty($mainGiftVoucherUrl)){

    $tags_arr['gift-voucher-btn-mob'] = <<<HTML
        <div class="nav__gift-voucher">
            <a href="{$mainGiftVoucherUrl}" class="header__link" target="_blank"><i class="fas fa-gift"></i> Gift Voucher</a>
        </div>
HTML;

    $tags_arr['gift-voucher-btn-main'] = <<<HTML
        <a href="{$mainGiftVoucherUrl}" class="header__link hidden-xs hidden-sm" target="_blank"><i class="fas fa-gift"></i> Gift Voucher</a>
HTML;
}

?>
