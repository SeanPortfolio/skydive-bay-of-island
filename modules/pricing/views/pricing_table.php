<?php

$pricingView   = "";

$sqlActivities = "SELECT gp.`id` AS activityId,			
			pmd.`name`,
	        pmd.`heading`,
	        pmd.`menu_label`,
	        pmd.`url`,
	        pmd.`full_url`,
	        pmd.`photo`,
	        pmd.`thumb_photo`,
	        pmd.`short_description` AS description
	FROM `general_pages` gp
	LEFT JOIN `page_meta_data` pmd 
		ON (pmd.`id` = gp.`page_meta_data_id`)
	WHERE gp.`is_category` = '".FLAG_YES."' 
	AND pmd.`status` = '".FLAG_ACTIVE."' 
	ORDER BY pmd.`rank`";

$arrActivities = fetch_all($sqlActivities);

if(!empty($arrActivities)){

	foreach ($arrActivities as $activity) {
			
		$activityId    = $activity['activityId'];
		$activityLabel = $activity['menu_label'];
		
		$sqlActivityPricing = "SELECT a.`id` AS activityPricingId,
				IF(a.`price`, REPLACE(FORMAT(a.`price`, 2), '.00', ''), 'POA') AS price,
				pmd.`name`,
		        pmd.`menu_label`,
		        pmd.`heading`,
		        pmd.`photo`,
		        pmd.`thumb_photo`,
		        pmd.`description`,
		        pmd.`booking_url`
			FROM `activities` a
			LEFT JOIN `page_meta_data` pmd 
				ON (pmd.`id` = a.`page_meta_data_id`)
			WHERE a.`activity_category_id` = '{$activityId}'			
			AND pmd.`status` = '".FLAG_ACTIVE."' 
			ORDER BY pmd.`rank`";

		$arrActivityPricing = fetch_all($sqlActivityPricing);

		if(!empty($arrActivityPricing)){

			$activityPricingView = '';

			foreach ($arrActivityPricing as $pricing) {

				$pricingId          = $pricing['activityPricingId'];
				$pricingLabel       = $pricing['menu_label'];
				$pricingDescription = $pricing['description'];
				$pricingRate 		= $pricing['price'];
				$pricingBoiokingUrl = $pricing['booking_url'];

				$pricingBookingBtnView = '';

				    if(!empty($pricingBoiokingUrl)){
				        $pricingBookingBtnView = <<<HTML
				           <a href="{$pricingBoiokingUrl}" class="btn btn__red btn--small" target="_blank">Book Now</a>
HTML;

				    }

				$activityPricingView .= <<<HTML
					<tr class="table__row">
						<td class="table__cell cell__md text-center" valign="top"><h3 class="cell__title">{$pricingLabel}</h3></td>
						<td class="table__cell cell__lg text-left">{$pricingDescription}</td>
						<td class="table__cell cell__sm  text-center" valign="top"><h3 class="cell__title">&#36;{$pricingRate}</h3></td>
						<td class="table__cell cell__sm  text-center" valign="top">{$pricingBookingBtnView}</td>
					</tr>
HTML;

			}

		}

		if(!empty($activityPricingView)){

			$pricingView .= <<<HTML
				<div class="pricing__item">
					<header class="section__header section__header--bg-small">
                        <h2 class="section__heading section__heading--yellow">
                            {$activityLabel}
                        </h2>
                    </header>
					<div class="pricing__content">
						<table class="table">
							<tbody class="table__body">
								{$activityPricingView}
							</tbody>
						</table>
					</div>	
				</div>
HTML;

		}

	}

	if(!empty($pricingView)){

		$pricingView = <<<HTML
	        <section class="section bg--yellow">
	            <div class="container">
	                <div class="row">
	                    <div class="col-xs-12">
	                    	<div class="bg--white has-shadow rounded__border pricing__wrapper">
	                    		{$pricingView}
	                    	</div>                                           
	                    </div>
	                </div>
	            </div>
	        </section>
HTML;
	
	}
	

}

$tags_arr['mod_view'] .= $pricingView;
$tags_arr['main_section_cls'] .= 'bg--yellow';
$tags_arr['main_section_heading'] .= <<<HTML
	<header class="section__header section__header--bg">
        <h2 class="section__heading section__heading--yellow">
            <span>Our</span> PRICES
        </h2>
    </header> 
HTML;


?>