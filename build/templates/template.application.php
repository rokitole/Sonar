

<!--main column-->
<div class="column left">


	<h1 brand title="Ping anzeigen">Sonar<img src="build/assets/images/vec_logo_white.svg" /></h1>
	<ul>

		<li class="reset"><span>Alle Einträge</span></li>

		<?
		include 'build/handler/handle.connect.php';
		global $conn;
		$result = mysqli_query($conn,"SELECT * FROM son_menu ORDER BY id ASC");
		while($row = mysqli_fetch_array($result)){

			$name = $row['name'];
			$table = $row['table'];

			echo '<li><span>'.$name.'<i class="fa fa-caret-down"></i></span>';
			echo '<ul>';

			$subresult = mysqli_query($conn,"SELECT * FROM ".$table." ORDER BY name ASC");
			while($subrow = mysqli_fetch_array($subresult)){
				echo '
					<li
						class="filter"
						table="'.$table.'"
						ident="'.$subrow['id'].'"
					>'.utf8_encode($subrow['name']).'</li>
				';
			}

			echo '</li></ul>';

		}
		?>

	</ul>


	<!--logout-->
	<p class="logout" title="Abmelden">Logout</p>


</div>


<!--listing column-->
<div class="column middle">
	<ul>
	</ul>
</div>


<!--details column-->
<div class="column right">
	<section>
	</section>
</div>



<!--controls-->
<div class="controls">
	<button class="edit fa fa-pencil" title="Bearbeiten"></button>
	<button class="add fa fa-file-text-o" title="Hinzufügen"></button>
	<button class="save fa fa-floppy-o" title="Speichern"></button>
	<button class="cancel fa fa-ban" title="Abbrechen"></button>
	<button class="delete fa fa-trash-o" title="Entfernen"></button>
</div>


<!--notification-->
<button class="notify done fa fa-thumbs-o-up fa-flip-horizontal" title="Erledigt"></button>
<button class="notify progress fa fa-cog fa-spin" title="Lade..."></button>
<button class="notify duplicate fa fa-files-o" title="Doppelter Datensatz"></button>
<button class="notify warning fa fa-exclamation-triangle" title="Eingaben überprüfen"></button>
<button class="notify syntax fa fa-code" title="Falsche Eingabe"></button>

