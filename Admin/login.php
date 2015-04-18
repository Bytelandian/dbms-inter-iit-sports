<!DOCTYPE html>
<?php
session_start();
 if (isset($_SESSION['admin_username'])){
 	header("Location: tournament.php");
 }
 ?>
<html>

<head>

  <meta charset="UTF-8">

  <title>Login</title>

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
		<p class="form-header">Admin Login</p>		
		<form class="set-margin" name="tournament_details" id="tournament_details" action="check_login.php" method="POST">


		<?php if (isset($_SESSION['login_error'])){ ?>
			<h1><?php echo $_SESSION['login_error']; } ?></h1>
			<!--<label for="disabledSelect">Year</label>-->
			<input class="form-control" id="username" name="username" type="text" placeholder="Username"><br><br>
			<!--<label for="disabledSelect">Host</label>-->
			

			
			
			<input class="form-control" type="password"  id="pass" name="pass" placeholder="Password"><br><br>



			<input type="submit" id="tournament_details_form_submit" value="Submit"/>  



			</form>

				<!--<input type="text" placeholder="username" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="button" value="Login">-->
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>
