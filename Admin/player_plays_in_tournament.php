<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

//$year = getyears();
//$yearcount = count($year);

?>

<head>
	<link rel="stylesheet" type="text/css" href="css/forms.css">
</head>
<br><br><br>
<h2 align="center">Player plays in Tournament</h2>
<form name="player_plays_in_tournament" id="player_plays_in_tournament" action=".">

<table align="center">

	<tr>
		<td><label for="disabledSelect">Player_id</label></td>
		<td><input class="form-control"  id="pid" name="pid" type="text" placeholder="Player_id"></td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Tournament played</label></td>
		<td><input class="form-control" type="text"  id="tour" name="tour" placeholder="Tournament">
		</td>
	</tr>

	<tr><td></td>
	<td><input type="submit" id="form_submit" value="Submit"/></td>
	</tr>

</table>



</form>
