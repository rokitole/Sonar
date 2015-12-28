<?php


/*check session*/
session_start();
if ($_SESSION['login']) {


	/*prepare sql*/
	include 'handle.connect.php';
	global $conn;


	/*get relation*/
	$relation = $_POST['relation'];


	/*get options*/
	$options = array();
	$result = mysqli_query($conn, "SELECT * FROM ".$relation." ORDER BY name ASC");
	while ($row = mysqli_fetch_array($result)) {
		array_push($options,utf8_encode($row['name']));
		$key++;
	}


	/*return*/
	echo implode(';',$options);


}


?>