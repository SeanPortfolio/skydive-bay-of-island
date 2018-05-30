<?php 

if($page_id == $page_pricing->id ){
	
	require_once "views/pricing_table.php";
	
} else {
	
	require_once "views/pricing_grid.php";
}

?>
