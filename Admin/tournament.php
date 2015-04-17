<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

?>

<h1 align="center">Admin Panel </h1> <h2 align="right">Welcome, admin</h2>

<br><br><br>
<h2 align="center">Tournament_Details</h2>
<form name="tournament_details" id="tournament_details">

<table align="center">

	<tr>
		<td><label for="disabledSelect">Year</label></td>
		<td><input class="form-control" id="year" name="year" type="text" placeholder="year"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Host</label></td>
		<td>
			<select  id="host" name="host">
				<option value="temp"> temp </option>
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]."\"> ".$iitnames[$i]." </option>" ;
				}
				?>
			</select>


		<td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Footfall</label></td>
		<td><input class="form-control"  id="footfall" name="footfall" type="text" placeholder="Footfall"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Start Date</label></td>
		<td><input class="form-control"  id="startdate" name="startdate" type="date" placeholder="Starting date"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">End Date</label></td>
		<td><input class="form-control" type="date"  id="enddate" name="enddate" placeholder="Ending date"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Chief Guest</label></td>
		<td><input class="form-control" type="text"  id="cheifg" name="chiefg" placeholder="Chief Guest"><td>
	</tr>


</table>

</form>
