<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

?>


<br><br><br>
<h2 align="center">Athletics Running Event</h2>
<form name="athletics_running_event" id="athletics_running_event">

<table align="center">

	<tr>
		<td><label for="disabledSelect">Match_id</label></td>
		<td><input class="form-control"  id="matchid" name="matchid"  type="text" placeholder="Match_id"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Qualifying Time</label></td>
		<td><input class="form-control"  id="time" name="time"  type="text" placeholder="Qualifying time"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Name</label></td>
		<td><select  id="name" name="name">
				<option value="temp"> temp </option>
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]."\"> ".$iitnames[$i]." </option>" ;
				}
				?>
			</select></td>
	</tr>

	<tr><td></td>
	<td><input type="submit" id="form_submit" value="Submit"/></td>
	</tr>

</table>

</form>
