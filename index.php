<?php


/*set head*/
include('build/templates/template.head.php');


/*check session*/
session_start();
if ($_SESSION['login']){

	/*if logged in show grid*/
	include('build/templates/template.application.php');

}else{

	/*if logged out show login*/
	include('build/templates/template.login.php');

}


/*set foot*/
include('build/templates/template.foot.php');


?>