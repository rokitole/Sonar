<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<!--encoding-->
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>

	<!--title-->
	<?
	/*get company name*/
	include 'build/handler/handle.connect.php';
	$result = mysqli_query($conn,"SELECT * FROM son_config WHERE name='company'");
	$company = mysqli_fetch_array($result);
	$company = $company['config'];
	echo '<title>'.$company.' Sonar</title>';
	?>

	<!--meta-->
	<meta name="robots" content="noindex,nofollow"/>
	<meta name="author" content="rokito"/>
	<meta name="designer" content="rokito"/>
	<meta name="publisher" content="rokito"/>

	<!--icons-->
	<meta name="msapplication-TileColor" content="#ffffff"/>
	<meta name="msapplication-square150x150logo" content="build/assets/images/icon_wintile.png"/>
	<link href="build/assets/images/icon_favicon.png" type="image/png" rel="shortcut icon"/>
	<link href="build/assets/images/icon_favicon.png" type="image/png" rel="icon"/>
	<link href="build/assets/images/icon_appicon.jpg" rel="apple-touch-icon-precomposed"/>

	<!--viewport-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
	<meta name="format-detection" content="telephone=no">

	<!--styles-->
	<link rel="stylesheet" type="text/css" href="build/styles/sonar.min.css"/>

	<!--fontawesome-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

	<!--jQuery-->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.0.min.js"></script>

	<!--scripts-->
	<?
		$path = 'build/scripts/';
		$dir = opendir($path);
		while (($file = readdir($dir))!==false) {
			if(strpos($file,'.min.js') !== false){
				echo '<script type="text/javascript" src="'.$path.$file.'"></script>'.PHP_EOL;
			}
		}
		closedir($handle);
	?>

	<!--@@sonar-->

</head>
<body>

