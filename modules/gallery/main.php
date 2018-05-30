<?php

if($page_id == $page_gallery->id){
    
    require_once 'list/index.php';

} else{

    $carousel_title = 'Photos &amp; Videos';
    $carousel_id    = 'activity-photo-carousel';
    
    require_once 'carousel/index.php';
}

?>