<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

//$playernames = getplayernames();
//$playercount = count($playernames);

?>

<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Cricket Match</title>

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
		<p class="form-header">Add Match</p>	
		<form class="set-margin" name="cricket_match_details" id="cricket_match_details">

			<input class="form-control" id="date" name="date" type="date" placeholder="Date"><br><br>

			<input class="form-control"  id="winner" name="winner" type="text" placeholder="Winner"><br><br>

			<select  id="motm" name="motm">
				<?php
				// for ($i=0; $i < $playercount ; $i++)
				// {
				// 	echo "<option value=\"".$playernames[$i]['name']."\"> ".$playernames[$i]['name'].", ".$playernames[$i]['name']." </option>" ;
				// }
				 ?>
			</select><br><br>

			<!--<label for="disabledSelect">End Date</label>-->
			<input class="form-control" type="date"  id="enddate" name="enddate" placeholder="Ending date"><br><br>

			<!--<label for="disabledSelect">Chief Guest</label>-->
			<input class="form-control" type="text"  id="cheifg" name="chiefg" placeholder="Chief Guest"><br><br>



			<input type="submit" id="tournament_details_form_submit" value="Submit"/>  



			</form>

				<!--<input type="text" placeholder="username" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="button" value="Login">-->
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>
