<?php

if($page_id == $page_home->id){

 $tags_arr['home_heading'] .= <<<HTML
    <section class="section section--main">
            <div class="main__content__wrapper"> 
                <div class="container-fluid bg--white has-gutters" data-wow-duration="1s" data-wow-delay="100ms">                
                    <div class="row main__content text-center">
                        <div class="main__intro col-xs-12">
                            <div class="col-xs-12 col-sm-12 col-md-4 visible-xs visible-sm hidden-md hidden-lg">
                                <span class="girl-bungee"><img src="{$home_photo}"  class="girl-bungee__photo" /></span>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 text-left">
                                <h1 class="main__intro--heading home-heading">{$heading}</h1>
                                <p class="main__intro--desc wow fadeInUp home-intro">{$introduction}</p>
                                <p><a href="{$page_booking->url}" class="btn btn__red_btn">Book Now <i class="arrow arrow--white"></i></a></p>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 hidden-xs hidden-sm visible-md visible-lg">
                                <span class="girl-bungee"><img src="{$home_photo}"  class="girl-bungee__photo" /></span>
                            </div>
                        </div>
                    </div>
                    <div class="row main__content">
                        <div class="content__wrapper">
                            {$page_content}
                        </div>  
                    </div>
                </div>
            </div>
        </section>
HTML;


} else{

$tags_arr['mod_view'] .= <<<HTML
    <section class="section section--main">
            <div class="main__content__wrapper"> 
                <div class="container-fluid bg--white has-gutters has--shadow" data-wow-duration="1s" data-wow-delay="100ms">                
                    <div class="row main__content text-center">
                        <div class="main__intro col-xs-12">
                            <h1 class="main__intro--heading">{$heading}</h1>
                            <p class="main__intro--desc wow fadeInUp">{$introduction}</p>
                        </div>
                    </div>
                    <div class="row main__content">
                        <div class="content__wrapper">
                            {$page_content}
                        </div>  
                    </div>
                </div>
            </div>
        </section>
HTML;

}
?>