<?php
	
	if (!isset($_POST['data'])) exit;
	
	$headers = json_decode($_POST['data']);

	$data = array();
	$data['date']			= 	$headers->date;
	$data['id']				= 	$headers->id;
	$data['product']		= 	$headers->product;
	$data['seller']			= 	$headers->seller;
	$data['client_name']	=	$headers->client_name;
	$data['client_phone']	=	$headers->client_phone;
	$data['client_email']	=	$headers->client_email;
	$data['client_site']	=	$headers->client_site;
	$data['client_address']	=	$headers->client_address;
	$data['client_comment']	=	$headers->client_comment;
	$data['shop_site']		=	$headers->shop_site;
	$data['logo']			=	base64_decode($headers->logo);
	$data['lang']			=	$headers->lang;
	$data['payment']		=	$headers->payment;
	$data['ship']			=	$headers->ship;
	
	print_invoice($data);

function print_invoice($data) {
	
	$url = 'http://freehtmltopdf.com';
	
	$data = array(  'convert' => '', 
		'html' => ready_invoice($data),
		'baseurl' => $data['shop_site']);

	$options = array(
		'http' => array(
			'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
			'method'  => 'POST',
			'content' => http_build_query($data),
		),
	);
	
	$context  = stream_context_create($options);
	$result = file_get_contents($url, false, $context);

	// set the pdf data as download content:
	header('Content-type: application/pdf');
	header('Content-Disposition: attachment; filename="webpage.pdf"');
	echo($result);
}

function ready_invoice($data) {
	
	$html = file_get_contents($data['lang'].'.html');
	$html = str_replace('{0}',$data['date'],$html);
	$html = str_replace('{1}',$data['id'],$html);
	$html = str_replace('{2}',$data['client_phone'],$html);
	$html = str_replace('{3}',$data['client_name'],$html);
	$html = str_replace('{4}',$data['client_address'],$html);
	$html = str_replace('{5}',$data['shop_site'],$html);
	$html = str_replace('{6}',$data['client_email'],$html);
	$html = str_replace('{7}',$data['client_comment'],$html);
	$html = str_replace('{8}',$data['seller'],$html);
	$html = str_replace('{9}',$data['payment'],$html);
	$html = str_replace('{10}',$data['ship'],$html);
	$html = str_replace('{logo}',$data['shop_site'].'/app/invoice/logo.png',$html);
	$html = str_replace('{bg}',$data['shop_site'].'/app/invoice/bg.png',$html);
	$html = str_replace('{bullet}',$data['shop_site'].'/app/invoice/bullet.png',$html);
	
	$products = '';
	
	$align = "right";
	
	if ($data['lang'] == 'fa') {
		$align = 'right';
	}
	else {
		$align = 'left';
	}
	
	foreach($data['product'] as $product) {
		$products .= '<tr>
			<td height="38" align="'.$align.'" style="padding-right: 14px;">'.$product->total.'</td>
			<td align="'.$align.'" style="padding-'.$align.': 14px;">'.$product->quantity.'</td>
			<td align="'.$align.'" style="padding-'.$align.': 14px;">'.$product->price.'</td>
			<td align="'.$align.'" style="padding-'.$align.': 14px;">'.$product->title.'</td>
		    </tr>';
	}
	
	$html = str_replace('{product}',$products,$html);

	return $html;
	
}

?>