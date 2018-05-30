<?php

$arrReviews = fetch_row("SELECT `person_name`,
	  `person_location`,
	  `photo_path`,
	  `description`,
	  `date_posted`
	FROM `review`
	WHERE `status` = '".FLAG_ACTIVE."'
	AND `description` != ''
	ORDER BY RAND()
	LIMIT 1");


if(!empty($arrReviews)){

	$detail = $arrReviews['description'];
	$person = $arrReviews['person_name'];

	$detail    = str_truncate($detail, 160, '...', true, false);
	
	$testimonialContentView = <<<HTML
		<section class="section section--bg testimonial__wrapper" style="background-image:url({$bgReviews})">
			<div class="container testimonial__container">
				<div class="row">
					<div class="col-xs-12 text-center">
						<h3 class="section__heading">Reviews</h3>
						<blockquote class="testimonial__item">
							<p class="testimonial__text">{$detail}</p>
						</blockquote>
						<p class="btn-outer"><a href="{$page_reviews->full_url}" title="{$page_reviews->title}" class="btn btn__red">More Reviews</a></p>
					</div>
				</div>
			</div>
		</section>
HTML;

}


?>