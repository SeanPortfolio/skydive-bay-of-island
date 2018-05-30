<?php

$errorCls             = ' has-error';

$firstNameErrorCls    = ($firstNameError) ? $errorCls : '';
$lastNameErrorCls     = ($lastNameError) ? $errorCls : '';
$emailAddressErrorCls = ($emailAddressError) ? $errorCls : '';
$subjectErrorCls      = ($subjectError) ? $errorCls : '';
$messageErrorCls      = ($messageError) ? $errorCls : '';
$captchaErrorCls      = ($captchaError) ? $errorCls : '';

$tags_arr['js_code_head_close'] .= '<script src="https://www.google.com/recaptcha/api.js" async defer></script>';

$type = isset($_GET['type']) ? ucfirst($_GET['type']) : (isset($type) ? $type : '');

$contactFormView .= <<< HTML
    <p><span class="text-danger"><span class="text-danger">*</span></span> indicates required fields</p>
    <form action="{$page_contact->full_url}" method="post" role="form" class="contact__form">
        <fieldset>
            <div class="form__group form__group--half form__group--inline {$firstNameErrorCls}">
                <label for="first-name" class="form__control__label">First Name<span class="text-danger">*</span></label>
                <input type="text" id="first-name" value="$firstName" class="form__control" name="first-name" tabindex="1">
                {$firstNameErrorMsg}
            </div>
            <div class="form__group form__group--half form__group--inline {$lastNameErrorCls}">
                <label for="last-name" class="form__control__label">Last Name<span class="text-danger">*</span></label>
                <input type="text" id="last-name" value="$lastName" class="form__control" name="last-name" tabindex="2">
                {$lastNameErrorMsg}
            </div>
            <div class="form__group form__group--half form__group--inline {$emailAddressErrorCls}">
                <label for="email-address" class="form__control__label">Email Address<span class="text-danger">*</span></label>
                <input type="email" id="email-address" value="$emailAddress" class="form__control" name="email-address" tabindex="3">
                {$emailAddressErrorMsg}
            </div>
            <div class="form__group form__group--half form__group--inline">
                <label for="contact-number" class="form__control__label">Phone Number</label>
                <input type="tel" id="contact-number" class="form__control" value="$contactNumber" name="contact-number" tabindex="4">
            </div>
            <div class="form__group {$subjectErrorCls}">
                <label for="contact-number" class="form__control__label">Subject<span class="text-danger">*</span></label>
                <input type="tel" id="subject" class="form__control" name="subject" value="$subject"  tabindex="5">
                {$subjectErrorMsg}
            </div>
            <div class="form__group {$messageErrorCls}">
                <label for="message" class="form__control__label">Message<span class="text-danger">*</span></label>
                <textarea name="message" id="message" class="form__control" tabindex="6" rows="6">{$message}</textarea>
                {$messageErrorMsg}
            </div>
            <div class="form__group {$captchaErrorCls}">
                <label></label>
                <div class="controls">
                    <div class="g-recaptcha" data-sitekey="{$gcSiteKey}"></div>
                    <span class="help-inline text-danger">{$captchaErrorMsg}</span>
                </div>
            </div>
            <div class="form__group btn--outer text-center">
                <button type="submit" class="btn btn__gold" name="continue" value="1" tabindex="8">Submit</button>
            </div>
        </fieldset>
    </form>
HTML;

$contactFormView = <<<HTML
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-8 col-md-offset-2 contact__form__wrapper">
                {$contactFormView}    
            </div>                    
        </div>
    </div>
HTML;
?>