<?php
	include 'config.php';
	$con=mysqli_connect($IP,$user,$pass,$db);

	function getPlayers($input){
		$query = [];
		if(isset($input['iit'])){
			$query[]="select id from player_belongs_to_iit where name='".$input['iit']."'";
		}
		if(isset($input['year'])){
			$query[]="select id from player_plays_in_tournament where year=".$input['year'];
		}
		if(isset($input['sport'])){
			$query[]="select player_id from `".$input['sport']."`";
		}
		$c = count($query);
		if($c >= 1){
			$filter = "(".$query[0].")";
			for($x = 1; $x < $c ; ++$x){
				$filter=$filter." intersect (".$query[$x].")";
			}
		}

		$f = false;
		$where = "";
		if(isset($filter)){
			if(!$f){
				$where = $where." where id in (".$filter.")";
				$f = true;
			}else{
				$where = $where." and id in (".$filter.")";
			}
		}
		if(isset($input['gender'])){
			if(!$f){
				$where = $where." where gender = '".$input['gender']."'";
				$f = true;
			}else{
				$where = $where." and gender = '".$input['gender']."'";
			}	
		}
		if(isset($input['name'])){
			if(!$f){
				$where = $where." where lower(name) like '%".strtolower($input['name'])."%'";
				$f = true;
			}else{
				$where = $where." and lower(name) like '%".strtolower($input['name'])."%'";
			}
		}

		// echo $where;

		$finalQ = "select * from player ".$where.";";

		echo $finalQ;

	}


	$a['iit'] = 'IITR';
	$a['year'] = 2001;
	$a['gender'] = 'male';
	$a['name'] = 'GaU';

	getPlayers($a);
?>