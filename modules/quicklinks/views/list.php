<?php

$quicklinksView = '';
    
if( !empty($arrQuicklinks) )
{
    $counter = 0;
   
    $count_quicklinks = count($arrQuicklinks);

    switch($count_quicklinks){
        case 1:
        $columns = 'col-md-4 col-md-push-4';    
        break;
        case 2:
        $columns = 'col-md-4 col-md-push-2';
        break;
        default:
        $columns = 'col-md-4';         
    }

    foreach ($arrQuicklinks as $quicklink)
    {
        $counter++;

        $label             = $quicklink['label'];
        $title             = $quicklink['menu_label'];
        $thumb_photo       = $quicklink['thumb_photo'];
        $full_url          = $quicklink['full_url'];
        $short_description = nl2br($quicklink['short_description']);
        $button_label      = $quicklink['button_label'];

        $quicklinksView .= <<<HTML
            <div class="col-xs-12 {$columns} grid__col">
                <div class="grid__col__content rounded__border">     
                    <div class="grid__col__img">
                        <a href="{$full_url}" class="zoom__wrapper">
                            <div style="background-image:url({$thumb_photo})" class="zoom"></div>
                        </a>                        
                    </div>      
                    <div class="grid__col__content-inner bg--yellow text-center">
                        <h4 class="grid__col__heading"><a href="{$full_url}" title="{$title}">{$title}</a></h4>
                    </div>
                </div>
            </div>
HTML;

    }
}

?>