<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);
$playernames = getplayernames();
$playercount = count($playernames);
session_start();
 if (!isset($_SESSION['admin_username'])){
 	header("Location: login.php");
 }
 

?>


<!DOCTYPE html>
<html>
<br><br><br>
<h2 align="center">Tournament_Details</h2>

<head>

  <meta charset="UTF-8">

  <title>Add Player in team</title>

    <style>

</style>
	<link rel="stylesheet" type="text/css" href="css/forms.css">
    <script src="js/prefixfree.min.js"></script>

</head>

<body>

  <div class="body"></div>
		<div class="grad"></div>
		<!--<div class="header">
			<div>Site<span>Random</span></div>
		</div>-->
		<br>
		<div class="login">
		<form class="set-margin" action="logout.php" method="POST">
			<input type="submit" class="logout_button" value="Logout"/>  
		</form>
		<form class="set-margin" action="team.php" method="GET">
			<input type="submit" class="logout_button" value="Next Step: Add A New Team->"/>  
		</form>
		<p class="form-header">Add Player in team</p>		
		<form name="team_details" id="team_details" action="player_plays_in_team.php">


			<p>Player </p>
			<select  id="playerid" name="playerid">
				<?php
				for ($i=0; $i < $playercount ; $i++)
				{
					echo "<option value=\"".$playernames[$i]['id']."\"> ".$playernames[$i]['name'].", ".$playernames[$i]['iit']. ", DOB: ".$playernames[$i]['dob'] ." </option>" ;
				}
				 ?>
			</select><br><br>
			<!-- <input class="form-control"  id="pid" name="pid" type="text" placeholder="Player_id" hidden value=<?php echo $tid;?>><br><br> -->
			


			Team<br>
			<select  id="team" name="team">
				<!-- <option value="1">1</option> -->
				<?php
				for ($i=0; $i < $teamcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name']." </option>" ;
				}
				 ?>
			</select><br><br>
			<!-- <input class="form-control" type="text"  id="team" name="team" placeholder="team id"><br><br> -->

			<input type="submit" name="player_in_team_form_submit" value="Submit"/>  


			
		
		</form>

				<!--<input type="text" placeholder="username" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="button" value="Login">-->
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>

