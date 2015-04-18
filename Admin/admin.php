<?php
session_start();
	function getiitnames()
	{
		return execute_query("Select name from iit");

	}
	function getplayernames()
	{
		return execute_query("Select * from player");

	}
	function getplayernamesbyiit($iitname)
	{
		return execute_query("Select * from player where iit='$iitname'");

	}
	$tid=1;

	if (isset($_GET['tournament_details_form_submit']))
	{
//		echo $_GET['year'];
		$yr=$_GET['year'];
		$host=$_GET['host'];
		$foot=$_GET['footfall'];
		$st_date=$_GET['startdate'];
		$en_date=$_GET['enddate'];
		$chief=$_GET['chiefg'];
		//echo "INSERT INTO tournament(year, host,footfall, start_date,end_date,chief_guest) VALUES ($yr,'$host',$foot,'$st_date','$en_date','$chief')";
		return execute_query("INSERT INTO tournament(year, host,footfall, start_date,end_date,chief_guest) VALUES ($yr,'$host',$foot,'$st_date','$en_date','$chief')");

	}

	else if (isset($_GET['iit_participation_form_submit']))
	{
//		echo $_GET['year'];
		$yr=$_GET['year'];
		$nm=$_GET['name'];
		$conti=$_GET['contingent'];
		$scr=$_GET['score'];
		$sprto=$_GET['sporto'];
		$sprts=$_GET['sports'];
	//	echo "INSERT INTO iit_participation(year, name,contingent_size, score_total,sports_officer,sports_secretary) VALUES ($yr,'$nm',$conti,$scr,'$sprto','$sprts')";
		return execute_query("INSERT INTO iit_participation(year, name,contingent_size, score_total,sports_officer,sports_secretary) VALUES ($yr,'$nm',$conti,$scr,'$sprto','$sprts')");

	}
	else if (isset($_GET['player_form_submit']))
	{
//		echo $_GET['year'];
		$nm=$_GET['name'];
		$dobirth=$_GET['dob'];
		$gnd=$_GET['gender'];
		$mailid=$_GET['email'];
		$add=$_GET['address'];
		$iit_name=$_GET['iitname'];
		$phone1=$_GET['phone1'];
		$phone2=$_GET['phone2'];
		//echo "INSERT INTO player(name,date_of_birth,gender, email_id,address,iit) VALUES ('$nm','$dobirth','$gnd','$mailid','$add','$iit_name')";
		execute_query("INSERT INTO player(name,date_of_birth,gender, email_id,address,iit) VALUES ('$nm','$dobirth','$gnd','$mailid','$add','$iit_name')");
		$val = execute_query("SELECT id FROM player WHERE name='$nm' and date_of_birth='$dobirth' and gender='$gnd' and  email_id='$mailid' and address='$add' and iit='$iit_name'");
		$p_id=$val[0]['id'];
		//echo $p_id;
		execute_query("INSERT INTO `player_phone`(`id`, `phone_number`) VALUES ($p_id,'$phone1')");
		execute_query("INSERT INTO `player_phone`(`id`, `phone_number`) VALUES ($p_id,'$phone2')");
		
	}

	else if (isset($_GET['referee_form_submit']))
	{
//		echo $_GET['year'];
		$nm=$_GET['name'];
	//	echo "INSERT INTO referee(name) VALUES ('$nm')";
		return execute_query("INSERT INTO referee(name) VALUES ('$nm')");

	}

	else if (isset($_GET['team_form_submit']))
	{

//		echo $_GET['year'];
		if($_GET['teamsize']>0)
		$tsize=$_GET['teamsize'];
		else
			$tsize=0;
		$spsr=$_GET['sponsor'];
		$coach=$_GET['coach'];
		$jrsey=$_GET['jersey'];
		$iit=$_GET['iitname'];
//		echo "INSERT INTO team(team_size,sponsor,coach,jersey,name) VALUES ($tsize,'$spsr','$coach','$jrsey','$iit')";
		execute_query("INSERT INTO team(sponsor,team_size,coach,jersey,name) VALUES ('$spsr',$tsize,'$coach','$jrsey','$iit')");
//		echo "SELECT team_id FROM team WHERE team_size=$tsize and sponsor='$spsr' and coach='$coach' and jersey='$jrsey' and name='$iit'";
		$t=execute_query("SELECT team_id FROM team WHERE sponsor='$spsr' and coach='$coach' and jersey='$jrsey' and name='$iit'");
		global $tid;
		//echo "aaloo";
		$tid = $t[0]['team_id'];
		//echo $tid;
	}

	else if (isset($_GET['player_in_team_form_submit']))
	{
//		echo $_GET['year'];
		$nm=$_GET['name'];
	//	echo "INSERT INTO referee(name) VALUES ('$nm')";
		return execute_query("INSERT INTO referee(name) VALUES ('$nm')");

	}
	else if (isset($_GET['cricket_match_form_submit']))
	{
		$date=$_GET['date'];
		$temp=$_GET['winner'];
		$temp2 = $_SESSION['year'];
		$winner=execute_query("SELECT `team_id` FROM `team` WHERE `name`= '$temp' and `sport`='cricket' and `year`=$temp2")[0]['team_id'];

		$venue=$_GET['venue'];
		$motm=$_GET['motm'];

		$temp=$_GET['tosswon'];
		$temp2 = $_SESSION['year'];
		$tosswon=execute_query("SELECT `team_id` FROM `team` WHERE `name`= '$temp' and `sport`='cricket' and `year`=$temp2")[0]['team_id'];

		$temp=$_GET['batting'];
		$temp2 = $_SESSION['year'];
		$batting=execute_query("SELECT `team_id` FROM `team` WHERE `name`= '$temp' and `sport`='cricket' and `year`=$temp2")[0]['team_id'];

		if (isset($_GET['isfinal']))
			$isfinal=1;
		else
			$isfinal=0;
//		echo "INSERT INTO `cricket_match`( `date`, `winner`, `man_of_the_match`, `toss_won`, `venue`, `batting_first`, `isfinal`)VALUES ('$date',$winner,$motm,$tosswon,'$venue',$batting,$isfinal)";
		execute_query("INSERT INTO `cricket_match`( `date`, `winner`, `man_of_the_match`, `toss_won`, `venue`, `batting_first`, `isfinal`)VALUES ('$date',$winner,$motm,$tosswon,'$venue',$batting,$isfinal)");

//		echo "SELECT `match_id` FROM `cricket_match` WHERE `date`='$date', `winner` = $winner, `man_of_the_match`=$motm, `toss_won` = $tosswon, `venue` = '$venue', `batting_first`=$batting, `isfinal` = $isfinal";
		$_SESSION['match_id']=execute_query("SELECT `match_id` FROM `cricket_match` WHERE `date`='$date' and  `winner` = $winner and `man_of_the_match`=$motm and `toss_won` = $tosswon and `venue` = '$venue' and `batting_first`=$batting and `isfinal` = $isfinal")[0]['match_id'];

//		echo "IASD".$_SESSION['match_id'];

		
	}
	else if ($_GET['cricket_team_stats_form_submit'])
	{
		$temp=$_GET['team1'];
		$temp2 = $_SESSION['year'];
		$team1=execute_query("SELECT `team_id` FROM `team` WHERE `name`= '$temp' and `sport`='cricket' and `year`=$temp2")[0]['team_id'];

		$t1runs=$_GET['t1runs'];
		$t1wickets=$_GET['t1wickets'];
		$t1extra=$_GET['t1extra'];
		$t1overs=$_GET['t1overs'];
		$t1runs=$_GET['t1runs'];
		$t14s=$_GET['t14s'];
		$t16s=$_GET['t16s'];

		$match_id=$_SESSION['match_id'];

//		echo "INSERT INTO `cricket_team_stats`(`team_id`, `match_id`, `runs_scored`, `overs_played`, `4s`, `6s`, `wickets`, `extras`) VALUES ($team1,$match_id,$t1runs,$t1overs,$t14s,$t16s,$t1wickets,$t1extra)";
		execute_query("INSERT INTO `cricket_team_stats`(`team_id`, `match_id`, `runs_scored`, `overs_played`, `4s`, `6s`, `wickets`, `extras`) VALUES ($team1,$match_id,$t1runs,$t1overs,$t14s,$t16s,$t1wickets,$t1extra)");



		$temp=$_GET['team2'];
		$temp2 = $_SESSION['year'];
		$team2=execute_query("SELECT `team_id` FROM `team` WHERE `name`= '$temp' and `sport`='cricket' and `year`=$temp2")[0]['team_id'];
		
		$t2runs=$_GET['t2runs'];
		$t2wickets=$_GET['t2wickets'];
		$t2extra=$_GET['t2extra'];
		$t2overs=$_GET['t2overs'];
		$t2runs=$_GET['t2runs'];
		$t24s=$_GET['t24s'];
		$t26s=$_GET['t26s'];

		execute_query("INSERT INTO `cricket_team_stats`(`team_id`, `match_id`, `runs_scored`, `overs_played`, `4s`, `6s`, `wickets`, `extras`) VALUES ($team2,$match_id,$t2runs,$t2overs,$t24s,$t26s,$t2wickets,$t2extra)");


	}

	else if (isset($_GET['cricket_player_stats_team1_form_submit']))
	{
		$match_id=$_SESSION['match_id'];
		$playername=$_GET['playername'];
		//catches=&t1extra=&t1overs=&4s=&6s=&dots=&balls=&outs=&runs=&overs=&maidens=&extras=&wides=&noballs=&byes=&sixes=&legbyes=&wickets=
		$catches=$_GET['catches'];
		$t1extra=$_GET['t1extra'];
		$t1overs=$_GET['t1overs'];
		$sixs=$_GET['6s'];
		$fors=$_GET['4s'];
		$dots=$_GET['dots'];
		$balls=$_GET['balls'];
		$outs=$_GET['outs'];
		$runs=$_GET['runs'];
		$overs=$_GET['overs'];
		$maidens=$_GET['maidens'];
		$extras=$_GET['extras'];
		$wides=$_GET['wides'];
		$noballs=$_GET['noballs'];
		$sixes=$_GET['sixes'];
		$legbyes=$_GET['legbyes'];
		$wickets=$_GET['wickets'];

//		echo "INSERT INTO `cricket_player_stats`(`player_id`, `match_id`, `catches`, `stumps`, `runs_scored`, `4s`, `6s`, `dots`, `balls_faced`, `out_`, `runs`, `overs`, `maiden`, `extra_runs`, `wide`, `noballs`, `byes`, `legbyes`, `wickets`) VALUES ($playername,$match_id,$catches,$t1extra,$t1overs,$sixs,$fors,$dots,$balls,$outs,$runs,$overs,$maidens,$extras,$wides,$noballs,$sixes,$legbyes,$wickets)";
		execute_query("INSERT INTO `cricket_player_stats`(`player_id`, `match_id`, `catches`, `stumps`, `runs_scored`, `4s`, `6s`, `dots`, `balls_faced`, `out_`, `runs`, `overs`, `maiden`, `extra_runs`, `wide`, `noballs`, `byes`, `legbyes`, `wickets`) VALUES ($playername,$match_id,$catches,$t1extra,$t1overs,$sixs,$fors,$dots,$balls,$outs,$runs,$overs,$maidens,$extras,$wides,$noballs,$sixes,$legbyes,$wickets)");
	}

	else if (isset($_GET['cricket_player_stats_team2_form_submit']))
	{
		$match_id=$_SESSION['match_id'];
		$playername=$_GET['playername'];
		//catches=&t1extra=&t1overs=&4s=&6s=&dots=&balls=&outs=&runs=&overs=&maidens=&extras=&wides=&noballs=&byes=&sixes=&legbyes=&wickets=
		$catches=$_GET['catches'];
		$t1extra=$_GET['t1extra'];
		$t1overs=$_GET['t1overs'];
		$sixs=$_GET['6s'];
		$fors=$_GET['4s'];
		$dots=$_GET['dots'];
		$balls=$_GET['balls'];
		$outs=$_GET['outs'];
		$runs=$_GET['runs'];
		$overs=$_GET['overs'];
		$maidens=$_GET['maidens'];
		$extras=$_GET['extras'];
		$wides=$_GET['wides'];
		$noballs=$_GET['noballs'];
		$sixes=$_GET['sixes'];
		$legbyes=$_GET['legbyes'];
		$wickets=$_GET['wickets'];

//		echo "INSERT INTO `cricket_player_stats`(`player_id`, `match_id`, `catches`, `stumps`, `runs_scored`, `4s`, `6s`, `dots`, `balls_faced`, `out_`, `runs`, `overs`, `maiden`, `extra_runs`, `wide`, `noballs`, `byes`, `legbyes`, `wickets`) VALUES ($playername,$match_id,$catches,$t1extra,$t1overs,$sixs,$fors,$dots,$balls,$outs,$runs,$overs,$maidens,$extras,$wides,$noballs,$sixes,$legbyes,$wickets)";
		execute_query("INSERT INTO `cricket_player_stats`(`player_id`, `match_id`, `catches`, `stumps`, `runs_scored`, `4s`, `6s`, `dots`, `balls_faced`, `out_`, `runs`, `overs`, `maiden`, `extra_runs`, `wide`, `noballs`, `byes`, `legbyes`, `wickets`) VALUES ($playername,$match_id,$catches,$t1extra,$t1overs,$sixs,$fors,$dots,$balls,$outs,$runs,$overs,$maidens,$extras,$wides,$noballs,$sixes,$legbyes,$wickets)");
	}
	function execute_query($query)
	{
		include ('config.php');
		$con=mysqli_connect($host,$user,$password,$dbname) or die(mysqli_error($con));
		$result = mysqli_query($con,$query) or die ("Error  = ".mysqli_error($con));
		//$result;
		while ($row = mysqli_fetch_assoc($result)) {
			$output[]=$row;
		}
		mysqli_close($con);
		
		return $output;
	}


?>