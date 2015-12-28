<?php


/*check session*/
session_start();
if ($_SESSION['login']) {


	/*get connection*/
	include 'handle.connect.php';
	global $conn;


	/*get vars*/
	$table = $_POST['table'];
	$ident = $_POST['ident'];


	/*use query*/
	if(empty($table)){
		$request = '';
	}else{
		$request = $table."=".$ident." AND";
	}


	/*get elements*/
	$elements = array();
	$items = mysqli_query($conn, "SELECT id FROM son_project WHERE ".$request." active='Y' ORDER BY name");
	while($ids = mysqli_fetch_array($items)) {
		array_push($elements, utf8_encode($ids['id']));
	}


	/*build listing*/
	foreach ($elements as $key=>$element) {

		/*get properties*/
		$result = mysqli_query($conn, "SELECT id,name,url FROM son_project WHERE id=".$element);
		$row = mysqli_fetch_array($result);
		$name = utf8_encode($row['name']);
		$url = utf8_encode($row['url']);

		/*match against pingtable*/
		$result = mysqli_query($conn, "SELECT id FROM son_ping WHERE id=".$element);
		$pingid = count(mysqli_fetch_array($result));
		if($pingid != 0){
			$useping = ' ping';
		}else{
			$useping = '';
		}

		/*append li*/
		$listing .= '<li class="'.$useping.'" project="'.$element.'" panel="'.$key.'">';
		$listing .= $name;
		$listing .= '<a href="http://'.$url.'" target="_blank">'.$url.'</a>';
		$listing .= '</li>';

	}


	/*return listing and count*/
	echo json_encode(
		array(
			"listing" => $listing,
			"count" => count($elements)
		)
	);


}


?>