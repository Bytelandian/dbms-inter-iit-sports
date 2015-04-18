<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

session_start();
 if (!isset($_SESSION['admin_username'])){
 	header("Location: login.php");
 }


//$year = getyears();
//$yearcount = count($year);

?>



<!DOCTYPE html>
<html>
<br><br><br>
<h2 align="center">Tournament_Details</h2>

<head>

  <meta charset="UTF-8">

  <title>Referee</title>

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
		</form><br><br>
		<form class="set-margin" action="player.php" method="GET">
			<input type="submit" class="logout_button" value="Next Step: Add Players->"/>  
		</form>
		<p class="form-header">Referee</p>		
		<form class="set-margin" name="referee" id="referee" action="referee.php">

			
					<input class="form-control" type="text"  id="name" name="name" placeholder="Referee Name"><br><br>
					<input type="submit" name="referee_form_submit" value="Submit"/>
				

		</form>

				<!--<input type="text" placeholder="username" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="button" value="Login">-->
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>

