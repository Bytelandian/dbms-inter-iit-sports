<?php
session_start();
session_destroy();
echo"hii";
header("Location: login.php");


?>