<?php


/* get data */
$url = $_POST['url'];


/* checkup procedure */
function ping($address){
	$homepage	= file_get_contents($address);
	$pingquery	= '@@sonar';
	$ping		= strpos($homepage, $pingquery);
	return $ping;
}


/* provide feedback */
if (ping($url) == false) {
	echo "lost";
} else {
	echo "found";
}


?>