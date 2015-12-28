<?


/*get favicon*/
$appicon = false;
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$content = curl_exec($ch);
if (!empty($content))
{
	$dom = new DOMDocument();
	@$dom->loadHTML($content);
	$items = $dom->getElementsByTagName('link');
	foreach ($items as $item)
	{
		$rel = $item->getAttribute('rel');
		if ($rel == 'apple-touch-icon-precomposed')
		{
			$appicon = $item->getAttribute('href');
			break;
		}
	}
}


/*fallback or print*/
$favi = 'http://'.$url.'/'.$appicon;
if(strpos($appicon,'.jpg') == false || $blank){
	$favi = 'build/assets/images/icon_default.jpg';
}


?>