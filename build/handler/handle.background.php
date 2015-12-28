<?

/*get random background*/
$images = array_diff(scandir('build/assets/background/'), array('..', '.'));
$back = rand(1,count($images));
$back_url = "build/assets/background/".$back.".jpg";

?>