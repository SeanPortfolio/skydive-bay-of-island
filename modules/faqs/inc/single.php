<?php


$ex_query = '';


$review = fetch_row("SELECT TRIM(CONCAT(`person_name`, ', ', `person_location`)) AS review_by, `description`
	FROM `testimonial`
	WHERE `status` = 'A'
	ORDER BY RAND()
	LIMIT 1");


if( !empty($review) )
{
	$testimonials_view = '<div class="row">
	<div class="col-xs-12"><ul class="reviews">
		<li>
			<p>'.$review['description'].'</p>
			<p>'.$review['review_by'].'</p>
		</li>
		<li><a href="'.$page_testimonials->full_url.'" class="read-more">See more guest comments <i class="fa fa-arrow-right"></i></a></li>
	</ul></div>
	</div>';
}

?>