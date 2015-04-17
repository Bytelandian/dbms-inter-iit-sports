<?php
	function getiitnames()
	{
		return execute_query("Select name from iit");

	}
	if (isset($_GET['tournament_details_form_submit']))
	{
//		echo $_GET['year'];
		$yr=$_GET['year'];
		$host=$_GET['host'];
		$foot=$_GET['footfall'];
		$st_date=$_GET['startdate'];
		$en_date=$_GET['enddate'];
		$chief=$_GET['chiefg'];
		echo "INSERT INTO tournament(year, host,footfall, start_date,end_date,chief_guest) VALUES ($yr,'$host',$foot,'$st_date','$en_date','$chief')";
		return execute_query("INSERT INTO tournament(year, host,footfall, start_date,end_date,chief_guest) VALUES ($yr,'$host',$foot,'$st_date','$en_date','$chief')");

	}
	function execute_query($query)
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

?>