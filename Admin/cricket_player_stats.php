<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

$playernames = getplayernames();
$playercount = count($playernames);
?>

<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Cricket Match</title>
	<link rel="stylesheet" type="text/css" href="css/forms.css">
    <script src="js/prefixfree.min.js"></script>

</head>

<body>

  <div class="body"></div>
		<div class="grad"></div>
		<br>
		<div class="login">
			<p class="form-header">Individual player stats</p>	
			<form class="set-margin" name="cricket_player_stats_form" id="cricket_player_stats_form">

				<select  id="playername" name="playername">
				<?php
				for ($i=0; $i < $playercount ; $i++)
				{
					echo "<option value=\"".$playernames[$i]['id']."\"> ".$playernames[$i]['name'].", ".$playernames[$i]['iit']. ", DOB: ".$playernames[$i]['dob'] ." </option>" ;
				}
				 ?>
			</select><br><br>
			<!-- <input class="form-control" type="text"  id="playername" name="playername" placeholder=""><br><br> -->
			<input class="form-control" type="text"  id="catches" name="catches" placeholder="Catches"><br><br>
			<input class="form-control" type="text"  id="t1extra" name="t1extra" placeholder="Stumps"><br><br>
			<input class="form-control" type="text"  id="t1overs" name="t1overs" placeholder="Runs Scored"><br><br>
			<input class="form-control" type="text"  id="4s" name="4s" placeholder="Fours"><br><br>
			<input class="form-control" type="text"  id="6s" name="6s" placeholder="Sixes"><br><br>
			<input class="form-control" type="text"  id="dots" name="dots" placeholder="Dots"><br><br>
			<input class="form-control" type="text"  id="balls" name="balls" placeholder="Balls Faced"><br><br>
			<input class="form-control" type="text"  id="outs" name="outs" placeholder="Outs"><br><br>
			<input class="form-control" type="text"  id="runs" name="runs" placeholder="Runs"><br><br>
			<input class="form-control" type="text"  id="overs" name="overs" placeholder="Overs"><br><br>
			<input class="form-control" type="text"  id="maidens" name="maidens" placeholder="Maidens"><br><br>
			<input class="form-control" type="text"  id="extras" name="extras" placeholder="Extras"><br><br>
			<input class="form-control" type="text"  id="wides" name="wides" placeholder="Wides"><br><br>
			<input class="form-control" type="text"  id="noballs" name="noballs" placeholder="No Balls"><br><br>
			<input class="form-control" type="text"  id="byes" name="byes" placeholder="Byes"><br><br>
			<input class="form-control" type="text"  id="sixes" name="sixes" placeholder="Sixes"><br><br>
			<input class="form-control" type="text"  id="legbyes" name="legbyes" placeholder="Leg Byes"><br><br>
			<input class="form-control" type="text"  id="wickets" name="wickets" placeholder="Wickets taken"><br><br>

			<br><br>

			<input type="submit" name="cricket_player_stats_team1_form_submit" value="Team 1 player"/>
			<input type="submit" name="cricket_player_stats_team2_form_submit" value="Team 2 player"/>
			</form>

			<br><br><br><br><br><br>
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>
