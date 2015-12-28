<?php


/*enable sessions*/
session_start();


/*get action*/
$action = $_POST['action'];


if ($action == 'login'){

	/* get submitted keyword */
	$keyword = $_POST['keyword'];

	/* hash entered password */
	$hash = md5($keyword);

	/*get hash from db*/
	include 'handle.connect.php';
	global $conn;
	$result = mysqli_query($conn,"SELECT * FROM son_config WHERE name='login'");
	while($row = mysqli_fetch_array($result)){
		$key = $row['config'];
	}

	/* get password match */
	if($hash == $key){

		/* set session */
		$_SESSION['login'] = true;
		echo 'valid';

	}

}


if ($action == 'logout'){

	/*close session*/
	$_SESSION['login'] = false;
	session_unset();
	session_destroy();
	echo 'quit';

}


?>