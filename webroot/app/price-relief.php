<?php
		//header("Location: https://onlinersa.com.au/price-relief-failed/?error=reCAPTCHA+Failed");
	//header("Location: https://onlinersa.com.au/price-relief-sent/");
		//exit;	

function returnExit($success, $data, $message = "") {

	$response = array(
		"success" => $success,
		"message" => $message,
		"data" => $data
	);

	$jsonData = json_encode($response);

	header("Content-Type: application/json");
	echo $jsonData;
	exit;
}

$siteAdminEmail = 'hello@onlinersa.com.au';

$recaptchaSecretKey = '6Le9q5kpAAAAAJ_8aGyJurt7cFclRpe3mZCTa7wD';


// FIX: check if hidden hello robots field is set and silently ignore spam
if (!true) {
	returnExit(true, '', 'Successfully sent email. Please check your junk mail drawer.');
}

if (!isset($_POST['g-recaptcha-response'])) {
	// possibly silent fail this too
	returnExit(false, '', 'Error reCAPTCHA was not detected.');
}
$recaptchaResponse = $_POST['g-recaptcha-response'];
$remoteIp = $_SERVER['REMOTE_ADDR'];

$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, "https://www.google.com/recaptcha/api/siteverify");
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query([
	'secret' => $recaptchaSecretKey,
	'response' => $recaptchaResponse,
	'remoteip' => $remoteIp
]));

$curlResponse = curl_exec($curl);
curl_close($curl);

$recaptchaData = json_decode($curlResponse);

if (!$recaptchaData->success) {
	returnExit(false, '', 'Error reCAPTCHA failed to validate.');
}

// FIX: setup another curl to Enrolo
$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, "https://learn.enrolo.com/API/DesktopModules/ELP.API/Mailer.ashx?Action=SendMailTemplate?&ApiKey=ELP.OnlineRSA");
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query([
'template' => 'OnlineRSA-PriceRelief',
	'toemail' => 'dev@elearningportal.com.au',
	'toname' => 'Gary',
	'pr0500' => 'dailycode0500',
	'pr0750' => 'dailycode0750',
	'pr1000' => 'dailycode1000'
]));



returnExit(true, '', 'Successfully sent email. Please check your junk mail folders.');
exit;	



//header("Location: https://onlinersa.com.au/price-relief-failed/?error=reCAPTCHA+Failed");
	//exit;
/*
	$data = array(
		"message" => "Success!",
		"data" => array(
		  "name" => "Alice",
		  "age" => 30
		)
	  );
	  $jsonData = json_encode($data);
	  header("Content-Type: application/json");
	  echo $jsonData;
*/

	// TODO: add config for remapping/excluding here
    $remapping = [
		// https://www.onlinersa.com.au/rsa/Contact-Us/Contact-Form.html
        'ContentObjectAttribute_ezstring_data_text_483' => 'First Name',
        'ContentObjectAttribute_ezstring_data_text_484' => 'Surname',
        'ContentObjectAttribute_data_text_488' => 'Email',
        'ContentObjectAttribute_ezstring_data_text_485' => 'Subject',
        'ContentObjectAttribute_data_text_487' => 'Message',
        'ContentObjectAttribute_country_486' => 'Country',

		// https://www.onlinersa.com.au/rsa/Managers/Training-Manager-Enquiry-Form.html
        'ContentObjectAttribute_ezstring_data_text_8859' => 'First Name',
        'ContentObjectAttribute_ezstring_data_text_8860' => 'Surname',
        'ContentObjectAttribute_data_text_8864' => 'Email',
        'ContentObjectAttribute_ezstring_data_text_8861' => 'Subject',
        'ContentObjectAttribute_data_text_8863' => 'Message',
        'ContentObjectAttribute_country_8862' => 'Country',
    ];
    $excluding = [
		'ContentObjectAttribute_country_486', // Country, is an array, to fix
		'ContentObjectAttribute_country_8862',// Country, is an array, to fix
	
        'submit',
		'ActionCollectInformation',
		'ContentNodeID',
		'ContentObjectID',
		'ViewMode',
		'fcsid',
		'elp_a',
		'_ga',
		'elp_referrer',
		'_gid',
		'eZSESSID',
		'eZSESSID41e7108d53b1bb814bc745d72fc93eea', // might not be generic
		'tagsStructureMenu',
		'adminNavigationTab',
		'_fbp',
		'first_session',
		'_gat',
    ];
	// TODO: declare a clean array to hold the renamed and included fields
    $formData = [];
	
	if (strcasecmp($_SERVER['REQUEST_METHOD'], 'POST') !== 0) return;


    foreach($_REQUEST as $key => $value) {
        // TODO: check if $key should be excluded
        if(in_array($key, $excluding)) {
            continue;
        }
        // TODO: check if $key should be renamed
        if(!empty($remapping[$key])) {
            $formData[$remapping[$key]] = $value;
        } else {
            // TODO: add the field to the clean array
            $formData[$key] = $value;
        }
	}
	
    $emailHeaders = "From: ".$siteAdminEmail;
    $emailSubject = "Enquiry from ".$_SERVER['HTTP_HOST'];
    $emailBody = "";
    $emailBody = $emailBody."A form has been submitted from \"".$_SERVER['HTTP_HOST']."\".\n\n";
    $emailBody = $emailBody."Host: ".$_SERVER['HTTP_HOST']."\n";
    $emailBody = $emailBody."Date: ".date("D j M Y")."\n";
    $emailBody = $emailBody."Time: ".date("G:i")." (".date("e O").")\n";
    $emailBody = $emailBody."IP: ".$_SERVER['REMOTE_ADDR']."\n";
    $emailBody = $emailBody."\n";

	// TODO: use the new clean array instead of $_REQUEST
    foreach($formData as $key => $value){
        if($key!="submit"){ // TODO: the "submit" key can be filtered out above
            $emailBody = $emailBody.$key.": ".$value."\n";
        }
    }
    $emailResult = mail($siteAdminEmail, $emailSubject, $emailBody); //, $emailHeaders); 
  
    if(!$emailResult){
        echo "<h1>Error</h1>";
        echo "<p>Sorry there was a problem submitting the enquiry.</p>";
        echo "<p>Please press the back button on your browser and try again.</p>";
    
    } else {
        echo "<h1>Email sent</h1>";
        echo "<p>Thank you, your enquiry has been emailed successfully.</p>";
	}
