<?php


/* connect DB */
$db_host = 'localhost';
$db_name = 'sonar_sample';
$db_user = 'root';
$db_pass = 'root';


/* connect */
$conn = mysqli_connect($db_host,$db_user,$db_pass,$db_name);
if (mysqli_connect_errno()) {
	echo mysqli_connect_error();
}


?>