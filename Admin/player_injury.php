<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

//$year = getyears();
//$yearcount = count($year);

?>

<br><br><br>
<h2 align="center">Player Injury</h2>
<form name="player_injury" id="player_injury" action=".">

<table align="center">

	<tr>
		<td><label for="disabledSelect">Player_id</label></td>
		<td><input class="form-control"  id="pid" name="pid" type="text" placeholder="Player_id"></td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Injury</label></td>
		<td><input class="form-control" type="text"  id="injury" name="injury" placeholder="Phone">
		</td>
	</tr>

</table>


<input type="submit" id="form_submit" value="Submit"/>


</form>
