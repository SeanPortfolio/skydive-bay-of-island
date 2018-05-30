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

    $secials_data = array();

    $id                    = sanitize_input('id', FILTER_SANITIZE_NUMBER_INT);
    $gallery_id            = sanitize_input('gallery_id',  FILTER_SANITIZE_NUMBER_INT);
    $meta_data_id          = sanitize_input('meta_data_id', FILTER_SANITIZE_NUMBER_INT);
    $featured              = sanitize_input('featured');
    $url                   = prepare_item_url(sanitize_input('url')); 
    $name                  = sanitize_input('name');
    $photo_path            = sanitize_input('photo');
    $photo_full_path       = "$rootfull{$photo_path}";
    $thumb_photo_path      = sanitize_input('thumb_photo');
    $thumb_photo_full_path = "$rootfull{$thumb_photo_path}";

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

    //  Save  specials
    $secials_data['price']       = sanitize_input('price');
    $secials_data['featured']    = ($featured === FLAG_YES) ? FLAG_YES : FLAG_NO;
    $secials_data['date_start']  = sanitize_input('date_start');
    $secials_data['date_end']    = sanitize_input('date_end');

    update_row($secials_data, 'specials', "WHERE id = '{$id}'"); 

    //  Save  page meta  data
    $meta_data                         = $page_data = array();
    $meta_data['name']                 = $name;
    $meta_data['heading']              = $name;
    $meta_data['title']                = sanitize_input('title');
    $meta_data['meta_description']     = sanitize_input('meta_description');
    $meta_data['og_title']             = sanitize_input('og_title');
    $og_image_path                     = sanitize_input('og_image');
    $og_image_full_path                = "$rootfull{$og_image_path}";
    $meta_data['og_image']             = ( is_file($og_image_full_path) ) ? $og_image_path : '';

    $meta_data['url']                  = $url;
    $meta_data['full_url']             = "/{$url}";
    $meta_data['gallery_id']           = $gallery_id;
    $meta_data['introduction']         = htmlentities(htmlspecialchars($_POST['description']));
    $meta_data['description']          = htmlentities(htmlspecialchars($_POST['description']));
    $meta_data['photo']                = $photo_path;
    $meta_data['thumb_photo']          = ($thumb_web_path) ? $thumb_web_path.'.jpg' : '';
    $meta_data['date_updated']         = date('Y-m-d H:i:s');
    $meta_data['updated_by']           = $_SESSION['s_user_id'];

    update_row($meta_data,'page_meta_data', "WHERE id = '{$meta_data_id}'");

     // save quicklinks
	run_query("DELETE FROM `page_has_quicklink` WHERE `page_id` = '{$meta_data_id}'");

	$quicklinks = $_POST['quicklink_id'];

	if( !empty($quicklinks) )
	{
		for($i=0;$i<count($quicklinks);$i++)
		{
			$ql_arr = array();

			$ql_arr['quicklink_page_id'] = $quicklinks[$i];
			$ql_arr['page_id']           = $meta_data_id;

			insert_row($ql_arr, 'page_has_quicklink');

		}
	}
    
    $message = "Item has been saved";
}

?>