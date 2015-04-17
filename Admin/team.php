<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

?>

<head>
	<link rel="stylesheet" type="text/css" href="css/forms.css">
</head>

<br><br><br>
<h2 align="center">Player Details</h2>
<form name="team_details" id="team_details" action=".">

<table align="center">

	<tr>
		<td><label for="disabledSelect">Team size</label></td>
		<td><input class="form-control" type="text"  id="teamsize" name="teamsize" placeholder="Team size">
		</td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Sponsor</label></td>

		<td><input class="form-control" type="text" name="sponsor" id="sponsor" placeholder="sponsor"/> 
		</td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Coach</label></td>
		<td><input class="form-control" type="text"  id="coach" name="coach" placeholder="Coach"></td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Jersey</label></td>
		<td><input class="form-control" type="text"   id="jersey" name="jersey" placeholder="Jersey"></td>
	</tr>

	<tr>
		<td><label for="disabledSelect">IIT name</label></td>
		<td>
			<select  id="iitname" name="iitname">
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name']." </option>" ;
				}
				?>
			</select>
		<td>
	</tr>
	<tr><td></td>
	<td><input type="submit" id="form_submit" value="Submit"/></td>
	</tr>
</table>




</form>
