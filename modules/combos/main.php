<?php 
if($page_id == $page_home->id){
    require_once "views/home.php";
} 

if($page_id == $page_combodeals->id ){
	if(empty($segment1)) {
	    require_once "views/combo.php";
	} else {
		require_once "views/combo_item.php";
	}
}

?>
