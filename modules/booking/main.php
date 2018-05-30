<?php

$id   = isset($_GET['id']) ? $_GET['id'] : '';

if($page_blog->url !== $segment && $page_contact->url !== $segment){

    if($page_id == $page_booking->id){

      if($id){

          $comboArr = fetch_row("SELECT `booking_url` FROM `page_meta_data` WHERE sha1(`id`) = '".$id."'");
          $booking_url = $comboArr['booking_url'];
      } else{
          $booking_url = $page_booking_url;   
      }


      $bookingContentView = <<<HTML
    		<section class="section">
    	          <div class="row">
                        <div class="col-xs-12 text-center">             
    						<iframe src="{$booking_url}" style="width: 100%; height:1000px; opacity: 1; visibility: visible;" frameborder="0"></iframe>
    					</div>
    				</div>
    		</section>
HTML;

      $tags_arr['mod_view'] .= $bookingContentView;

    }
} 
?>