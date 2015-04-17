<?php
	function getPlayers($input){
		$query = [];
		if(isset($input['iit'])){
			$x = false;
			foreach ($input['iit'] as $value) {
				if(!$x){
					$x = true;
					$q ="select id from player_belongs_to_iit where name in ('".$value."'";
				}else{
					$q = $q.",'".$value."'";
				}
			}
			$query[]=$q.")";
		}
		if(isset($input['year_low']) && isset($input['year_high'])){
			$query[]="select id from player_plays_in_tournament where year>=".$input['year_low']." and year<=".$input['year_high'];
		}
		if(isset($input['sport'])){
			$x = false;
			foreach ($input['sport'] as $value) {
				if(!$x){
					$x = true;
					$q = "(select player_id from `".$value."_player_stats`)";
				}else{
					$q = $q." union (select player_id from `".$value."_player_stats`)";
				}
			}
			$query[]=$q;
		}

		$x = false;
		foreach ($query as $k) {
			if(!$x){
				$x = true;
				$filter = "(".$k.")";
			}else{
				$filter=$filter." intersect (".$k.")";
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
		
		$finalQ = "select * from player ".$where.";";

		echo $finalQ."<br>";

		$output = execute($finalQ);

		// foreach($output as $v){
		// 	var_dump($v['id']);
		// 	$v['phoneno'] = array('dfs');//findPhoneNumbers($v['id']);
		// 	echo "<br>";
		// }

		for($x = 0; $x < count($output) ; ++$x){
			var_dump($output[$x]);
			$output[$x]['phone'] = findPhoneNumbers($output[$x]['id']);
			echo "<br>";
		}
		echo "<br>";echo "<br>";
		for($x = 0; $x < count($output) ; ++$x){
			var_dump($output[$x]);
			// $output[$x]['phone'] = findPhoneNumbers($output[$x]['id']);
			echo "<br>";
		}
		// for($out)

	}

	function getMatches($input){
		$sport = $input['sport'];
		$query = [];
		if(isset($input['iit'])){
			$x = false;
			foreach ($input['iit'] as $value) {
				if(!$x){
					$x = true;
					$q ="select match_id from team natural join `".$sport."_team_stats` where name in ('".$value."'";
				}else{
					$q = $q.",'".$value."'";
				}
			}
			$query[]=$q.")";
		}
		if(isset($input['iit2'])){
			$x = false;
			foreach ($input['iit2'] as $value) {
				if(!$x){
					$x = true;
					$q ="select match_id from team natural join `".$sport."_team_stats` where name in ('".$value."'";
				}else{
					$q = $q.",'".$value."'";
				}
			}
			$query[]=$q.")";
		}
		if(isset($input['year_low']) && isset($input['year_high'])){
			$query[]="select match_id from `".$sport."_match` where year(date)>=".$input['year_low']." and year(date)<=".$input["year_high"];
		}

		$x = false;
		foreach ($query as $k) {
			if(!$x){
				$x = true;
				$filter = "(".$k.")";
			}else{
				$filter=$filter." intersect (".$k.")";
			}
		}

		$f = false;
		$where = "";
		if($sport == 'basketball'){
			if(isset($input['total_points_low'])){
				$q = "select match_id from `".$sport."_match` natural join `".$sport."_team_stats` where total_points_scored between ".$input['total_points_low']." and ".$input['total_points_high'];
				if(isset($filter)){
					$filter = $filter." intersect (".$q.")";
				}else{
					$filter = "(".$q.")";
				}
			}

		}else if($sport == 'cricket'){
			if(isset($input['runs_low']) || isset($input['4s_low']) || isset($input['6s_low'])){
				$c = false;
				$q = "select match_id from cricket_match natural join cricket_team_stats ";
				if(isset($input['runs_scored_low'])){
					$qt = "(runs_scored between ".$input['runs_low']." and ".$input['runs_high'].")";
					if(!$c){
						$c = true;
						$q = $q. " where ".$qt;
					}else{
						$q = $q. " and ".$qt;
					}
				}
				if(isset($input['4s_low'])){
					$qt = "(4s between ".$input['4s_low']." and ".$input['4s_high'].")";
					if(!$c){
						$c = true;
						$q = $q. " where ".$qt;
					}else{
						$q = $q. " and ".$qt;
					}
				}
				if(isset($input['6s_low'])){
					$qt = "(6s between ".$input['6s_low']." and ".$input['6s_high'].")";
					if(!$c){
						$c = true;
						$q = $q. " where ".$qt;
					}else{
						$q = $q. " and ".$qt;
					}
				}
				if(isset($input['wickets_low'])){
					$qt = "(wickets between ".$input['wickets_low']." and ".$input['wickets_high'].")";
					if(!$c){
						$c = true;
						$q = $q. " where ".$qt;
					}else{
						$q = $q. " and ".$qt;
					}
				}

				if(isset($filter)){
					$filter = $filter." intersect (".$q.")";
				}else{
					$filter = "(".$q.")";
				}
			}
		}else if($sport=='football' || $sport=='hockey'){
			if(isset($input['goals_low']) || isset($input['yellow_cards_low']) || isset($input['red_cards_low'])){
				$c = false;
				$q = "select match_id from ".$sport."_match natural join ".$sport."_team_stats ";
				if(isset($input['goals_low'])){
					$qt = "(goals between ".$input['goals_low']." and ".$input['goals_high'].")";
					if(!$c){
						$c = true;
						$q = $q. " where ".$qt;
					}else{
						$q = $q. " and ".$qt;
					}
				}
				if(isset($input['yellow_cards_low'])){
					$qt = "(yellow_cards between ".$input['yellow_cards_low']." and ".$input['yellow_cards_high'].")";
					if(!$c){
						$c = true;
						$q = $q. " where ".$qt;
					}else{
						$q = $q. " and ".$qt;
					}
				}
				if(isset($input['red_cards_low'])){
					$qt = "(red_cards between ".$input['red_cards_low']." and ".$input['red_cards_high'].")";
					if(!$c){
						$c = true;
						$q = $q. " where ".$qt;
					}else{
						$q = $q. " and ".$qt;
					}
				}

				if(isset($filter)){
					$filter = $filter." intersect (".$q.")";
				}else{
					$filter = "(".$q.")";
				}
			}
		}else if($sport == 'athletics'){
			if(isset($input['type'])){
				$finalQ = "select * from athletics_event_details natural join athletics_".$input['type']."_event ";
			}
		}
		if(!isset($finalQ)){
			$finalQ = "select * from `".$sport."_match` ";
		}
		if(isset($filter)){
			$finalQ = $finalQ." where match_id in (".$filter.")";
		}
		$finalQ = $finalQ." ;";
		echo $finalQ;

		return execute($finalQ);

	}

	function execute($query){
		include 'config.php';
		$con=mysqli_connect($IP,$user,$pass,$db);
		$result=mysqli_query($con,$query);

		$output = [];
		if($result==null || count($result)==0){
			return null;
		}
		
		while ($o=mysqli_fetch_assoc($result)){
			$output[] = $o;
		}
		mysqli_close($con);
		return $output;

	}

	function findPhoneNumbers($id){
		$query = "select phone_number from player_phone where id=".$id.";";

		$output = execute($query);

		return $output;
	}


	// $a['gender'] = 'Male';
	// // $a['year_low'] = 2001;
	// // $a['year_high'] = 2001;

	// // $a['sport'] = 'football';
	// // $a['goals_low'] = 50;
	

	// $a['name'] = "a";
	
	// echo json_encode(getPlayers($a));
?>