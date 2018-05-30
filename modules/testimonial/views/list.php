<?php

$sqlreviews ="SELECT r.`id`,
	    r.`person_name`,
	    r.`person_location`,
	    r.`photo_path`,
	    r.`description`,
	    r.`date_posted`,
	    r.`rank`
	FROM `review` r
	WHERE r.`status` = '".FLAG_ACTIVE."'
	ORDER BY r.`rank`";

$arrReviews = fetch_all($sqlreviews);

if($arrReviews) {		

	foreach ($arrReviews as $review) {

		
		$person    = $review['person_name'];
		$detail    = $review['description'];
		
		$testimonialView .= <<<HTML
			<blockquote class="testimonial__item">
				<p class="testimonial__text">{$detail}</p>
				<p class="testimonial__person">{$person}</p>			
			</blockquote>

HTML;

	}
	
	$testimonialView = <<<HTML
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 text-center">
						<div class="reviews-list">
							{$testimonialView}
						</div>
			 		</div>
			 	</div>
			</div>
		</section>
HTML;

}

?>