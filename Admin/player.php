<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

?>

<h1 align="center">Admin Panel </h1> <h2 align="right">Welcome, admin</h2>

<br><br><br>
<h2 align="center">Player Details</h2>
<form name="player_details" id="player_details" action=".">

<table align="center">

	<tr>
		<td><label for="disabledSelect">Name</label></td>
		<td><input class="form-control"  id="name" name="name" type="text" placeholder="Name"></td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Date of Birth</label></td>
		<td><input class="form-control" type="date"  id="dob" name="dob" placeholder="dob">
		</td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Gender</label></td>

		<td><input class="form-control" type="radio" name="gender" id="gender" value="male"> Male
			<input class="form-control" type="radio" name="gender" id="gender" value="female"/>Female</td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Email</label></td>
		<td><input class="form-control" type="text"  id="email" name="email" placeholder="Email ID"></td>
	</tr>
	<tr>
		<td><label for="disabledSelect">Address</label></td>
		<td><input class="form-control" type="text"   id="address" name="address" placeholder="Address..."></td>
	</tr>

	<tr>
		<td><label for="disabledSelect">IIT name</label></td>
		<td>
			<select  id="host" name="iitname">
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

</table>


<input type="submit" id="form_submit" value="Submit"/>


</form>
