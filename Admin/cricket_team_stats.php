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
			<p class="form-header">Teams Participating</p>	
			<form class="set-margin" name="cricket_team_stats_form" id="cricket_team_stats_form"  action="cricket_player_stats.php" method="GET">
			<p>TEAM 1</p> <br><br>
			<select  id="team1" name="team1">
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name'] ."</option>" ;
				}
				 ?>
			</select><br><br>

			<input class="form-control" type="text"  id="t1runs" name="t1runs" placeholder="Runs scored"><br><br>
			<input class="form-control" type="text"  id="t1wickets" name="t1wickets" placeholder="Wickets to fall"><br><br>
			<input class="form-control" type="text"  id="t1extra" name="t1extra" placeholder="Extras"><br><br>
			<input class="form-control" type="text"  id="t1overs" name="t1overs" placeholder="Overs"><br><br>
			<input class="form-control" type="text"  id="t14s" name="t14s" placeholder="Fours"><br><br>
			<input class="form-control" type="text"  id="t16s" name="t16s" placeholder="Sixes"><br><br>
			<br><br><br><br>
			<p>TEAM 2</p><br><br>
			<select  id="team2" name="team2">
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name'] ."</option>" ;
				}
				 ?>
			</select><br><br>
			
			<input class="form-control" type="text"  id="t2runs" name="t2runs" placeholder="Runs scored"><br><br>
			<input class="form-control" type="text"  id="t2wickets" name="t2wickets" placeholder="Wickets to fall"><br><br>
			<input class="form-control" type="text"  id="t2extra" name="t2extra" placeholder="Extras"><br><br>	
			<input class="form-control" type="text"  id="t2overs" name="t2overs" placeholder="Overs"><br><br>
			<input class="form-control" type="text"  id="t24s" name="t24s" placeholder="Fours"><br><br>
			<input class="form-control" type="text"  id="t26s" name="t26s" placeholder="Sixes"><br><br>

			<br><br>
			<input type="submit" name="cricket_team_stats_form_submit" value="Submit"/>
			</form>


			

			<br><br><br>

		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>
