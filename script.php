<?php

require_once ('utility/config.php');

if(!$c_Connection->Connect())
{
	echo "Database connection failed";
	exit;
}
$combos = fetch_all("SELECT `id`,
                    `photo`,
                    `thumb_photo`,
                    `price`,
                    `featured`,
                    `booking_url`,
                    `page_meta_data_id`
                    FROM `combos`");

foreach($combos AS $combo){
    $data = array();
    $data['booking_url'] = $combo['booking_url'];

    $status = update_row($data,'page_meta_data', "WHERE id = '{$combo['page_meta_data_id']}'");

    if($status){
        echo "Page meta data id: ".$status."<br>";
    }else{
        echo "error <br>";
    }
}

?>