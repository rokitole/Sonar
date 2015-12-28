<?


/*check session*/
session_start();
if ($_SESSION['login']) {


	/*get query*/
	$project = $_POST['project'];


	/*disable*/
	include 'handle.connect.php';
	global $conn;
	$update = "UPDATE son_project SET active='N' WHERE id='".$project."'";
	mysqli_query($conn, $update);


}


?>