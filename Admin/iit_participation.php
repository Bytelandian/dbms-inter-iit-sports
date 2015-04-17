<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

?>

<h1 align="center">Admin Panel </h1> <h2 align="right">Welcome, admin</h2>

<br><br><br>
<h2 align="center">IIT participation Details</h2>
<form name="iit_participation_details" id="iit_participation_details">

<table align="center">

	<tr>
		<td><label for="disabledSelect">Year</label></td>
		<td><input class="form-control"  id="year" name="year" type="text" placeholder="year"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Name of IIT</label></td>
		<td>
			<select  id="name" name="name">
				
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name']." </option>" ;
				}
				?>
			</select>
		<td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Contingent size</label></td>
		<td><input class="form-control"  id="contingent" name="contingent" type="text" placeholder="contingent_size"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Score Total</label></td>
		<td><input class="form-control" type="text"  id="score" name="score" placeholder="Score total"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Sports Officer</label></td>
		<td><input class="form-control" type="text"  id="sporto" name="sporto" placeholder="Sports officer"><td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Sports Secretary</label></td>
		<td><input class="form-control"  id="sports" name="sports" type="text" placeholder="Sports Secretary"><td>
	</tr>

	<tr><td></td>
	<td><input type="submit" id="iit_participation_form_submit" name ="iit_participation_form_submit" value="Submit"/></td>
	</tr>

</table>


</form>
