<?php

############################################################################################################################
## Edit FAQ Item
############################################################################################################################

function edit_item()
{

    global $message,$id,$do,$disable_menu,$valid,$htmladmin, $main_subheading, $js_vars;

    $disable_menu = "true";

    $sql = "SELECT ac.`id`,
                   ac.`price`,
                   ac.`activity_category_id`,
                   ac.`page_meta_data_id`,
                   pmd.`booking_url`,
                   pmd.`name`,
                   pmd.`menu_label`,
                   pmd.`description`,
                   pmd.`photo`,
                   pmd.`thumb_photo`
            FROM
              `activities` ac
            LEFT JOIN 
              `page_meta_data` pmd ON(pmd.`id` = ac.`page_meta_data_id`)
            WHERE
              ac.`id` = '{$id}'
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

##------------------------------------------------------------------------------------------------------
## tab arrays and build tabs
$temp_array_menutab             = array();
$temp_array_menutab['Settings'] = $settingsContent;
$temp_array_menutab['Overview'] = $main_content;

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
