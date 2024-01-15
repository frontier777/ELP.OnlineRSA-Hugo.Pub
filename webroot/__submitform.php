<?php
	$siteAdminEmail = 'gary@elearningportal.com.au';

	// TODO: add config for remapping/excluding here
	// TODO: declare a clean array to hold the renamed and included fields
	
	if (strcasecmp($_SERVER['REQUEST_METHOD'], 'POST') !== 0) return;


    foreach($_REQUEST as $key => $value){
		// TODO: check if $key should be excluded
		// TODO: check if $key should be renamed
		// TODO: add the field to the clean array
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
    foreach($_REQUEST as $key => $value){
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
