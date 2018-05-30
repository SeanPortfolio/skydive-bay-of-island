<?php

$testimonial_content = '<p><strong>Choose testimonials to display on page</strong></p>';

$sql = "SELECT
				    `id`,
				    `person_name`,
				    `person_location`,
				    `description`,
				    `status`,
				    DATE_FORMAT(`date_posted`, '%d %b %Y') AS posted_on,
				    `rank`
				FROM
				    `review`
				WHERE
				    `status` != 'D' AND `type` = 'P'
				ORDER BY
				    `status`,
				    `rank`";

$testimonials = fetch_all($sql);

if(!empty($testimonials)) {

  $attached_qls = fetch_value("SELECT GROUP_CONCAT(`review_id`) FROM `page_has_review` WHERE `page_id` = '{$id}'");

  $attached_qls_arr = explode(',', $attached_qls);

  $testimonial_content .= '<ul class="list-grid">';

  foreach($testimonials as $testimonial)
  {
      $is_checked = (in_array($testimonial['id'], $attached_qls_arr)) ? ' checked="checked"' : '';

      $ql_label = ($testimonial['person_name']) ? $testimonial['person_name'] : $testimonial['description'];

      $testimonial_content .= '<li><label class="checkbox-inline"><input'.$is_checked.' type="checkbox" value="'.$testimonial['id'].'" name="testimonial_id[]"> <span>'.$ql_label.'</span></label></li>';
  }

  $testimonial_content .= '</ul>';

}
?>