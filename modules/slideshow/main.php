<?php
require_once "{$classdir}/mobile_detect.php";

$slideshow_view            = '';
$body_cls                  = '';
$caption				   = '';
$homeIconsView			   = '';

$is_home_page = ($main_page_id == $page_home->id);

$objMobileDetect = new Mobile_Detect();

$isMobileDevice  = ($objMobileDetect->isMobile() || $objMobileDetect->isTablet());

$browserIsIE = (preg_match('~MSIE|Internet Explorer~i', $_SERVER['HTTP_USER_AGENT']) || (strpos($_SERVER['HTTP_USER_AGENT'], 'Trident/7.0; rv:11.0') !== false));

$body_cls = (!empty($is_home_page))? ' home' : '';
$sectionCls    = (!empty($is_home_page)) ? ' heroshot-section--fs' : '';
//$caption = (!empty($youtubeVideoCaption) && !empty($is_home_page)) ? '<h1 class="heroshot-section__caption__text">'.$youtubeVideoCaption.'</h1>' : '';

if($is_home_page){

	require_once "views/home_icons.php";
}

if($youtube_id && empty($browserIsIE) && !$browserIsIE && !$isMobileDevice)
{
	require_once "views/video.php";
}
elseif($slideshow_id)
{
	require_once "views/slider.php";
}
elseif(!empty($page_photo))
{
	require_once "views/heroshot.php";
}
else
{
	$body_cls .= "no-heroshot";
}

if($slideshow_view != ''){
	$slideshowView = <<<HTML
	
		<section id="heroshot-section" class="heroshot-section {$sectionCls}">
			{$slideshow_view}
		</section>	
	
HTML;
}

$tags_arr['body_cls'] .= " {$body_cls}";
$tags_arr['slideshow_view'] = $slideshowView;
?>