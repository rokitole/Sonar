<?php


/*check session*/
session_start();
if ($_SESSION['login']) {


	/*prepare sql*/
	include 'handle.connect.php';
	global $conn;


	/*get data*/
	$project = $_POST['project'];
	$dataset = $_POST['dataset'];
	$dataset = explode(';',$dataset);


	/*join datapairs*/
	$columns = array();
	$values = array();
	$key = 1;
	$result = mysqli_query($conn, "SELECT * FROM son_detail");
	while ($row = mysqli_fetch_array($result)) {

		/*clearup*/
		$value = '';

		/*check input type against relation*/
		if(mysqli_query($conn,"DESCRIBE `".$row['relation']."`")) {

			/*input stripping*/
			$data = preg_replace('/&nbsp;/','',strip_tags($dataset[$key]));

			/*get id of relation*/
			$relation = mysqli_query($conn, "SELECT * FROM ".$row['relation']." WHERE name='".utf8_decode($data)."'");
			while ($related = mysqli_fetch_array($relation)) {
				$value = $related['id'];
			}

			/*if relation not found*/
			if(empty($value) && $data!=''){

				/*create new filter*/
				$new = "INSERT INTO ".$row['relation']." (name) VALUES ('".utf8_decode($data)."')";
				mysqli_query($conn,$new);

				/*get id of new filter*/
				$value = mysqli_insert_id($conn);

			}

		}else{

			/*save raw value*/
			$data = preg_replace('/&nbsp;/','',strip_tags($dataset[$key],'<br>'));
			$value = $data;

		}

		/*push data if input was not empty*/
		if($value != ''){
			array_push($columns,$row['relation']);
			array_push($values,"'".$value."'");
		}else{
			/*else push null*/
			array_push($columns,$row['relation']);
			array_push($values,"null");
		}

		/*increment while looping*/
		$key++;

	}


	/*add project name*/
	array_push($columns,'name');
	array_push($values,"'".preg_replace('/&nbsp;/','',strip_tags($dataset[0]))."'");


	/*insert or update*/
	if($project == 0){

		/*encoding*/
		foreach ($values as $key=>$value) {
			$values[$key] = utf8_decode($value);
		}

		/*concat and insert*/
		$ins = "INSERT INTO son_project (".implode(',',$columns).") VALUES (".implode(',',$values).")";
		mysqli_query($conn,$ins);

		/*return new project id*/
		echo mysqli_insert_id($conn);

	}else{

		/*concat and update*/
		$bundle;
		foreach ($columns as $key=>$column) {
			$bundle .= $column;
			$bundle .= '=';
			$bundle .= utf8_decode($values[$key]);
			$bundle .= ',';
		}
		$bundle = trim($bundle,',');
		$upd = "UPDATE son_project SET ".$bundle." WHERE id=".$project;
		mysqli_query($conn,$upd);

		/*return current id*/
		echo $project;

	}


}


?>