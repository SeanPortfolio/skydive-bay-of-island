<?php
## ----------------------------------------------------------------------------------------------------------------------
## NetZone 1.0
## inc_settings.php
##
## Author: Ton Jo Immanuel, Tomahawk Brand Management Ltd.
## Date: 19 April 2010
##
## Manage Settings
##
##
## ----------------------------------------------------------------------------------------------------------------------
function do_main()
{

    global $message,$valid,$htmladmin,$scripts_onload,$main_heading, $incdir;

    $action     = $_REQUEST['action'];

    $main_heading = 'General Settings';

    switch ($action) {

        case 'save':

            $return = save_item();
            break;

    }
    
    if ($message != "") {

        $page_contents .= <<< HTML
          <div class="alert alert-warning page">
             <i class="glyphicon glyphicon-info-sign"></i>
              <strong>$message</strong>
          </div>
HTML;
    

    }

    $sql = "SELECT `id`,
              `company_name`,
              `start_year`,
              `email_address`,
              `phone_number`,
              `free_phone_number`,
              `address`,
              `second_address`,
              `booking_url`,
              `gift_voucher_url`,
              `js_code_head_close`,
              `js_code_body_open`,
              `js_code_body_close`,
              `adwords_code`,
              `mailchimp_api_key`,
              `mailchimp_list_id`,
              `map_latitude`,
              `map_longitude`,
              `map_address`,
              `map_styles`,
              `map_heading`,
              `map_description`,
              `map_zoom_level`,
              `map_marker_latitude`,
              `map_marker_longitude`,
              `slideshow_speed`,
              `set_sitemapupdated`,
              `set_sitemapstatus`,
              `homepage_slideshow_caption`,
              `tripadvisor_widget_code`,
              `youtube_id`,
              `homepage_caption`,
              `instagram_username`,
              `instagram_client_id`,
              `instagram_access_token`,
              `booking_terms_and_conditions`,
              `plantrip_description`,
              `review_background`,
              `home_photo`,
              `skydive_combo_title`,
              `skydive_combo_description`,
              `pricing_section_title`,
              `pricing_section_description`,
              `footer_explore_photo`,
              `footer_explore_caption`,
              `footer_explore_url`,
              `mobile_heroshot`,
              `bg_skydive`,
              `bg_reviews`,
              `bg_activity`,
              `activity_section_title`,
              `activity_section_description`,
              `home_secondary_video`,
              `home_secondary_img`
        FROM `general_settings`
        WHERE `id` = '1'
        LIMIT 1";

    $row = fetch_row($sql);

    extract($row);

    $map_latitude         = ( $map_latitude != 0 ) ? $map_latitude : '';
    $map_longitude        = ( $map_longitude != 0 ) ? $map_longitude : '';
    $map_zoom_level       = ( $map_zoom_level ) ? $map_zoom_level : 12;
    $map_address          = ( $map_address ) ? $map_address : $address;
    $map_marker_latitude  = ( $map_marker_latitude != 0 ) ? $map_marker_latitude : '';
    $map_marker_longitude = ( $map_marker_longitude != 0 ) ? $map_marker_longitude : '';


    ##------------------------------------------------------------------------------------------------------
    ## Page functions

    $page_functions = <<< HTML
        <ul class="page-action">
            <li><button type="button" class="btn btn-default" onclick="submitForm('save',1)"><i class="glyphicon glyphicon-floppy-save"></i> Save</button></li>
        </ul>
HTML;

// Social Icons

 $social_icons = fetch_all("SELECT `id`, `label`, `url`, `widget_blob`, `has_widget` FROM `social_links` WHERE `is_active` = '1' ORDER BY `rank`");

    if(count($social_icons) > 0)
    {
        $links = '';
        foreach ($social_icons as $index => $social_icon)
        {
            $index++;

            if($social_icon['has_widget'])
            {
                $input = '<textarea style="width:700px;height:150px;" name="social-item[]" >'.$social_icon['widget_blob'].'</textarea>';
            }
            else
            {
                $input = '<input type="text" style="width:700px" name="social-item[]" value="'.$social_icon['url'].'" id="social-item-'.$index.'">';
            }
           $links .= <<< H
            <tr>
                <td width="150" valign="top"><label for="social-item-$index">{$social_icon['label']}</label></td>
                <td>
                    <input type="hidden" name="social-item-id[]" value="{$social_icon['id']}">
                    <input type="hidden" name="social-item-has-wdge[]" value="{$social_icon['has_widget']}">
                    $input
                </td>
            </tr>
H;
        }
    
    $social_links = <<< H
    
<table width="100%" border="0" cellspacing="0" cellpadding="4">
    $links
</table>

H;

}
else
{
    $social_links = '';
}


    ##------------------------------------------------------------------------------------------------------
    ## Important Pages


    $sql = "SELECT `imppage_name`, `imppage_id`, `page_id`
        FROM `general_importantpages`
        WHERE `imppage_showincms` = 'Y'";

    $imppages_arr = fetch_all($sql);

    $imppages_list = '<table cellspacing="0" cellpadding="5" border="0">';
    foreach($imppages_arr as $key => $array)
    {
        $imppage_name = ucwords($array['imppage_name']);
        $page_id      = $array['page_id'];
        $imppage_id   = $array['imppage_id'];

        $pages_select = page_list(false, 0, $page_id);

        $imppages_list .= <<< HTML
            <tr>
                <td>$imppage_name <input type="hidden" name="imppage_id[]" value="$imppage_id"/></td>
                <td>
                    <select name="page_id[]">
                        <option value="">--select--</option>
                        $pages_select
                    </select>
                </td>
            </tr>
HTML;
    }
    $imppages_list .= <<< HTML
        </table>
HTML;



   
    ##------------------------------------------------------------------------------------------------------
    ## Details Content
    $companydetails_content = <<< HTML
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr>
                <td width="180"><label for="company_name">Company name</label></td>
                <td><input name="company_name" id="company_name" type="text" value="{$company_name}" style="width:350px;" /></td>
            </tr>
            <tr>
                <td><label for="phone_number">Phone Number</label></td>
                <td>
                    <input name="phone_number" type="text" value="{$phone_number}" style="width:150px;" id="phone_number" />
                </td>
            </tr>
            <tr style="display: none;">
                <td><label for="free_phone_number">Free Phone Number</label></td>
                <td>
                    <input name="free_phone_number" type="text" value="{$free_phone_number}" style="width:150px;" id="free_phone_number" />
                </td>
            </tr>
            <tr>
                <td><label for="start_year">Start year</label></td>
                <td><input name="start_year" type="text" value="{$start_year}" style="width:150px;" id="start_year" /></td>
            </tr>
            <tr>
                <td><label for="slideshow_speed">Slideshow Speed</label></td>
                <td><input name="slideshow_speed" type="text" value="{$slideshow_speed}" style="width:150px;" id="slideshow_speed" /> <strong>&nbsp;milliseconds</strong></td>
            </tr>
            <tr>
                <td><label for="booking_url">Booking URL</label></td>
                <td><input name="booking_url" type="text" value="{$booking_url}" style="width:350px;" id="booking_url" /></td>
            </tr>
             <tr>
                <td><label for="gift_voucher_url">Gift Voucher URL</label></td>
                <td><input name="gift_voucher_url" type="text" value="{$gift_voucher_url}" style="width:350px;" id="gift_voucher_url" /></td>
            </tr>
            <!--<tr>
                <td><label for="homepage_slideshow_caption">Homepage Slideshow Caption</label></td>
                <td><input name="homepage_slideshow_caption" id="homepage_slideshow_caption" type="text" value="{$homepage_slideshow_caption}" style="width:350px;" /></td>
            </tr>-->
            <tr>
                <td valign="top"><label for="email_address">Email(s)</label> <span data-title="Separate multiple email addresses with a semicolon ( ; )" data-placement="right" data-toggle="tooltip"></span></td>
                <td><textarea name="email_address" style="width:350px;min-height:100px;">{$email_address}</textarea></td>
            </tr>
            <tr>
                <td valign="top"><label for="address">Address</label></td>
                <td><textarea name="address" style="width:350px;min-height:100px;">{$address}</textarea></td>
            </tr>
            <tr>
                <td valign="top"><label for="second_address">2nd Address</label></td>
                <td><textarea name="second_address" style="width:350px;min-height:100px;">{$second_address}</textarea></td>
            </tr>
            <tr style="display: none;">
                <td valign="top"><label for="plantrip_description">Plan your trip Description</label></td>
                <td><textarea name="plantrip_description" style="width:350px;min-height:100px;">{$plantrip_description}</textarea></td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
        </table>

HTML;

##------------------------------------------------------------------------------------------------------
    ## Home Content
    $generalDetailsContent = <<< HTML
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr>
                <td colspan="2" style="padding-bottom: 20px;"><h2 style="color: #000;"><strong>Homepage Content</strong></h2></td>
            </tr> 
            <tr>
                <td><label for="homepage_caption">Main Video Caption</label></td>
                <td><input name="homepage_caption" id="homepage_caption" type="text" value="{$homepage_caption}" style="width:350px;" /></td>
            </tr>
            <tr>
                <td><label for="home_secondary_video">Content Video</label></td>
                <td><input name="home_secondary_video" id="home_secondary_video" type="text" value="{$home_secondary_video}" style="width:150px;" /></td>
            </tr>

            <tr>
                <td width="130"><label for="favicon_url">Content Video Photo:</label></td>
                <td>
                    <input name="home_secondary_img" type="text" value="{$home_secondary_img}" style="width:280px;" id="home_secondary_img" readonly autocomplete="off">
                    <input type="button" value="browse" onclick="openFileBrowser('home_secondary_img')"> 
                    <input type="button" value="clear" onclick="clearValue('home_secondary_img')"><br>
                </td>    
            </tr>
            
            <tr><td colspan="2"><hr style="border-top: 1px solid #d5d5d5;"></td></tr>
            <tr>
                <td colspan="2" style="padding-bottom: 20px;"><h2 style="color: #000;"><strong>Footer Explore Content</strong></h2></td>
            </tr> 
            <tr>
                <td width="200"><label for="footer_explore_photo">Explore Photo:</label></td>
                <td>
                    <input name="footer_explore_photo" type="text" value="{$footer_explore_photo}" style="width:350px;" id="footer_explore_photo" readonly autocomplete="off">
                    <input type="button" value="browse" onclick="openFileBrowser('footer_explore_photo')"> 
                    <input type="button" value="clear" onclick="clearValue('footer_explore_photo')"><br>
                </td>
            </tr> 
            <tr>
                <td><label for="footer_explore_caption">Explore Caption</label></td>
                <td><input name="footer_explore_caption" id="footer_explore_caption" type="text" value="{$footer_explore_caption}" style="width:550px;" /></td>
            </tr>
            <tr>
                <td><label for="footer_explore_url">Explore Url</label></td>
                <td><input name="footer_explore_url" id="footer_explore_url" type="text" value="{$footer_explore_url}" style="width:550px;" /></td>
            </tr>
            <tr><td colspan="2"><hr style="border-top: 1px solid #d5d5d5;"></td></tr>
            <tr>
                <td colspan="2" style="padding-bottom: 20px;"><h2 style="color: #000;"><strong>Section Background</strong></h2></td>
            </tr> 
            <tr>
                <td width="200"><label for="bg_skydive">Skydive Section Background:</label></td>
                <td>
                    <input name="bg_skydive" type="text" value="{$bg_skydive}" style="width:350px;" id="bg_skydive" readonly autocomplete="off">
                    <input type="button" value="browse" onclick="openFileBrowser('bg_skydive')"> 
                    <input type="button" value="clear" onclick="clearValue('bg_skydive')"><br>
                </td>
            </tr> 
            <tr>
                <td width="200"><label for="bg_reviews">Reviews Section Background:</label></td>
                <td>
                    <input name="bg_reviews" type="text" value="{$bg_reviews}" style="width:350px;" id="bg_reviews" readonly autocomplete="off">
                    <input type="button" value="browse" onclick="openFileBrowser('bg_reviews')"> 
                    <input type="button" value="clear" onclick="clearValue('bg_reviews')"><br>
                </td>
            </tr>
            <tr>
                <td width="200"><label for="bg_activity">Activity Packages Background:</label></td>
                <td>
                    <input name="bg_activity" type="text" value="{$bg_activity}" style="width:350px;" id="bg_activity" readonly autocomplete="off">
                    <input type="button" value="browse" onclick="openFileBrowser('bg_activity')"> 
                    <input type="button" value="clear" onclick="clearValue('bg_activity')"><br>
                </td>
            </tr> 
            <tr><td colspan="2"><hr style="border-top: 1px solid #d5d5d5;"></td></tr>
            <tr>
                <td colspan="2" style="padding-bottom: 20px;"><h2 style="color: #000;"><strong>Combo & Deals Section</strong></h2></td>
            </tr> 
            <tr>
                <td><label for="skydive_combo_title">Title</label></td>
                <td><input name="skydive_combo_title" id="skydive_combo_title" type="text" value="{$skydive_combo_title}" style="width:350px;" /></td>
            </tr>
            <tr>
                <td><label for="skydive_combo_description">Description</label></td>
                <td><input name="skydive_combo_description" id="skydive_combo_description" type="text" value="{$skydive_combo_description}" style="width:350px;" /></td>
            </tr>
            <tr><td colspan="2"><hr style="border-top: 1px solid #d5d5d5;"></td></tr>
            <tr>
                <td colspan="2" style="padding-bottom: 20px;"><h2 style="color: #000;"><strong>Pricing Section</strong></h2></td>
            </tr> 
            <!--<tr>
                <td><label for="pricing_section_title">Title</label></td>
                <td><input name="pricing_section_title" id="pricing_section_title" type="text" value="{$pricing_section_title}" style="width:350px;" /></td>
            </tr>-->
            <tr>
                <td><label for="pricing_section_description">Description</label></td>
                <td><input name="pricing_section_description" id="pricing_section_description" type="text" value="{$pricing_section_description}" style="width:350px;" /></td>
            </tr>
        </table>

HTML;




    ##------------------------------------------------------------------------------------------------------
    ## Important pages Content
    $importantpages_content = <<< HTML
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr>
                <td colspan="4">$imppages_list</td>
            </tr>
        </table>
HTML;



    ##------------------------------------------------------------------------------------------------------
    ## Developer Content
    $developer_content = <<< HTML
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr>
                <td valign="top"><label for="js_code_head_close">Head tag insert (close)</label></td>
                <td valign="top">
                    <textarea name="js_code_head_close" style="width:720px; height:150px;resize:none;" id="js_code_head_close">{$js_code_head_close}</textarea>
                    <span data-toggle="tooltip" data-placement="left" data-title="Insert code before closing head tag e.g Google Analytics, Facebook Pixel"></span>
                </td>
            </tr>
            <tr>
                <td valign="top"><label for="js_code_body_open">Body tag insert (open)</label></td>
                <td valign="top">
                    <textarea name="js_code_body_open" style="width:720px; height:150px;resize:none;" id="js_code_body_open">{$js_code_body_open}</textarea>
                    <span data-toggle="tooltip" data-placement="left" data-title="Insert code after opening body tag e.g Google Analytics, Facebook Pixel"></span>
                </td>
            </tr>
            <tr>
                <td valign="top"><label for="js_code_body_close">Body tag insert (close)</label></td>
                <td valign="top">
                    <textarea name="js_code_body_close" style="width:720px; height:150px;resize:none;" id="js_code_body_close">{$js_code_body_close}</textarea>
                    <span data-toggle="tooltip" data-placement="left" data-title="Insert code before closing body tag e.g Google Analytics, Facebook Pixel"></span>
                </td>
            </tr>
            <tr>
                <td valign="top"><label for="adwords_code">AdWords Tracking Code</label></td>
                <td valign="top">
                    <textarea name="adwords_code" style="width:720px; height:150px;resize:none;" id="adwords_code">{$adwords_code}</textarea>
                    <span data-toggle="tooltip" data-placement="left" data-title="Google AdWords Tracking Code"></span>
                </td>
            </tr>
        </table>
HTML;

$widgets_content = <<< HTML
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
                <tr>
                    <td style="vertical-align:top;">Trip Advisor Widget</td>
                    <td colspan="3">
                        <textarea name="tripadvisor_widget" style="width:790px; height:200px;">$tripadvisor_widget</textarea>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;">Facebook Widget</td>
                    <td colspan="3">
                        <textarea name="facebook_widget" style="width:790px; height:200px;">$facebook_widget</textarea>
                    </td>
                </tr>
            </table>
HTML;

$mailchimp_details = <<< HTML
    <table width="100%" border="0" cellspacing="0" cellpadding="4">
       
        <tr>
            <td width="150"><label for="mailchimp_list_id">List ID</label></td>
            <td><input name="mailchimp_list_id" type="text" value="{$mailchimp_list_id}" style="width:150px;" id="mailchimp_list_id" /></td>
        </tr>
        <tr>
            <td width="150"><label for="mailchimp_api_key">API Key</label></td>
            <td><input name="mailchimp_api_key" type="text" value="{$mailchimp_api_key}" style="width:350px;" id="mailchimp_api_key" /></td>
        </tr>
    </table>

HTML;

$instagramDetails = <<< HTML
    <table width="100%" border="0" cellspacing="0" cellpadding="4">
       
        <tr>
            <td width="200"><label for="instagram_username">User Name</label></td>
            <td><input name="instagram_username" type="text" value="{$instagram_username}" style="width:150px;" id="instagram_username" /></td>
        </tr>
        <tr>
            <td width="200"><label for="instagram_client_id">Client ID</label></td>
            <td><input name="instagram_client_id" type="text" value="{$instagram_client_id}" style="width:350px;" id="instagram_client_id" /></td>
        </tr>
        <tr>
            <td width="200"><label for="instagram_access_token">Access Token</label></td>
            <td><input name="instagram_access_token" type="text" value="{$instagram_access_token}" style="width:350px;" id="instagram_access_token" /></td>
        </tr>
    </table>

HTML;

$bookingTermsAndConditions = <<< HTML

<table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
        <td>
            <textarea name="booking_terms_and_conditions" id="booking_terms_and_conditions" class="check-max" style="width:700px;min-height:100px;" maxlength="200">$booking_terms_and_conditions</textarea>
            <script>
                CKEDITOR.replace( 'booking_terms_and_conditions',
                {
                    toolbar : 'MyToolbar',
                    forcePasteAsPlainText : true,
                    resize_enabled : false,
                    height : 500,
                    filebrowserBrowseUrl : jsVars.dataManagerUrl
                });               
            </script>
        </td>
    </tr>
</table>

HTML;

$map_contents = <<< HTML

    <table width="100%" border="0" cellspacing="0" cellpadding="6">
        <tr>
            <td width="100"><label for="map_heading">Marker Title</label></td>
            <td>
                <input type="text" style="width:350px;" id="map_heading" name="map_heading" value="{$map_heading}">
            </td>
        </tr>
        <tr>
            <td width="100"><label for="map_address">Map Address</label></td>
            <td>
                <input type="text" style="width:350px;" id="map_address" name="map_address" value="{$map_address}">
                <button type="button" id="get-map-address">Search</button>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="gmap-canvas">
                    <h3 style="font-size:18px;color:#000;padding:10px;font-weight:700;margin:0;">Loading map...</h3>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="hidden" id="map_latitude" name="map_latitude" value="{$map_latitude}">
                <input type="hidden" id="map_longitude" name="map_longitude" value="{$map_longitude}">
                <input type="hidden" id="map_zoom_level" name="map_zoom_level" value="{$map_zoom_level}">
                <input type="hidden" id="map_marker_latitude" name="map_marker_latitude" value="{$map_marker_latitude}">
                <input type="hidden" id="map_marker_longitude" name="map_marker_longitude" value="{$map_marker_longitude}">
                <textarea name="map_styles" id="map_styles" class="hidden">{$map_styles}</textarea>
            </td>
        </tr>
    </table>
HTML;

    $scripts_ext .= '<script src="https://maps.google.com/maps/api/js?key=AIzaSyCqeRCfbUFp9cDWpnZPu1B8AnNnLCT9ZjQ"></script>';
    $scripts_ext .= '<script src="'.$htmladmin.'/js/general-map.js?v=1"></script>';

    // require_once

    ##------------------------------------------------------------------------------------------------------
    ## tab arrays and build tabs

    $temp_array_menutab = array();
    
    $temp_array_menutab ['Company Details']    = $companydetails_content;
    $temp_array_menutab ['Google Map']         = $map_contents;
    $temp_array_menutab ['General Details']    = $generalDetailsContent;
    $temp_array_menutab ['MailChimp Details']  = $mailchimp_details;
    $temp_array_menutab ['Instagram Details']  = $instagramDetails;
    $temp_array_menutab ['Social Links']       = $social_links;
    //$temp_array_menutab ['Booking T&C']        = $bookingTermsAndConditions;
    $temp_array_menutab ['Important Pages']    = $importantpages_content;
    $temp_array_menutab ['Template Code']      = $developer_content;
    

    $counter = 0;
    $tablist ="";
    $contentlist="";

    foreach($temp_array_menutab as $key => $value){

        $tablist.= "<li><a href=\"#tabs-".$counter."\">".$key."</a></li>";

        $contentlist.=" <div id=\"tabs-".$counter."\">".$value."</div>";

        $counter++;
    }

    $tablist="<div id=\"tabs\"><ul>".$tablist."</ul><div style=\"padding:10px;\">".$contentlist."</div></div>";

    $page_contents = <<< HTML
        <form action="$htmladmin/index.php" method="post" name="pageList" enctype="multipart/form-data">
            $tablist
            <input type="hidden" name="action" value="" id="action">
            <input type="hidden" name="do" value="settings">
            <input type="hidden" name="id" value="$id">
            <input type="hidden" name="set_id" value="$id">
        </form>
HTML;

    require "resultPage.php";
    echo $result_page;
    exit();
}

