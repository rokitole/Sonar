<?
include 'build/handler/handle.background.php';
?>

<!--print layout-->
<div class="login" style="background-image: url('<? echo $back_url ?>');">

	<div class="window">
		<h1>Sonar<img src="build/assets/images/vec_logo_black.svg" /></h1>
		<input autofocus type="password" placeholder="Anmelden" title="Kennwort" />
		<i unlock class="fa fa-unlock-alt fa-fw" title="Anmelden"></i>
		<span remember="no" title="Kennwort 24h speichern">für heute merken</span>
	</div>

</div>
';
