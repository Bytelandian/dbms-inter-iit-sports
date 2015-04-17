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
<h2 align="center">Player Team</h2>
<form name="player_team" id="player_team" action=".">

<table align="center">

	<tr>
		<td><label for="disabledSelect">Player_id</label></td>
		<td><input class="form-control"  id="pid" name="pid" type="text" placeholder="Player_id"></td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Team ID</label></td>
		<td><input class="form-control" type="text"  id="team" name="team" placeholder="team id">
		</td>
	</tr>
	<tr><td></td>
	<td><input type="submit" id="form_submit" value="Submit"/></td>
	</tr>

</table>



</form>