function save_item()
{

    global $message,$id,$do,$disable_menu, $incdir;

    $temp_array_save['company_name']                 = sanitize_input('company_name');
    $temp_array_save['email_address']                = sanitize_input('email_address');
    $temp_array_save['js_code_head_close']           = filter_input(INPUT_POST, 'js_code_head_close');
    $temp_array_save['js_code_body_open']            = filter_input(INPUT_POST, 'js_code_body_open');
    $temp_array_save['js_code_body_close']           = filter_input(INPUT_POST, 'js_code_body_close');
    $temp_array_save['adwords_code']                 = filter_input(INPUT_POST, 'adwords_code');
    $temp_array_save['start_year']                   = sanitize_input('start_year');
    $temp_array_save['slideshow_speed']              = sanitize_input('slideshow_speed');
    $temp_array_save['phone_number']                 = sanitize_input('phone_number');
    $temp_array_save['free_phone_number']            = sanitize_input('free_phone_number');
    $temp_array_save['address']                      = sanitize_input('address');
    $temp_array_save['second_address']               = sanitize_input('second_address'); 
    $temp_array_save['homepage_slideshow_caption']   = sanitize_input('homepage_slideshow_caption');
    $temp_array_save['mailchimp_api_key']            = sanitize_input('mailchimp_api_key');
    $temp_array_save['mailchimp_list_id']            = sanitize_input('mailchimp_list_id');
    $temp_array_save['map_latitude']                 = sanitize_input('map_latitude');
    $temp_array_save['map_longitude']                = sanitize_input('map_longitude');
    $temp_array_save['map_heading']                  = sanitize_input('map_heading');
    $temp_array_save['map_address']                  = sanitize_input('map_address');
    $temp_array_save['map_description']              = sanitize_input('map_description');
    $temp_array_save['map_zoom_level']               = sanitize_input('map_zoom_level', FILTER_VALIDATE_INT);
    $temp_array_save['map_marker_latitude']          = sanitize_input('map_marker_latitude', FILTER_VALIDATE_FLOAT);
    $temp_array_save['map_marker_longitude']         = sanitize_input('map_marker_longitude', FILTER_VALIDATE_FLOAT);
    $temp_array_save['booking_url']                  = sanitize_input('booking_url', FILTER_VALIDATE_URL); 
    $temp_array_save['gift_voucher_url']             = sanitize_input('gift_voucher_url', FILTER_VALIDATE_URL);
    $temp_array_save['tripadvisor_widget_code']      = filter_input(INPUT_POST, 'tripadvisor_widget_code');
    
   
    $temp_array_save['instagram_username']           = sanitize_input('instagram_username');
    $temp_array_save['instagram_client_id']          = sanitize_input('instagram_client_id');
    $temp_array_save['instagram_access_token']       = sanitize_input('instagram_access_token');
   
    $temp_array_save['booking_terms_and_conditions'] = $_POST['booking_terms_and_conditions'];
   
    $temp_array_save['home_photo']                   = sanitize_input('home_photo'); 
    $temp_array_save['home_secondary_video']         = sanitize_input('home_secondary_video'); 
    $temp_array_save['home_secondary_img']           = sanitize_input('home_secondary_img'); 
    $temp_array_save['homepage_caption']             = filter_input(INPUT_POST, 'homepage_caption');

    $temp_array_save['footer_explore_photo']         = sanitize_input('footer_explore_photo');  
    $temp_array_save['footer_explore_caption']       = sanitize_input('footer_explore_caption');
    $temp_array_save['footer_explore_url']           = sanitize_input('footer_explore_url', FILTER_VALIDATE_URL);  

    $temp_array_save['bg_reviews']                   = sanitize_input('bg_reviews');  
    $temp_array_save['bg_skydive']                   = sanitize_input('bg_skydive');  
    $temp_array_save['bg_activity']                  = sanitize_input('bg_activity');  

    $temp_array_save['skydive_combo_title']          = sanitize_input('skydive_combo_title'); 
    $temp_array_save['skydive_combo_description']    = sanitize_input('skydive_combo_description'); 

    $temp_array_save['pricing_section_title']        = sanitize_input('pricing_section_title'); 
    $temp_array_save['pricing_section_description']  = sanitize_input('pricing_section_description'); 
   
    
    if( update_row($temp_array_save, 'general_settings', "WHERE id = '1' LIMIT 1") )
    {
        $message = "Settings have been saved";
    }

    // save social urls

    $url_ids    = $_POST['social-item-id'];
    $urls       = $_POST['social-item'];
    $has_widget = $_POST['social-item-has-wdge'];

    if(count($url_ids) > 0)
    {
        for ($i=0; $i < count($url_ids); $i++)
        { 
            $url_save_arr = array();
            if($has_widget[$i]) $url_save_arr['widget_blob'] = $urls[$i];
            else $url_save_arr['url'] = $urls[$i];

            update_row($url_save_arr, 'social_links', "WHERE id = '{$url_ids[$i]}'");
        }
    }

    $imppage_id = $_REQUEST['imppage_id'];
    $page_id = $_REQUEST['page_id'];
    $i = 0;
    foreach($imppage_id as $key => $value){
        $end = "WHERE imppage_id = '$value'";
        $temp_array_save = '';
        $temp_array_save['page_id']     = $page_id[$i];
        update_row($temp_array_save, 'general_importantpages', $end);
        $i++;
    }


}

?>