<?php

if($arrReviews) {		

	foreach ($arrReviews as $review) {

		
		$person    = $review['person_name'];
		$detail    = str_truncate($review['description'], 160, '...', true, false);

		$testimonialView .= <<<HTML
			<blockquote class="review__item">
				<p class="review__item__text">
					<i class="fa fa-quote-left"></i>
					{$detail} 
					<span class="review__item__person" style="display:none;">{$person}</span>
					<i class="fa fa-quote-right"></i>
				</p>				
			</blockquote>
HTML;

	}

	$reviewsPgURL = $page_reviews->full_url;

	$moreReviewsURL = (!empty($reviewsPgURL)) ? '<p><a href="'.$reviewsPgURL.'" class="btn btn__link" title="READ MORE REVIEWS">READ MORE REVIEWS</a></p>' : '';
	
	$testimonialView = <<<HTML
		<div class="reviews__wrapper has--shadow text-center">
			<div class="reviews-carousel reviews-carousel-pull--vrt">
				{$testimonialView}
			</div>
			<div class="reviews__wrapper--background"></div>
 		</div>
HTML;

}


?>