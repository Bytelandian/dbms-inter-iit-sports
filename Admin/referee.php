<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

//$year = getyears();
//$yearcount = count($year);

?>

<br><br><br>
<h2 align="center">Referee</h2>
<form name="referee" id="referee" action=".">

<table align="center">
	<tr>
		<td><label for="disabledSelect">Referee_id</label></td>
		<td><input class="form-control"  id="pid" name="pid" type="text" placeholder="Player_id"></td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Referee Name</label></td>
		<td><input class="form-control" type="text"  id="name" name="name" placeholder="Referee Name">
		</td>
	</tr>

	<tr><td></td>
	<td><input type="submit" id="form_submit" value="Submit"/></td>
	</tr>
	
</table>

</form>
