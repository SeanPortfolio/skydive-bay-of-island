<?php 

$isCatgeory = fetch_value("SELECT gp.`is_category`
				FROM `general_pages` gp
				LEFT JOIN `page_meta_data` pmd 
						ON (pmd.`id` = gp.`page_meta_data_id`)
				WHERE gp.`id` = '$page_id' 
				AND pmd.`status` = '".FLAG_ACTIVE."'");

if ($page_id == $page_home->id) {
    require_once "views/home.php";

} else if($page_id == $page_specials->id ) {
	
	if(empty($segment1)) {
		$tags_arr['body_cls'] .= ' specials-page';

	    require_once "views/specials_list.php";

	} else {

		require_once "views/specials_detail.php";

	}

} else if($page_id == $page_combodeals->id ) {
	
	if(empty($segment1)) {
	    require_once "views/specials_combo.php";

	} 

} else if($isCatgeory == 'Y'){

   require_once "views/specials_activities.php";

}

?>
