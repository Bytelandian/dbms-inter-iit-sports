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
		<p class="form-header">Cricket Match Details</p>
		<form class="set-margin" name="cricket_match_details" id="cricket_match_details" action="cricket_team_stats.php" method="GET">

			
			<input class="form-control" id="date" name="date" type="date" placeholder="Date"><br><br>

			
			<select  id="winner" name="winner">
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name'].", ".$iitnames[$i]['name']." </option>" ;
				}
				 ?>
			</select><br><br>
			<input class="form-control"  id="venue" name="venue" type="text" placeholder="Venue"><br><br>

			
			<select  id="motm" name="motm">
				<?php
				for ($i=0; $i < $playercount ; $i++)
				{
					echo "<option value=\"".$playernames[$i]['id']."\"> ".$playernames[$i]['name'].", ".$playernames[$i]['iit']. ", DOB: ".$playernames[$i]['dob'] ." </option>" ;
				}
				 ?>
			</select><br><br>

			
			<select  id="tosswon" name="tosswon">
				<option value="1">1</option>
				<?php
				for ($i=0; $i < $teamcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name'].", ".$iitnames[$i]['name']." </option>" ;
				}
				 ?>
			</select><br><br>


			
			<select  id="batting" name="batting">
				<option value="1">1</option>
				<?php
				for ($i=0; $i < $teamcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]['name']."\"> ".$iitnames[$i]['name'].", ".$iitnames[$i]['name']." </option>" ;
				}
				 ?>
			</select><br><br>

			<p>Is Final?
			<input class="form-control"  id="isfinal" name="isfinal" type="checkbox" placeholder="Is Final?"><br><br>
			</p>
			<br><br>
			<input type="submit" id="cricket_match_form_submit" value="Submit"/>
			</form>

				<!--<input type="text" placeholder="username" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="button" value="Login">-->
		<br><br><br><br><br><br>

		</div>
		<br><br><br>
  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>
