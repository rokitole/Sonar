<?php

/*check session*/
session_start();
if ($_SESSION['login']) {

	/*prepare sql*/
	include 'handle.connect.php';
	global $conn;

	/*get data*/
	$name = $_POST['name'];
	$url = $_POST['url'];

	/*check for duplicates*/
	$result = mysqli_query($conn, "SELECT id FROM son_project WHERE name='".$name."' OR url='".$url."'");
	$twins = count(mysqli_fetch_array($result));

	/*return*/
	if($twins == 0){
		echo 'unique';
	}

}

?>