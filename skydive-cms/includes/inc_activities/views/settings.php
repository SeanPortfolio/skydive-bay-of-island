<?php

// ACTIVITY CATEGORY
$activity_sql = "SELECT gp.`id`, pmd.`name`
    FROM `general_pages` gp
    LEFT JOIN `page_meta_data` pmd
    ON(pmd.`id` = gp.`page_meta_data_id`)
    WHERE pmd.`status` != 'D'
    AND gp.`is_category` = 'Y'
    ORDER BY pmd.`rank`";

$activity_result = fetch_all($activity_sql);


$type_html = '<select name="type" id="type">';

$type_html .= '<option value="">Select a Type</option>';
foreach($activity_result as $category){

    $pcategory_id   = $category['id'];
    $pcategory_name = $category['name'];

    if($pcategory_id == $activity_category_id) {
        $type_html .= '<option value="'.$pcategory_id.'" selected>'.$pcategory_name.'</option>';
    } else{
        $type_html .= '<option value="'.$pcategory_id.'">'.$pcategory_name.'</option>';
    }
}

$type_html .= '</select>';

##------------------------------------------------------------------------------------------------------
## Settings tab content
$settingsContent = <<< HTML
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr>
            <td width="150"><label for="name">CMS Label Name:</label></td>
            <td><input name="name" type="text" id="name" value="$name" style="width:300px;" /></td>
        </tr>
        <tr>
            <td width="150"><label for="name">Name:</label></td>
            <td><input name="menu_label" type="text" id="menu_label" value="$menu_label" style="width:300px;" /></td>
        </tr>
        <tr>
            <td width="150"><label for="price">Price:</label></td>
            <td><input name="price" type="text" id="price" value="$price" style="width:250px;" /></td>
        </tr>
        <tr>
            <td width="150"><label for="booking_url">Booking URL:</label></td>
            <td><input name="booking_url" type="text" id="booking_url" value="$booking_url" style="width:300px;" /></td>
        </tr>
        <tr>
            <td width="150"><label for="date_end">Type:</label></td>
            <td>{$type_html}</td>
        </tr>
        <tr>
            <td valign="top"><label>Main Image:</label></td>
            <td>
                <input name="photo" type="text" value="$photo" style="width:300px;" data-thumb-elm="#thumb_photo" id="photo" readonly autocomplete="off">
                <input name="thumb_photo" type="hidden" value="$thumb_photo" id="thumb_photo" readonly autocomplete="off">
                <input type="button" value="browse" onclick="openFileBrowser('photo')"> 
                <input type="button" value="clear" onclick="clearValue('photo')"><br>
            </td>
        </tr>
</table>
HTML;
?>