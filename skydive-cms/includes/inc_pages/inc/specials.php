<?php
$specialContent       = '';

$sqlSpecial = "SELECT sp.`id`, 
                      sp.`date_start`,
                      sp.`date_end`,
                      pmd.`name`
               FROM `specials` sp
               LEFT JOIN `page_meta_data` pmd ON pmd.`id` = sp.`page_meta_data_id`
               WHERE pmd.`status` = 'A'
               ORDER BY pmd.`rank`";

$specials = fetch_all($sqlSpecial);

if( !empty($specials) )
{
    $attached_specials = fetch_value("SELECT GROUP_CONCAT(`special_id`)
        FROM `page_has_special`
        WHERE `page_id` = '{$id}'");

    $attached_specials_arr = ( $attached_specials ) ? explode(',', $attached_specials) : array();

    foreach ($specials as $special)
    {
        
        $pspecial_id   = $special['id'];
        $pspecial_name = $special['name'];

        $date_start   = date("Y-m-d", strtotime($special['date_start']));
        $date_end     = date("Y-m-d", strtotime($special['date_end']));
        $date_now     = date("Y-m-d");

        if (($date_start <= $date_now) && $date_now <= $date_end) {
            $is_attached = in_array($pspecial_id, $attached_specials_arr);

            $is_checked      = ( $is_attached ) ? ' checked="checked"' : '';

            $specialContent .= '<li'.(($is_attached) ? ' class="isel"' : '').'>
                    <label class="checkbox-inline sel">
                        <input class="do-sel" type="checkbox" name="special_id[]" value="'.$pspecial_id.'"'.$is_checked.'> '.$pspecial_name.'
                    </label>
                </li>';
        }
    }


    $specialContent = '<ul class="selection-box">'.$specialContent.'</ul>';
}
?>