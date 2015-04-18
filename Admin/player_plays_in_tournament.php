<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);
$playernames = getplayernames();
$playercount = count($playernames);
//$year = getyears();
//$yearcount = count($year);

?>

<head>
	<link rel="stylesheet" type="text/css" href="css/forms.css">
</head>
<br><br><br>
<h2 align="center">Player plays in Tournament</h2>
<form name="player_plays_in_tournament" id="player_plays_in_tournament" action=".">


<p>Player </p>
			<select  id="playerid" name="playerid">
				<?php
				for ($i=0; $i < $playercount ; $i++)
				{
					echo "<option value=\"".$playernames[$i]['id']."\"> ".$playernames[$i]['name'].", ".$playernames[$i]['iit']. ", DOB: ".$playernames[$i]['dob'] ." </option>" ;
				}
				 ?>
			</select><br><br>
		<input class="form-control" type="text"  id="tour" name="tour" placeholder="Tournament">
		<input type="submit" id="form_submit" value="Submit"/></td>
</form>
