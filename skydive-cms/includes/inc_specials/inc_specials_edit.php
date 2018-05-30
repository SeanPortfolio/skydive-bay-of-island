<?php

############################################################################################################################
## Edit FAQ Item
############################################################################################################################

function edit_item()
{

    global $message,$id,$do,$disable_menu,$valid,$htmladmin, $main_subheading, $js_vars;

    $disable_menu = "true";

    $sql = "SELECT sp.`id`,
                   sp.`price`,
                   sp.`featured`,
                   sp.`date_start`,
                   sp.`date_end`,
                   sp.`page_meta_data_id`,
                   pmd.`id` AS `meta_data_id`,
                   pmd.`gallery_id`,
                   pmd.`url`,
                   pmd.`name`,
                   pmd.`introduction` as description,
                   pmd.`photo`,
                   pmd.`thumb_photo`,
                   pmd.`title`, 
                   pmd.`meta_description`, 
                   pmd.`og_title`, 
                   pmd.`og_image`
            FROM
              `specials` sp
            LEFT JOIN `page_meta_data` pmd ON(pmd.`id` = sp.`page_meta_data_id`)
            WHERE
              sp.`id` = '{$id}'
            LIMIT 1";

    $row = fetch_row($sql);

    @extract($row);

    $main_subheading = 'Editing: '.$name;

    ##------------------------------------------------------------------------------------------------------
    // Init view variables

    $meta_content = '';

    ##------------------------------------------------------------------------------------------------------
    ## Page functions

    $page_functions = <<< HTML
    <ul class="page-action">
        <li><button type="button" class="btn btn-default" onclick="submitForm('save',1)"><i class="glyphicon glyphicon-floppy-save"></i> Save</button></li>
        <li><a class="btn btn-default" href="{$htmladmin}/?do={$do}"><i class="glyphicon glyphicon-arrow-left"></i> Cancel</a>
        </li>
    </ul>
HTML;

include_once 'views/settings.php';
include_once 'views/overview.php';
include_once 'views/meta_data.php';

##------------------------------------------------------------------------------------------------------
## Quick Links tab content
$quicklink_list = '<p><strong>Choose quicklinks to display on page</strong></p>';

$ql_sql = "SELECT gp.`id`, pmd.`quicklink_heading`, pmd.`name`
    FROM `general_pages` gp
    LEFT JOIN `page_meta_data` pmd
    ON(gp.`page_meta_data_id` = pmd.`id`)
    WHERE pmd.`status` = 'A'
    AND pmd.`id` != '{$meta_data_id}'
    AND pmd.`quicklink_heading` != ''
    ORDER BY pmd.`rank`";

$quicklinks = fetch_all($ql_sql);

if( !empty($quicklinks) )
{
    $attached_qls = fetch_value("SELECT GROUP_CONCAT(`quicklink_page_id`) FROM `page_has_quicklink` WHERE `page_id` = '{$meta_data_id}'");

    $attached_qls_arr = explode(',', $attached_qls);

    $quicklink_list .= '<ul class="list-grid">';

    foreach($quicklinks as $quicklink)
    {
        $is_checked = (in_array($quicklink['id'], $attached_qls_arr)) ? ' checked="checked"' : '';

        $ql_label = ($quicklink['quicklink_heading']) ? $quicklink['quicklink_heading'] : $quicklink['name'];

        $quicklink_list .= '<li><label class="checkbox-inline"><input'.$is_checked.' type="checkbox" value="'.$quicklink['id'].'" name="quicklink_id[]"> <span>'.$ql_label.'</span></label></li>';
    }

    $quicklink_list .= '</ul>';
}



##------------------------------------------------------------------------------------------------------
## tab arrays and build tabs
$temp_array_menutab                       = array();
$temp_array_menutab['Settings']           = $settingsContent;
$temp_array_menutab['Information']        = $main_content;
$temp_array_menutab['Quicklinks']         = $quicklink_list;
$temp_array_menutab['Meta']               = $meta_content;

$counter     = 0;
$tablist     = "";
$contentlist = "";

foreach($temp_array_menutab as $key => $value){

	$tablist.= "<li><a href=\"#tabs-".$counter."\">".$key."</a></li>";
	$contentlist.=" <div id=\"tabs-".$counter."\">".$value."</div>";
	$counter++;
}

$tablist="<div id=\"tabs\"><ul>$tablist</ul><div style=\"padding:10px;\">$contentlist</div></div>";

    $page_contents="<form action=\"$htmladmin/?do={$do}\" method=\"post\" name=\"pageList\" enctype=\"multipart/form-data\">
        $tablist
        <input type=\"hidden\" name=\"action\" value=\"\" id=\"action\">
        <input type=\"hidden\" name=\"do\" value=\"{$do}\">
        <input type=\"hidden\" name=\"id\" value=\"$id\">
        <input type=\"hidden\" name=\"meta_data_id\" value=\"$page_meta_data_id\">
    </form>";

require "resultPage.php";
echo $result_page;
exit();

}

?>
