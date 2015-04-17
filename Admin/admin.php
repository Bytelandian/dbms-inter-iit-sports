<?php
	function getiitnames()
	{
//		return execute_query("Select name from iit");
		return ["blah","hello",":P"] ;	

	}
/*	function execute_query($query)
	{
		include('config.php');
		$con=mysqli_connect($host,$user,$password,$dbname) or die(mysqli_error($con));
		$result = mysqli_query($con,$query) or die ("Error  = ".mysqli_error($con));
		while ($row = mysqli_fetch_assoc($result)) {
			$output[]=$row;
		}
		mysqli_close($con);
		
		return $output;
	}
*/

?>