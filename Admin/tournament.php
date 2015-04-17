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
		</form>
		<p class="form-header">Add Tournament</p>		
		<form class="set-margin" name="tournament_details" id="tournament_details" action="iit_participation.php" onsubmit="FormSubmit()" method="GET">



			<!--<label for="disabledSelect">Year</label>-->
			<input class="form-control" id="year" name="year" type="text" placeholder="year"><br><br>
			<!--<label for="disabledSelect">Host</label>-->
			<select  id="host" name="host">
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name']." </option>" ;
				}
				?>
			</select><br><br>


			<!--<label for="disabledSelect">Footfall</label>-->
			<input class="form-control"  id="footfall" name="footfall" type="text" placeholder="Footfall"><br><br>

			<!--<label for="disabledSelect">Start Date</label>-->
			<input class="form-control"  id="startdate" name="startdate" type="date" placeholder="Starting date"><br><br>

			<!--<label for="disabledSelect">End Date</label>-->
			<input class="form-control" type="date"  id="enddate" name="enddate" placeholder="Ending date"><br><br>

			<!--<label for="disabledSelect">Chief Guest</label>-->
			<input class="form-control" type="text"  id="cheifg" name="chiefg" placeholder="Chief Guest"><br><br>



			<input type="submit" name="tournament_details_form_submit" value="Submit"/>  


			
		
		</form>

				<!--<input type="text" placeholder="username" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="button" value="Login">-->
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>
