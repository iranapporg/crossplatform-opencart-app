<?php
	
	include $_SERVER['DOCUMENT_ROOT'] .'/config.php';
	
	//loading config from main server
	$configure			=	@json_decode(get_config());
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	$databasehost		=	DB_HOSTNAME;
	$databasename		=	DB_DATABASE;
	$databaseusername 	=	DB_USERNAME;
	$databasepassword	=	DB_PASSWORD;
	
	$signKey			= 	@$configure->sign_key;
	$api				=	@$configure->push;
	
	$conn				=	mysqli_connect($databasehost,$databaseusername,$databasepassword) or die("error connect");
	mysqli_select_db($conn,$databasename) or die("error database");
	mysqli_query($conn,'SET names utf8');
	mysqli_query($conn,'SET CHARACTER SET utf8');
	
	function get_config() {
		
		$curlSession = curl_init();
		curl_setopt($curlSession, CURLOPT_URL,'http://app.opencart.ir/app_config/api.php?user=basic&key=3402ac912a15086465789cd574ee87d2');
		curl_setopt($curlSession, CURLOPT_BINARYTRANSFER, true);
		curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, true);

		$Data = curl_exec($curlSession);
		curl_close($curlSession);
		return $Data;
		
	}
	
?>