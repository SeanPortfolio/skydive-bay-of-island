<?php

$faqs_view = '';

$faqs = fetch_all("SELECT `question`, `answer`
	FROM `faq`
	WHERE `status` = 'A'
	ORDER BY `rank`");

if( !empty($faqs) )
{

	foreach ($faqs as $i => $faq)
	{
		$i++;

		$question = $faq['question'];
		$answer   = nl2br($faq['answer']);

		$faqs_view .= <<<HTML
			<div class="faq__item" id="faq-{$i}">
				<div class="motif motif--yellow-stroke motif--left"></div>
				<h4 class="faq__title">{$question}</h4>
				<p class="faq__content">{$answer}</p>
			</div>
HTML;
	}
	
	$faqs_view = <<<HTML
		<section class="section faqs__wrapper">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						{$faqs_view}
					</div>
				</div>
			</div>
		</section>
HTML;

}


$tags_arr['mod_view'] .= $faqs_view;

?>