<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

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

  <title>Add Team</title>

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
		<form class="set-margin" action="cricket_match.php" method="GET">
			<input type="submit" class="logout_button" value="Next Step: Add Match Stats->"/>  
		</form>
		<p class="form-header">Add Team</p>		
		<form name="team_details" id="team_details" action="player_plays_in_team.php">



			<!--<label for="disabledSelect">Year</label>-->
			<input class="form-control" type="text"  id="teamsize" name="teamsize" placeholder="Team size"><br><br>
			<!--<label for="disabledSelect">Host</label>-->
			<input class="form-control" type="text" name="sponsor" id="sponsor" placeholder="sponsor"/> <br><br>

			<!--<label for="disabledSelect">Start Date</label>-->
			<input class="form-control" type="text"  id="coach" name="coach" placeholder="Coach"><br><br>

			<!--<label for="disabledSelect">End Date</label>-->
			<input class="form-control" type="text"   id="jersey" name="jersey" placeholder="Jersey"><br><br>

			<!--<label for="disabledSelect">Chief Guest</label>-->
			<select  id="iitname" name="iitname">
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name']." </option>" ;
				}
				?>
			</select><br><br>



			<input type="submit" name="team_form_submit" value="Submit"/>  


			
		
		</form>

				<!--<input type="text" placeholder="username" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="button" value="Login">-->
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>

