<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

//$year = getyears();
//$yearcount = count($year);

?>

<br><br><br>
<h2 align="center">Player Phone</h2>
<form name="player_phone" id="player_phone" action=".">

<table align="center">

	<tr>
		<td><label for="disabledSelect">Player_id</label></td>
		<td><input class="form-control"  id="pid" name="pid" type="text" placeholder="Player_id"></td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Phone Number</label></td>
		<td><input class="form-control" type="text"  id="phone" name="phone" placeholder="Phone">
		</td>
	</tr>

</table>


<input type="submit" id="form_submit" value="Submit"/>


</form>
