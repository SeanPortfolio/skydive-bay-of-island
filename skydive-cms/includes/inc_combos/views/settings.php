<?php

$flag_yes = FLAG_YES;


$query = "SELECT `id` AS ind, `name` AS label
    FROM `photo_group`
    WHERE `name` != ''
    AND `type` = 'G'
    AND `show_in_cms` = 'Y'
    ORDER BY `name`";
  
    $gallery_dd = '<select name="gallery_id" id="gallery_id" style="width:250px"><option value="">Please Select Gallery</option>';
    $gallery_dd .= create_item_list($query, $gallery_id);
    $gallery_dd .= '</select>';

     $gallery_dd = <<< H
        <td width="130"><label for="gallery_id">Gallery:</label></td>
        <td>$gallery_dd</td>
H;


$featured_checked  = ( $featured == FLAG_YES ) ? ' checked="checked"' : '';

##------------------------------------------------------------------------------------------------------
## Settings tab content
$settingsContent = <<< HTML
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr>
            <td width="150"><label for="name">Name:</label></td>
            <td><input name="name" type="text" id="name" value="$name" style="width:300px;" /></td>
        </tr>
        <tr>
            <td width="150"><label for="price">Price:</label></td>
            <td><input name="price" type="text" id="price" value="$price" style="width:250px;" /></td>
        </tr>
        <tr>
            <td width="150"><label for="url">URL:</label></td>
            <td><input name="url" type="text" id="url" value="$url" style="width:250px;" /></td>
        </tr>
        <tr>
            <td width="150"><label for="booking_url">Booking URL:</label></td>
            <td><input name="booking_url" type="text" id="booking_url" value="$booking_url" style="width:300px;" /></td>
        </tr>
        <tr>
            {$gallery_dd}
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
        <tr>
                <td width="200"><label for="photo">Page Heroshot:</label></td>
                <td>
                    <input name="heroshot" type="text" value="$heroshot" style="width:250px;" data-thumb-elm="#heroshot" id="heroshot" readonly autocomplete="off">
                    <input type="button" value="browse" onclick="openFileBrowser('heroshot')"> 
                    <input type="button" value="clear" onclick="clearValue('heroshot')"><br>
                </td>
        </tr>
        <tr>
            <td width="200"><label for="featured">Is Featured?</label></td>
            <td><input name="featured" type="checkbox" style="margin-left:0;" id="featured" value="{$flag_yes}" $featured_checked></td>
        </tr>
</table>
HTML;
?>