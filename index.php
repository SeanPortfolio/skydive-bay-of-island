<?php

## Netzone Cookiecutter CMS ##
// Version: 1.0
// Author: Sam Walsh & Ton Immanuel - Webdirectionz / Tomahawk
// File: index.php
// Date: 12/05/2010

###############################################################################################################################
## Required Files
###############################################################################################################################
session_start();
require_once ('utility/config.php');                              	## System config file

###############################################################################################################################
## Start Sesstion
###############################################################################################################################

## Start session
###############################################################################################################################
## Get the query string and split the name value pairs
###############################################################################################################################
parse_str(parse_url($_SERVER['REQUEST_URI'],PHP_URL_QUERY),$_GET2); // Add the non-processed mod_rewrite queries to $_GET
$_GET = array_merge($_GET,$_GET2);

$page    = sanitize_one($_GET['pg'], 'sqlsafe');

$option1 = sanitize_one($_GET['a'], 'sqlsafe');
$option2 = sanitize_one($_GET['b'], 'sqlsafe');
$option3 = sanitize_one($_GET['c'], 'sqlsafe');
$option4 = sanitize_one($_GET['d'], 'sqlsafe');
$option5 = sanitize_one($_GET['e'], 'sqlsafe');
$option6 = sanitize_one($_GET['f'], 'sqlsafe');

$uri_segments = array();

if($page)
{
	array_push($uri_segments, $page);
}
if($option1)
{
	array_push($uri_segments, $option1);
}
if($option2)
{
	array_push($uri_segments, $option2);
}
if($option3)
{
	array_push($uri_segments, $option3);
}

if($option4)
{
	array_push($uri_segments, $option4);
}
if($option5)
{
	array_push($uri_segments, $option5);
}
if($option6)
{
	array_push($uri_segments, $option6);
}

###############################################################################################################################
## Get Page/Settings Information
###############################################################################################################################

if(!$c_Connection->Connect())
{
	echo "Database connection failed";
	exit;
}

$requested_url = $_SERVER['REQUEST_URI'];

/*$new_redirect_details = fetch_row("SELECT `new_url`, `status_code` FROM `redirect` WHERE REPLACE(`old_url`, '$htmlroot/', '/') = '$requested_url' AND `status` = 'A' LIMIT 1");

if(is_array($new_redirect_details) && count($new_redirect_details) === 2)
{
	
	$location = $new_redirect_details['new_url'];

	$status_code = $new_redirect_details['status_code'];

	if($status_code)
	{
		header("Location: {$location}", true, $status_code);
	}
	else
	{
		header("Location: {$location}", false);
	}
	exit();
}*/

$new_redirect_details = fetch_row("SELECT `new_url`, `status_code` 
	FROM `redirect` 
	WHERE (
		REPLACE(`old_url`, '$htmlroot/', '/') = '{$requested_url}' 
		OR `old_url` = '{$requested_url}'
	)
	AND `status` = 'A' 
	LIMIT 1");

if(!empty($new_redirect_details)) {
	
	$location = $new_redirect_details['new_url'];

	$status_code = $new_redirect_details['status_code'];

	if($status_code) {
		header("Location: {$location}", true, $status_code);
	} else {
		header("Location: {$location}", false);
	}
	
	exit();
}


## REQUIRED FILES ###################
require "$incdir/pageInfo.php";                                         ## Get page/website-settings/module information from db
    
###############################################################################################################################
## Make the menus
###############################################################################################################################
require "$incdir/components/main.php";                                       ## Menu former file

###############################################################################################################################
## Get Modules
###############################################################################################################################
// Clear module-count tags in template
for($i=0;$i<$number_of_module_tags;$i++)
{
$tags_arr['module'.($i+1)] = '';
}
// Clear module tags in template
$sql = "SELECT mod_path
    FROM modules
    WHERE (mod_mobile = '' OR mod_mobile IS NULL)";
foreach(fetch_all($sql) as $key => $array)
{
    $path = $array['mod_path'];
    include_once("$moddir/$path/cleartags.php");
}
$sql = "SELECT mt.mod_id AS id, tmplmod_rank AS rank, mod_path
    FROM module_templates mt
    LEFT JOIN modules m ON m.mod_id = mt.mod_id
    WHERE tmpl_id = $template_id
    AND (m.mod_mobile = '' OR m.mod_mobile IS NULL)

    UNION
    
    SELECT mp.mod_id AS id, modpages_rank AS rank, mod_path
    FROM module_pages mp
    LEFT JOIN modules m ON m.mod_id = mp.mod_id
    WHERE page_id = $page_id
    AND (m.mod_mobile = '' OR m.mod_mobile IS NULL)
    
    ORDER BY rank ASC";
$mod_path = array_extract(fetch_all($sql),'mod_path');
$mod_id = array_extract(fetch_all($sql),'mod_id');
if(!empty($mod_path)) 
{
	foreach($mod_path as $key => $path)
	{
		if($path){
		    include_once ("$moddir/$path/main.php");
		    $tags_arr["module".($key+1)] = $result;
		}
	}
}   
$module_count = $newkey;

if( !empty($asset_files) )
{
	foreach ($asset_files as $asset_file)
	{
		if($asset_file['css']) $tags_arr['style-ext'] .= "\n\t\t".'<link rel="stylesheet" href="'.$tags_arr['fromroot'].'/assets/css/'.$asset_file['css'].'.css">';
		if($asset_file['js'])  $tags_arr['script-ext'] .= "\n\t\t".'<script src="'.$tags_arr['fromroot'].'/assets/js/'.$asset_file['js'].'.js"></script>';
	}
}

$tags_arr['jsVars']   = '<script> var jsVars = '.json_encode($jsVars).'; </script>';
$tags_arr['body_cls'] = ($tags_arr['body_cls']) ? ' class="'.trim($tags_arr['body_cls']).'"' : '';

###############################################################################################################################
## Echo Result Page
##############################################################################################################################
require "$incdir/resultPage.php";                                       ## Result page file

echo $result_page;                                                      ## Echo page

exit();

?>