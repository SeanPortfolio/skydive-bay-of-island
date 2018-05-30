<?php

$instagram_gallery_view = '';

if( $instagramClientId && $instagramAccessToken && $instagramUsername)
{

	$jsVars['instagramSettings'] = array(
		'hashtag' => $instagramUsername,
		'clientID' => $instagramClientId,
		'accessToken' => $instagramAccessToken
	);

	$instagram_gallery_view .= <<<HTML

    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-center instagram">
              	    <div class="instagram__heading">
                      <h3 class="instagram__heading--title"><span class="instagram__heading--follow"><i class="fab fa-instagram"></i> Follow us on INSTAGRAM</span></h3>
                    </div>
        		    <div id="instagram-gallery"></div>
        		    <div class="clearfix"></div>
        		</div>
            </div>
        </div>   
    </section>
HTML;
	
	$tags_arr['instagram_view']  .= $instagram_gallery_view;

    $tags_arr['body_html'] .= <<<H
        <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
            <!-- Background of PhotoSwipe. 
                 It's a separate element as animating opacity is faster than rgba(). -->
            <div class="pswp__bg"></div>
            <!-- Slides wrapper with overflow:hidden. -->
            <div class="pswp__scroll-wrap">
                <!-- Container that holds slides. 
                    PhotoSwipe keeps only 3 of them in the DOM to save memory.
                    Don't modify these 3 pswp__item elements, data is added later on. -->
                <div class="pswp__container">
                    <div class="pswp__item"></div>
                    <div class="pswp__item"></div>
                    <div class="pswp__item"></div>
                </div>
                <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
                <div class="pswp__ui pswp__ui--hidden">
                    <div class="pswp__top-bar">
                        <!--  Controls are self-explanatory. Order can be changed. -->
                        <div class="pswp__counter"></div>
                        <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
                        <button class="pswp__button pswp__button--share" title="Share"></button>
                        <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
                        <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
                        <!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
                        <!-- element will get class pswp__preloader--active when preloader is running -->
                        <div class="pswp__preloader">
                            <div class="pswp__preloader__icn">
                              <div class="pswp__preloader__cut">
                                <div class="pswp__preloader__donut"></div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                        <div class="pswp__share-tooltip"></div> 
                    </div>
                    <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
                    </button>
                    <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
                    </button>
                    <div class="pswp__caption">
                        <div class="pswp__caption__center"></div>
                    </div>
                </div>
            </div>
        </div>
H;

	$tags_arr['body_html'] .= '<script id="instagram-photo-tmpl" type="text/html">
		<a href="<%= src %>" class="instagram__link" data-index="<%= index %>">
			<span class="instagram_thumb" style="background-image:url(<%= msrc %>);"></span>
		</a>
	</script>';

}

?>