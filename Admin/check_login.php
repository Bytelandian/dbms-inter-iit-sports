<?php

session_start();

include('config.php');

$connect = mysqli_connect($host,$user,$password,$dbname);
$username = $_REQUEST['username'];
$pass = $_REQUEST['pass'];
$query = "SELECT username,pass FROM admin WHERE username='" . $username . "' AND pass='" . $pass . "';";
echo $query;
	$result = mysqli_query($connect,$query);
	echo mysqli_num_rows($result);
	if (mysqli_num_rows($result)==1)
	{
		$result = mysqli_fetch_array($result);
		$_SESSION["admin_username"]=$username;
		//echo $_SESSION["admin_username"];
		header("Location: tournament.php");
		exit();

	}
	else{
		$_SESSION["login_error"]="Wrong Username or Password!";
		//echo $_SESSION["login_error"];
		header("Location: login.php");
		exit();

	}	





?>