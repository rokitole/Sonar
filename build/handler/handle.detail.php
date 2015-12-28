<?php


/*check session*/
session_start();
if ($_SESSION['login']) {


	/*get connection*/
	include 'handle.connect.php';
	global $conn;


	/*get id*/
	$projectid = $_POST['projectid'];


	/*case of blank*/
	$blank = false;
	if(empty($projectid)){
		$blank = true;
	}


	/*load project details*/
	$project = mysqli_query($conn, "SELECT * FROM son_project WHERE id=".$projectid);
	$project_items = mysqli_fetch_array($project);


	/*append favicon*/
	$url = utf8_encode($project_items['url']);
	include('handle.favicon.php');
	$view .= '<div class="favicon"><img src="'.$favi.'"/></div>';


	/*append headline*/
	$name = utf8_encode($project_items['name']);
	if($blank){
		$view .= '<h2 dataset default="Neuer Eintrag">Neuer Eintrag</h2>';
	}else{
		$view .= '<h2 dataset>'.$name.'</h2>';
	}


	/*build sections*/
	$sections = mysqli_query($conn, "SELECT * FROM son_section");
	while($section = mysqli_fetch_array($sections)){


		/*append section headline*/
		$sectionid = $section['id'];
		$view .= '<h4 section="'.$sectionid.'">'.$section['name'].'</h4>';


		/*build detail sets*/
		$details = mysqli_query($conn, "SELECT * FROM son_detail WHERE section=".$sectionid);
		while($detail = mysqli_fetch_array($details)) {


			/*get attributes*/
			$description = $detail['description'];
			$relation = $detail['relation'];


			/*get properties*/
			$value = utf8_encode($project_items[$relation]);


			/*translate relations*/
			if(strpos($relation,'son_') !== false){
				$relations = mysqli_query($conn, "SELECT * FROM ".$relation." WHERE id=".$value);
				$row = mysqli_fetch_array($relations);
				$value = utf8_encode($row['name']);
			}


			/*use empty slug*/
			unset($empty);
			if($value == ''){
				$empty = 'empty';
			}


			/*finally append detail item pairs*/
			$view .= '<span>'.$description.':</span>';
			$view .= '<span class="value '.$empty.'" dataset relation="'.$relation.'">'.$value.'</span>';


		}


	}


	/*return listing*/
	echo $view;


}


?>