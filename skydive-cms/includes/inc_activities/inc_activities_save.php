<?php

############################################################################################################################
## Save Testimonial Item
############################################################################################################################

function save_item()
{

    global $message,$id,$do,$disable_menu, $root, $rootfull, $rootadmin, $upload_dir;


    include_once("$rootadmin/classes/class_imageresizer.php");

    $resizer_class = new images();

    $upload_dir_full_path = "{$rootfull}{$upload_dir}";

    $importantPage         = fetchImportantPagesData();

    $id                    = sanitize_input('id', FILTER_SANITIZE_NUMBER_INT);
    $name                  = sanitize_input('name');
    $menu_label            = sanitize_input('menu_label');
    $photo_path            = sanitize_input('photo');
    $photo_full_path       = "$rootfull{$photo_path}";
    $thumb_photo_path      = sanitize_input('thumb_photo');
    $thumb_photo_full_path = "$rootfull{$thumb_photo_path}";
    $meta_data_id          = sanitize_input('meta_data_id', FILTER_SANITIZE_NUMBER_INT);

    if( file_exists($thumb_photo_full_path) && !is_dir($thumb_photo_full_path) )
    {
        unlink($thumb_photo_full_path);
    }

    if( file_exists($photo_full_path) && !is_dir($photo_full_path) )
    {
        $thumb_name = uniqid('img-');
        $thumb_web_path = $upload_dir.'/'.$thumb_name;
        $resizer_class->resizer($upload_dir_full_path, $photo_full_path, 372, 375, $thumb_name);
    }
    else
    {
        $thumb_web_path = '';
        $photo_path     = '';
    }
    
    //  SAVE ACTIVITY
    $activity_data = array();
    $activity_data['price']                = sanitize_input('price');
    $activity_data['activity_category_id'] = sanitize_input('type');

    update_row($activity_data, 'activities', "WHERE id = '{$id}'"); 

    //  SAVE PAGE META DATA
    $meta_data                       = array();
    $meta_data['name']               = $name;
    $meta_data['menu_label']         = $menu_label;
    $meta_data['heading']            = $menu_label;
    $meta_data['description']        = $_POST['description'];
    $meta_data['booking_url']        = sanitize_input('booking_url');
    $meta_data['photo']              = $photo_path;
    $meta_data['thumb_photo']        = ($thumb_web_path) ? $thumb_web_path.'.jpg' : '';  
    $meta_data['date_updated']       = date('Y-m-d H:i:s');
    $meta_data['updated_by']         = $_SESSION['s_user_id'];

    update_row($meta_data,'page_meta_data', "WHERE id = '{$meta_data_id}'");

    $message = "Item has been saved";
}

?>