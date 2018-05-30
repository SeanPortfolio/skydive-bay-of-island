// General App
(function(w){

    w.App = function(){
        this.config = {
            serviceUrl:'/requests/service',
            loadedGalleries:{}
        };
    };

    w.App.prototype.init = function() {
        var ths = this;
        this.config = $.extend(true, this.config, jsVars);

        this.toggleNav('.mobile-btn--trigger');
        this.toggleSubNav('.toggle-sub-nav'); 

        this.initHeroSlider('#slider');
        this.initHeroScroll('.hero__scroll');

        this.initSpecialCarousel('.special-carousel');
        this.initJumpPhotoCarousel('.jump-photo-carousel');
        this.initActivityPhotoCarousel('.activity-photo-carousel');
        this.initPhotoCarousel('.photo-carousel');
        
        this.initComboCarousel('.combos');
        this.initComboCarousel('.specials-carousel');
        this.initShowcaseCarousel('.showcase__grid');        

        this.initReviewsCarousel('.reviews-carousel');
        this.initFeaturedCarousel('.featured-carousel');

        this.initGalleryCarousel('.gallery__carousel');
        this.initPhotoswipe('.gallery__carousel a');
        
        //this.initShuffleVideos('#shuffle-videos');
        //this.initShufflePhotos('#shuffle-photos');

        //this.initGallery('[data-launch-gallery]');
        this.initVideoPopup('[data-toggle-popup]');

        this.initMap();
        
        this.initNewsletterSignup('#news-signup-form');
       
        this.matchElmHeight('.tour-item');
        this.matchElmHeight('.combos-grid .mod-grid');

        if($(window).width() > 991){
            this.matchElmHeight('.specials');
        }

        // Scroll Top Trigger
        $(window).on('resize',function(){

            app.setHeroVideoDimensions();
            
        }).trigger('resize');

        

        $(window).on( 'scroll', function(){

            if($(window).width() < 1200) {
                
                var scrollTop    = $(window).scrollTop();
               
                if (scrollTop > 50){
                    $('.logo').addClass('scroll');
                } else {
                    $('.logo').removeClass('scroll');
                }
            }
        });

        // INITIATE INSTAGRAM

        var instagramSettings = jsVars.instagramSettings;
        var instagram = new Instagram( instagramSettings );
        
        instagram.init();

        // Dropdown Menu Fade    
        
        $(".dropdown").hover(
            function() { $('.dropdown-menu', this).stop().fadeIn("fast");
            },
            function() { $('.dropdown-menu', this).stop().fadeOut("fast");
        });

        $('.showcase__gallery .showcase__item').swipebox({
            removeBarsOnMobile: false,
            autoplayVideos: false,
            videoMaxWidth: $(window).width(),
        });

       this.initShuffle('#shuffle');

    };

    w.App.prototype.initShuffle = function( elm ){
        var jElm = $(elm),
        ths = this;

        if(jElm.length)
        {
            jElm.shuffle({
                group:'all',
                itemSelector:'.showcase__item',
                speed:450,
                delimeter: ','
            });

            $('.shuffle-trigger').on('click', function(e) {

                e.preventDefault();

                jElm.shuffle('shuffle', $(this).attr('data-group') );

                $('.shuffle-trigger').removeClass('active');
                $(this).addClass('active');
                
            });
        }
    };

    w.App.prototype.setHeroVideoDimensions = function()
    {
        var iframe = $('.video__wrapper iframe');
       
        if(iframe.length)
        {
            var wHeight = $(window).height(),
            wWidth = $(window).width(),
            newIframeWidth = wHeight*1.77;

            if(newIframeWidth < wWidth)
            {
                newIframeWidth = wWidth;
                newIframeHeight = ( wWidth*0.565 );
            }
            else
            {
                newIframeHeight = wHeight;
            }

           var leftOffset = ( newIframeWidth / 2) * -1;
           iframe.css({'height':newIframeHeight,'width':newIframeWidth});
        }
    },

    w.App.prototype.initHeroSlider = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: true,
            speed: 600,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: this.config.globals.slideshowSpeed,//app.getConfigItem('slideshowSpeed'),
            fade: true,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="slider__nav slider__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="slider__nav slider__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
        });
    };

    w.App.prototype.initReviewsCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: true,
            infinite: true,
            speed: 600,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 6000,
            fade: true,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="review__carousel__nav review__carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="review__carousel__nav review__carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
        });
    };

    w.App.prototype.initSpecialCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: true,
            infinite: true,
            speed: 300,
            slidesToShow: 1,
            slidesToScroll: 1,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="featured__carousel__nav featured__carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="featured__carousel__nav featured__carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
            responsive: [
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }, {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }
            ]
        });
    };

    w.App.prototype.initJumpPhotoCarousel = function (elm) {
        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: true,
            speed: 300,
            slidesToShow: 3,
            slidesToScroll: 3,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="featured__carousel__nav featured__carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="featured__carousel__nav featured__carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
            responsive: [
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }, {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                    }
                }
            ]
        });

        $('.swipebox_item').click(function() {

                $('.jump-photo-carousel .swipebox_item').swipebox({
                    removeBarsOnMobile: false,
                    autoplayVideos: true,
                    videoMaxWidth: ($(window).width() - 400),
                    afterOpen: function(){
                    var $selectorClose = $("#swipebox-close");
                    var clickAction = "touchend click";

                    $selectorClose.unbind(clickAction);

                    $selectorClose.bind(clickAction, function(event){
                      event.preventDefault();
                      event.stopPropagation();

                      $.swipebox.close();
                    });
                   }
                });

       });
    };

    w.App.prototype.initActivityPhotoCarousel = function (elm) {
        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: true,
            speed: 300,
            slidesToShow: 3,
            slidesToScroll: 3,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="carousel__nav carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="carousel__nav carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
            responsive: [
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2,
                    }
                },
                {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 4,
                    }
                }
            ]
        });

        $('.swipebox_item').click(function() {

                $('.activity-photo-carousel .swipebox_item').swipebox({
                    removeBarsOnMobile: false,
                    autoplayVideos: false,
                    videoMaxWidth: ($(window).width() - 400),
                    afterOpen: function(){

                        var $selectorClose = $("#swipebox-close");
                        var clickAction = "touchend click";

                        $selectorClose.unbind(clickAction);

                        $selectorClose.bind(clickAction, function(event){
                          event.preventDefault();
                          event.stopPropagation();

                          $.swipebox.close();
                        });

                   }
                });

            });
    };

    w.App.prototype.initPhotoCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: true,
            speed: 300,
            slidesToShow: 4,
            slidesToScroll: 4,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="carousel__nav carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="carousel__nav carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
            responsive: [
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }, {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 4,
                    }
                }
            ]
        });

        $('.swipebox_item').click(function() {

                $('.photo-carousel .swipebox_item').swipebox({
                    removeBarsOnMobile: false,
                    autoplayVideos: false,
                    videoMaxWidth: ($(window).width() - 400),
                    afterOpen: function(){

                        var $selectorClose = $("#swipebox-close");
                        var clickAction = "touchend click";

                        $selectorClose.unbind(clickAction);

                        $selectorClose.bind(clickAction, function(event){
                          event.preventDefault();
                          event.stopPropagation();

                          $.swipebox.close();
                        });

                   }
                });

            });
    };

    w.App.prototype.initComboCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: true,
            infinite: true,
            speed: 300,
            slidesToShow: 1,
            slidesToScroll: 1,
            cssEase: 'linear',
            arrows: false,
            prevArrow:'<div class="carousel__nav carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="carousel__nav carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
        });
    };

    w.App.prototype.initFeaturedCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: false,
            speed: 300,
            slidesToShow: 3,
            slidesToScroll: 3,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="featured__carousel__nav featured__carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="featured__carousel__nav featured__carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
            responsive: [
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }, {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                    }
                }
            ]
        });
    };

    w.App.prototype.initShowcaseCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: true,
            dotsClass: 'slick-dots showcase__nav-dots',
            infinite: true,
            speed: 300,
            slidesToShow: 3,
            slidesToScroll: 3,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="showcase__nav showcase__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="showcase__nav showcase__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
            responsive: [
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }, {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                    }
                }
            ]
        });
    };

    w.App.prototype.initHeroScroll = function (elm) {

        var scrollElm = $(elm);
    
        scrollElm.on('click', function(e){
            e.preventDefault();
            
            topHeight = ($(window).width() <=991) ? 50 : 220;
            
            $('html, body').delay(100).animate({
               scrollTop: $("#main").offset().top-topHeight
            }, 400);
        });
    };

    w.App.prototype.initMap = function()
    {

       if($('#map-canvas').length)
        {
            var latitude = app.getConfigItem('latitude'),
                longitude = app.getConfigItem('longitude'),
                zoomLevel = app.getConfigItem('zoomLevel'),
                address = app.getConfigItem('address');
            
            if(latitude && longitude)
            {
              
                var map,
                windowWidth = $(window).width(),
                isDraggable = false,
                image = '/graphics/map-marker.png';

                /*if(windowWidth > 992)
                {*/
                    isDraggable = true;
                //}

                var mapOptions = {
                    zoom: parseInt(zoomLevel),
                    center: new google.maps.LatLng(latitude,longitude),
                    scrollwheel: false,
                    zoomControl:true,
                    draggable:isDraggable,
                    mapTypeId:google.maps.MapTypeId.ROAD,
                };

                map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);

                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(latitude, longitude),
                    map: map,
                    icon: image
                });

                var infowindow = new google.maps.InfoWindow({
                    content: address
                });

                marker.addListener('click', function() {
                    infowindow.open(map, marker);
                });
    
            }

        }
    };

    w.App.prototype.initGalleryCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: true,
            speed: 300,
            slidesToShow: 3,
            slidesToScroll: 1,
            prevArrow:'<div class="gallery__carousel__prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="gallery__carousel__next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
            responsive: [
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }, {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1,
                    }
                },
                {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 1,
                    }
                }
            ]
        });
    };

    w.App.prototype.initPhotoswipe = function(elm){

        var jElm = $(elm);
        
        if(jElm.length)
        {
            var slides    = app.getConfigItem('galleryImages');

            var options = {
                index:0,
                shareEl:false,
                preload:[1,2],
                history:false,
                bgOpacity:0.8
            };

            $.each(slides, function(i, item){
                slides[i].src   = item.full_path;
            });
            
            jElm.on('click', function(e){
                e.preventDefault();

                options.index = $(this).data('key');
               
                var gallery = new PhotoSwipe( $('.pswp').get(0), PhotoSwipeUI_Default, slides, options);
                gallery.init();
            });            
        }
    };

    w.App.prototype.initVideoPopup = function(elm){

        var jElm = $(elm);

        if( jElm.length )
        {
            jElm.on('click', function(e){
                e.preventDefault();

                var self = $(this),
                popup = $(self.data('toggle-popup'));

                popup.toggleClass('open');
                $('body').addClass('no-scroll');

                var iframe = popup.find('iframe');

                if( iframe.length )
                {
                    iframe.attr('src', iframe.data('src'));
                }

            });


            $('body').on('click', '.popup .close', function(e){
                e.preventDefault();

                var self = $(this),
                popup = $(self.attr('href'));

                popup.toggleClass('open');
                $('body').removeClass('no-scroll');

                var iframe = popup.find('iframe');
                
                if( iframe.length )
                {
                     iframe.attr('src', '');
                }
                
            });

        }

    };


    w.App.prototype.getVar = function(property, obj){
        if(obj.hasOwnProperty(property)) return obj[property];

        for(var prop in obj)
        {
            if(obj[prop].hasOwnProperty(property))
            {
                return obj[prop][property];
            }
        }
        
        return false;
    };


    w.App.prototype.getConfigItem = function(prop)
    {
        return this.getVar(prop, this.config);

    };

  
   w.App.prototype.toggleNav = function(elm){
        var jElm = $(elm);

        if( jElm.length )
        {
            jElm.on('click', function(e){
                e.preventDefault();

                var self = $(this);

                    $('.nav-wrap').addClass('active');
                    $('body').addClass('no-scroll');


            });

            $('.mobile-btn--close').on('click', function(e){
                e.preventDefault();
                $('.nav-wrap').removeClass('active');
                $('body').removeClass('no-scroll');

            })
        }
    };

    w.App.prototype.toggleSubNav = function(elm){
        
        var jElm = $(elm);

        if( jElm.length )
        {
            jElm.on('click', function(e){
                e.preventDefault();

                var self = $(this),
                    target = self.parents('.has-menu').find('ul');

                if( target.length )
                {
                    target.toggleClass('active');
                    self.toggleClass('active');
                }

            });

        }
    };


    w.App.prototype.matchElmHeight = function(elm) {
        var jElm = (typeof elm == 'string') ? $(elm) : elm;

        if( jElm )
        {
            jElm.css('height','auto');

            var height = 0;

            jElm.each(function(i, el) {
                var jEl = $(el),
                elHeight = jEl.height();

                if( elHeight > height ) height = elHeight;
            });

            jElm.css('height', height);
        }
    };

    w.App.prototype.initNewsletterSignup = function(elm)
    {
        var jElm = $(elm);

        if(jElm.length)
        {

            var triggerBtn = jElm.find('#newsletter-submit');

            if(triggerBtn.length)
            {
                triggerBtn.on('click', function(e){
                    e.preventDefault();

                    var emailAddress =  $.trim(jElm.find('#signup-email').val()),
                    msg = '',
                    msgType = 'msg--error';


    
                    var msgHodler = jElm.find('.msg');

                    if(emailAddress)
                    {
                        var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                        
                        if(emailRegex.test(emailAddress))
                        {
                            $.post(app.getConfigItem('serviceUrl'), 'action=sign-up&email='+emailAddress, function(response){
                              
                                if(response.msg)
                                {
                                    msgHodler.removeAttr('class').addClass('msg '+response.type).html(response.msg);
                                }


                                if(response.isValid)
                                {
                                    setTimeout(function(){
                                        msgHodler.removeClass(response.type).html('');
                                        jElm.find('#full-name').val('');
                                        jElm.find('#signup-email').val('');
                                        
                                    }, 5000);
                                }


                                return false;

                            }, 'json');
                        }
                        else
                        {
                            msg = 'Invalid email address provided.';
                        }
                    }
                    else
                    {
                        msg = 'Your email address is required.';

                    }



                    if(msg)
                    {
                        msgHodler.removeAttr('class').addClass('msg '+msgType).html(msg);
                    }

                });
            }
        }
    };

    w.onYouTubeIframeAPIReady = function () {

        var elm         = $('.cover-video').get(0),
            parentElm   = $('.video__wrapper'),
            id          = elm.getAttribute("data-id"),
            frameWidth  = parentElm.width(),
            frameHeight = parentElm.height(),
            newFrameWidth,
            newFrameHeight;

        parentElm.css('overflow', 'hidden');
        
        var player = new YT.Player(elm, {
            videoId: id,
            width: frameWidth,
            height: frameHeight,
            playerVars: {
                start: 0,
                autoplay: true,
                controls: false,
                rel: 0,
                showinfo: false,
                modestbranding: true,
                loop: true,
                fs: false,
                cc_load_policy: true,
                iv_load_policy: 3,
                autohide: false,
                playlist: id
            },
            events: {
                onReady: function(e) {
                    e.target.mute();

                    // Make video element full screen

                    newFrameWidth = frameHeight*1.77;

                    if (newFrameWidth < frameWidth) {

                        newFrameWidth   = frameWidth;

                        newFrameHeight = ( frameWidth*0.565 );

                    } else { 

                        newFrameHeight = frameHeight;
                    }

                    $('.cover-video').css({
                        'height': newFrameHeight,
                        'width': newFrameWidth
                    });

                    $('.page__photo__caption--ghost').delay(2000).animate({"opacity": "1"}, 1500).delay(7500).animate({"opacity": "0"}, 1500);
                }
            }
        });

    };

    function appendYouTubeAPI() {

        var jElm    = $('.cover-video'),
            videoId = jElm.data('id');

        if (jElm.length == 1 && videoId) {

            var apiUrl = 'https://www.youtube.com/iframe_api?callback=onYouTubeIframeAPIReady';

            var tag     = document.createElement('script');
                tag.src = apiUrl;

            $('head').append(tag);

        };
    }

    appendYouTubeAPI();

    // var wow = new WOW(
    //   {
    //     animateClass: 'animated',
    //     offset:       100,
    //     mobile:       false,
    //     callback:     function(box) {
            
    //     }
    //   }
    // );
    // wow.init();

}(window));
var app = new App();