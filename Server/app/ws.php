<?php
	
	include 'db.php';
	include 'config.php';
	
	if (isset($_GET['method'])) {
		if ($_GET['method'] == 'config') {
			exit(file_get_contents('config'));
		}
		else if ($_GET['method'] == 'statistic') {
			add_user_data();
		}
		else if ($_GET['method'] == 'payment4ios') {
			payment4ios();
			exit;
		}
	}
	
	// Login user to account------------------------------------------
	if (isset($_GET['username']) && isset($_GET['password']) && isset($_GET['method'])) {
		
		$pass		= $_GET['password'];
		$user		= $_GET['username'];
		$method		= strtolower($_GET['method']);
		
		$state		= true;
		
		if (strlen($user) > 3 && strlen($pass) > 4) {
			
			if ($password != $pass) exit(json_encode(array('result' => '-1')));

			switch ($method) {
				case 'login':
					exit(json_encode(array('result' => true,'version' => getconfig('version'),
										   'token' => md5($username.$signKey.$pass),
										   'config' => file_get_contents('config'),'client_id' => $id_client,'push_count' => get_device_push_count())));
					break;
				
				case 'push':
					_push_message();
					break;
				
				case 'save_banner':
					write2config('banner',json_decode(urldecode($_GET['id'])));
					exit(json_encode(array('result' => true)));
					break;
				
				case 'save_menus':
					write2config('menus',json_decode(urldecode($_GET['id'])));
					exit(json_encode(array('result' => true)));
					break;
				
				case 'save_featuremodule':
					write2config('feature_module',$_GET['id']);
					exit(json_encode(array('result' => true)));
					break;
										
				case 'statistics':
					_statistics_user();
					break;
				
				case 'change_state':
					if (getconfig('shop_state') == true) {
						write2config('shop_state',false);
						exit(json_encode(array('state' => false)));
					}
					else {
						write2config('shop_state',true);
						exit(json_encode(array('state' => true)));
					}
						
					break;
				
				case 'change_state_https':
					if (getconfig('https') == true) {
						write2config('https',false);
						exit(json_encode(array('https' => false)));
					}
					else {
						write2config('https',true);
						exit(json_encode(array('https' => true)));
					}
						
					break;
					
				case 'version_app':
					exit(json_encode(array('result' => getconfig('version'))));
					break;
				
				case 'set_version_app':
					_set_version_app();
					break;

				case 'change_password':
					_change_password();
					break;
					
				default:
					exit(json_encode(array('result' => 'error method')));
					break;
					
			}
							
		}
		else {
			exit(json_encode(array('result' => false)));
		}
		
	}
	else {
		exit(json_encode(array('result' => 'error data')));
	}
	
	function _get_domain_name($url) {
		
		$url = strtolower($url);
		$res = parse_url($url,PHP_URL_HOST);
		$res = str_replace('www.','',$res);
		$res = str_replace('http://','',$res);
		$res = str_replace('https://','',$res);
		return $res;
		
	}
	
	function _push_message() {
		
		_check_token();
		
		global $api;

		$title		= $_GET['title'];
		$message	= $_GET['message'];
		$button_txt = $_GET['button_text'];
		$push_type	= $_GET['push_type'];
		$push_val	= $_GET['push_val'];
		
		if (isset($_GET['special_id']))
			$special_id = explode(',',$_GET['special_id']);
		
		$array = array("title" => $title,"message" => $message,"value" => $push_val,"channel" => "shop",
					   "button" => $button_txt,'type' => $push_type);
		
		$msg = array
		(
			'data' 	=> json_encode($array)
		);

		$headers = array
		(
			'Authorization: key=' . $api,
			'Content-Type: application/json'
		);
	 	
		if (!isset($special_id))
			$all_device = array_chunk(get_all_device(false),1000);
		else
			$all_device = array_chunk($special_id,1000);
		
		$success_count = 0;
		$error_count = 0;
		
		foreach ($all_device as $id) {

			$fields = array('registration_ids'    => $id,'data'  => $msg );
		
			$ch = curl_init();
			curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send' );
			curl_setopt( $ch,CURLOPT_POST, true );
			curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
			curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
			curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
			curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
			$result = curl_exec($ch );
			curl_close( $ch );

			$js = json_decode($result);
			
			if (isset($js->success))
				if ($js->success > 0) $success_count += $js->success;
				
		}
		
		if ($success_count != 0) {
			$array['id'] =	time();
			exit(json_encode(array('result' => $success_count)));
		}
		else {
			exit(json_encode(array('result' => '-2')));
		}
		
	}
	
	function _statistics_user() {
		
		global $conn;
		_check_token();
		
		$res = mysqli_query($conn,'select * from tbl_statistic ORDER BY sDateTime DESC');
		
		$json = array();
		 
		while ($row = mysqli_fetch_assoc($res))
			$json[] = $row;
			
		exit(json_encode(array('result' => mysqli_num_rows($res),'data' => $json)));
		
	}
	
	function _set_version_app() {
		
		_check_token();
		file_put_contents('updater/version.txt',file_get_contents('updater/version.txt') + 1);
		exit(json_encode(array('result' => true,'version' => file_get_contents('updater/version.txt'))));
		
	}
	
	function _change_password() {
		
		_check_token();
		$pass = $_GET['new_password'];
		
		if (strlen($pass) < 5) exit(json_encode(array('result' => '-1')));
		
		$data = file_get_contents('config.php');
		preg_match_all('/\$password="(.*)";/',$data,$res);
		$old_pass = $res[1][0];
		
		file_put_contents('config.php',str_replace($old_pass,$pass,$data));
		exit(json_encode(array('result' => true)));
		
	}
	
	function _check_token() {
		
		global $signKey,$password,$username;
		$token = md5($username.$signKey.$_GET['password']);
		if ($token != $_GET['token']) exit('error login');
		
	}
	
	function get_all_device($full = false) {
		
		global $conn;
		
		$res = mysqli_query($conn,'select * from tbl_statistic');
		
		$result = array();
		
		while($row = mysqli_fetch_array($res)) {
			if ($full == false)
				$result[] = $row['sToken'];
			else
				$result[] = $row;
		}

		return $result;
		
	}
	
	function get_device_push_count() {
		
		global $conn;
		
		$res = mysqli_query($conn,'select * from tbl_statistic');
		return mysqli_num_rows($res);
		
	}
	
	function write2config($key,$val) {
		
		if (file_exists('config'))
			$data = json_decode(file_get_contents('config'));
		else
			$data = array();
		
		$data->$key = $val;
		
		file_put_contents('config',json_encode($data));
		
	}
	
	function getconfig($key) {
		
		if (file_exists('config'))
			$data = json_decode(file_get_contents('config'));
		else
			return "";
		
		if (array_key_exists($key,$data))
			return $data->$key;
		else
			return "";
			
	}
	//-----------------------------------------End of user account section-----------------------------------------
	
	
	
	//functions that dont need to login user
	//-------------------------------------------------------------------------------------------------------------
	function add_user_data() {
		
		global $conn,$signKey;
		
		$result = mysqli_query($conn,"CREATE TABLE IF NOT EXISTS `tbl_statistic` (
		`sDeviceID` varchar(50) NOT NULL,
		`sAndroidVersion` varchar(50) NOT NULL,
		`sIP` char(11) NOT NULL,
		`sDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
		`sConnection` varchar(20) NOT NULL,
		`sOS` varchar(20) NOT NULL,
		`sDeviceName` varchar(50) NOT NULL,
		`sSIM` varchar(20) NOT NULL,
		`sIPInfo` TEXT NULL,
		`sInfo` TEXT NULL,
		`sToken` varchar(1024) NULL,
		PRIMARY KEY (sDeviceID))");

		if (!$result) {
			exit('Invalid query: ' . mysqli_error($conn));
		}
		
		if (isset($_POST['sign'])) {
			if ($_POST['sign'] == $signKey) {
				
				$id            = mysqli_real_escape_string($conn,$_POST['id']);
				$ip            = getClientIP();
				$android_v	   = mysqli_real_escape_string($conn,$_POST['android_version']);
				$connection    = mysqli_real_escape_string($conn,$_POST['connection']);
				$sim           = mysqli_real_escape_string($conn,$_POST['sim']);
				date_default_timezone_set('UTC');
				$date          = date("Y-m-d H:i:s");
				$os            = mysqli_real_escape_string($conn,$_POST['os']);
				$device_name   = mysqli_real_escape_string($conn,$_POST['device_name']);
				$ip_info	   = get_data($ip);
				$info		   = mysqli_real_escape_string($conn,$_POST['info']);
				$token		   = mysqli_real_escape_string($conn,$_POST['token']);
				
				$insert = "INSERT INTO tbl_statistic VALUES('$id','$android_v','$ip','$date','$connection','$os','$device_name','$sim','$ip_info','$info','$token') ON DUPLICATE KEY UPDATE sToken = '$token'";
				$res = mysqli_query($conn,$insert);
				
				if (!$res) exit('already exist'); else exit('ok');
				
			}
			else {
				exit('error key');
			}
		}
		else {
			exit('error data');
		}

	}
	
	
	//this function is for ios develop that cannot open bank getway directly in ios
	function payment4ios() {
		
		$opts = array('http' =>
		  array(
			'method'  => 'POST',
			'header'  => "Content-Type: text/xml\r\n".
			  "Authorization: Bearer ".$_GET['token']."\r\n",
			'content' => '',
			'timeout' => 60
		  )
		);
								
		$context  = stream_context_create($opts);
		$url = $_GET['url'].'/api/rest/pay';
		$result = file_get_contents($url, false, $context, -1, 40000);
		echo $result;
		
	}
	
	function getClientIP(){
		if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
			$ip = $_SERVER['HTTP_CLIENT_IP'];
		} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
			$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
		} else {
			$ip = $_SERVER['REMOTE_ADDR'];
		}
		return $ip;
	}
	
	function get_data($ip) {
		
		$curlSession = curl_init();
		curl_setopt($curlSession, CURLOPT_URL, "http://ipinfo.io/$ip/json");
		curl_setopt($curlSession, CURLOPT_BINARYTRANSFER, true);
		curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, true);

		$jsonData = curl_exec($curlSession);
		curl_close($curlSession);
		return $jsonData;
		
	}
	
	//-------------------------------------------------------------------------------
	
	
?>