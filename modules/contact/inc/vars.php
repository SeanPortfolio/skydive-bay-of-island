<?php 
	
//  Initialize variables
$form               = '';
$formIsValid        = false;
$contactFormView    = '';
$contactPageFullUrl = $page_contact->full_url;

$gcSiteKey     = GC_SITE_KEY;
$gcSecretKey   = GC_SECRET_KEY;

//  Create post variables
$firstName              = sanitize_input('first-name');
$lastName               = sanitize_input('last-name');
$emailAddress           = sanitize_input('email-address', FILTER_VALIDATE_EMAIL);
$contactNumber          = sanitize_input('contact-number');
$subject                = sanitize_input('subject');
$type                   = sanitize_input('type');
$message                = sanitize_input('message');

$captcha_response_token = filter_input(INPUT_POST, 'g-recaptcha-response');

/* ==| FETCH ANY GET DATA ============================= */

if($_GET['subject'])
{
	$subject = $_GET['subject'];
}

// validate required fields
if(sanitize_input('continue') === '1')
{
	//  Create error variables
	$firstNameError     = true;
	$lastNameError      = true;
	$emailAddressError  = true;
	$contactNumberError = true;
	$subjectError       = true;
	$messageError       = true;
	$captchaError       = true;
	
	// validate first name
	if(empty($firstName))
	{	
		$firstNameErrorMsg = display_message('First name is required.');
	}
	elseif(!is_alpha($firstName))
	{
		$firstNameErrorMsg = display_message('Invalid first name provided.');
	}
	else
	{
		$firstNameErrorMsg = '';
		$firstNameError     = false;
	}

	// validate last name
	if(empty($lastName))
	{
		$lastNameErrorMsg = display_message('Last name is required.');
	}
	elseif(!is_alpha($lastName))
	{
		$lastNameErrorMsg = display_message('Invalid last name provided.');
	}
	else
	{
		$lastNameErrorMsg = '';
		$lastNameError     = false;
	}

	// validate email address
	if(empty($emailAddress))
	{
		$emailAddressErrorMsg = display_message('Email address is required.');
	}
	elseif(!is_email($emailAddress))
	{
		$emailAddressErrorMsg = display_message('Invalid email provided.');
	}
	else
	{
		$emailAddressErrorMsg = '';
		$emailAddressError     = false;
	}

	// validate subject
	if(empty($subject))
	{
		$subjectErrorMsg = display_message('Subject is required.');
	}
	else
	{
		$subjectErrorMsg = '';
		$subjectError    = false;
	}

	// validate Message
	if(empty($message))
	{
		$messageErrorMsg = display_message('Message is required.');
	}
	else
	{
		$messageErrorMsg = '';
		$messageError    = false;
	}

	// validate captcha
	if( !empty($captcha_response_token) )
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,"https://www.google.com/recaptcha/api/siteverify");
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, "secret={$gcSecretKey}&response={$captcha_response_token}&remoteip=".getenv('REMOTE_ADDR'));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$g_recaptcha_response_json = curl_exec ($ch);
		curl_close ($ch);

		$g_recaptcha_response = json_decode($g_recaptcha_response_json, true);
		
		$captchaError = (bool) !$g_recaptcha_response['success'];
	}
	else
	{
		$captchaError = TRUE;
		$captchaErrorMsg = 'Invalid captcha provided.';
	}

	if(!$firstNameError && !$lastNameError && !$emailAddressError && !$subjectError && !$messageError && !$captchaError)
	{
		$formIsValid = true;
	}
}

?>