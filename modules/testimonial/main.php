<?php

$testimonialView        = '';
$testimonialContentView = '';

if ($page_id == $page_reviews->id) {	
		
	require_once "views/list.php";

} else {

	require_once "views/single.php";
}

$tags_arr['mod_view']         .= $testimonialView;
$tags_arr['testimonial_view'] .= $testimonialContentView;

?>