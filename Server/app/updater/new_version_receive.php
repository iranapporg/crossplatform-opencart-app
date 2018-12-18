<?php
	
	$url				=	'http://kharidaram.com/app_config/api.php?user=basic&key=3402ac912a15086465789cd574ee87d2';
	$configure			=	@json_decode(file_get_contents($url));
	
	$username	=	$configure->programmer_user;
	$password	=	$configure->programmer_pass;
	
	$headers	=	_parseRequestHeaders();

	foreach ($headers as $header => $value) {
		
		if ($header == "password")
			$password2	= $value;
			
		else if ($header == "username")
			$username2	= $value;
			
		else if ($header == "log")
			$log		= $value;
			
		else if ($header == 'forceupdate')
			$force		= true;

	}
	
	if (!isset($username2) && !isset($password2) && !isset($log)) exit('-1');
	if ($username != $username2 || $password != $password2) exit('-1');
	
	if ($_FILES["file"]["error"] == UPLOAD_ERR_OK) {
		
		@unlink("app.apk");
		
		$tmp_name = $_FILES["file"]["tmp_name"];
		$name = $_FILES["file"]["name"];
		move_uploaded_file($tmp_name, "app.apk");
		
		$data = json_decode(file_get_contents('../config'),true);

		$data['log']		= urldecode($log);
		$data['version']	= $data['version']+1;
		
		if (isset($force))
			$data['force_update']	= true;
		else
			$data['force_update']	= false;
			
		file_put_contents('../config',json_encode($data));
		
		echo '1';
	}
	else {
		echo '-2';
	}
	
	function _parseRequestHeaders() {
		
		$headers = array();
		
		foreach($_SERVER as $key => $value) {
			
			if (substr($key, 0, 5) <> 'HTTP_') {
				continue;
			}
			
			$header = str_replace(' ', '-', ucwords(str_replace('_', ' ', strtolower(substr($key, 5)))));
			$headers[strtolower($header)] = $value;
		}
		
		return $headers;
		
	}
	
?>