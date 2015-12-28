<?


/*setup*/
chdir('../../');
include 'handle.connect.php';
include 'handle.ping.php';
include 'handle.background.php';
global $conn;
$report;


/*get cronuser*/
$result = mysqli_query($conn,"SELECT * FROM son_config WHERE name='cronuser'");
$user = mysqli_fetch_array($result);
$user = explode(';',$user['config']);

/*get company name*/
$result = mysqli_query($conn,"SELECT * FROM son_config WHERE name='company'");
$company = mysqli_fetch_array($result);
$company = $company['config'];


/*get ping urls*/
$pingnames = array();
$pingurls = array();
$result = mysqli_query($conn,"SELECT name,url FROM son_ping");
while($urls = mysqli_fetch_array($result)) {
	array_push($pingnames, utf8_encode($urls['name']));
	array_push($pingurls, utf8_encode($urls['url']));
}


/*ping urls and report*/
foreach ($pingurls as $key=>$url) {
	if (ping('http://'.$url) == false) {
		$report .= '<p><a href="http://'.$pingurls[$key].'" target="_blank">'.$pingnames[$key].'<br><small>'.$pingurls[$key].'</small></a></p>';
	}
}


/*enhance report*/
if($report == ''){
	$report = '<img src="http://'.$_SERVER['SERVER_NAME'].'/build/assets/images/fa-thumbs-o-up.svg" title="Alles läuft."/>';
}else{
	$report = '<img src="http://'.$_SERVER['SERVER_NAME'].'/build/assets/images/fa-exclamation-triangle.svg" title="Es gibt Probleme!" />'.$report;
}


/*define styling*/
$body = "
<style>
@import url(https://fonts.googleapis.com/css?family=Inconsolata:400,700);
body{
margin: 0;
padding: 0;
border: 0;
background: black;
background-image: url('http://".$_SERVER['SERVER_NAME']."/".$back_url."');
background-size: cover;
background-position: top center;
}
*,
*:before,
*:after {
-moz-box-sizing: border-box;
-webkit-box-sizing: border-box;
box-sizing: border-box;
}
*{
text-align: center;
font-family: 'Inconsolata';
}
.box{
display: inline-block;
width: 100%;
max-width: 500px;
background: white;
margin: 10% 0;
padding: 2rem;
color: black;
}
h1{
font-size: 2.5rem;
font-family: 'Inconsolata';
font-weight: bold;
}
p,p a,small{
font-size: 1.3rem;
line-height: 1.35;
color: black;
text-decoration: none;
}
small,footer{
font-size: 1.0rem;
line-height: 1.2;
color: lightgrey;
}
a,a small{
line-height: 1.0;
color: lightgray;
}
p:hover a small,a small:hover{
text-decoration: underline;
color: black;
}
img{
position: relative;
display: block;
width: 100px;
margin: 3rem auto;
}
footer{
margin: 3.5rem 0 0 0;
}
</style>
";


/*set content*/
$body .= '
<div class="box">
<h1>Hallo '.$company.'!</h1>
<p>Sonar hat gerade alle überwachten Webseiten getestet.<br>Diese Prüfung vom '.date('j. M H:i').' ergab:</p>
'.$report.'
<footer>Diese Mails werden automatisch vom '.$company.' Sonar an dich versendet. Wenn du diese Mails nicht mehr bekommen möchtest, wende dich an deinen Admin.<br><a href="http://'.$_SERVER['SERVER_NAME'].'">'.$_SERVER['SERVER_NAME'].'</a> '.date('Y').'</footer>
</div>
';


/*send mails*/
foreach ($user as $key=>$receiver) {
	$header = "MIME-Version: 1.0\r\n";
	$header .= "Content-type: text/html; charset=utf-8\r\n";
	$header .= "From: ".$company." Sonar<".$receiver.">\r\n";
	$subject = "Sonar Report";
	mail($receiver, $subject, $body, $header);
}


?>