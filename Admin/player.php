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

  <title>Add Tournament</title>

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
		<form class="set-margin" action="team.php" method="GET">
			<input type="submit" class="logout_button" value="Next Step: Add Teams->"/>  
		</form>
		<p class="form-header">Add Player</p>		
		<form name="player_form_submit" id="player_form_submit" action="player.php" method="GET">



			<input class="form-control"  id="name" name="name" type="text" placeholder="Name"><br><br>
		<input class="form-control" type="date"  id="dob" name="dob" placeholder="dob"><br><br>
		<input class="form-control" type="radio" name="gender" id="gender" value="male"> Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="form-control" type="radio" name="gender" id="gender" value="female"/>Female<br><br>
			<input class="form-control" type="text"  id="email" name="email" placeholder="Email ID"><br><br>
			<input class="form-control" type="text"   id="address" name="address" placeholder="Address..."><br><br>
			<input class="form-control" type="text"  name="phone1" placeholder="Phone Number 1..."><br><br>
			<input class="form-control" type="text"  name="phone2" placeholder="Phone Number 2..."><br><br>
			<select  id="host" name="iitname">
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name']." </option>" ;
				}
				?>
			</select><br><br>
<input type="submit" id="player_form_submit" name="player_form_submit" value="Submit"/>


			
		
		</form>

				<!--<input type="text" placeholder="username" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="button" value="Login">-->
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>
