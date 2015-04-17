<?php
include 'admin.php';
$iitnames = getiitnames();
$iitcount = count($iitnames);

?>

<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>IIT participation</title>

    <style>

</style>
	<link rel="stylesheet" type="text/css" href="css/forms.css">
    <script src="js/prefixfree.min.js"></script>

    <script type="text/javascript">
		var form_submit = document.getElementById("player_form_submit");
		var hidden = document.getElementById("hidden");

var eventListener = function(el, type, listener) {
    if(el.addEventListener) {
        el.addEventListener(type, listener, false);
    } else if(el.attatchEvent) {
        el.attatchEvent("on"+type, listener);
    } else {
        el['on'+type] = listener;
    }
};

var onsubmit = function() {
    var newVal = "value to set for hidden input";

    hidden.value = newVal;
};

eventListener(submit, "submit", onsubmit);
	</script>

</head>

<body>

  <div class="body"></div>
		<div class="grad"></div>
		<!--<div class="header">
			<div>Site<span>Random</span></div>
		</div>-->
		<br>
		<div class="login">
		<p class="form-header">IIT participation Details</p>		
		


<form name="iit_participation_form_submit" id="iit_participation_form_submit">

	<!--<label for="disabledSelect">Year</label>-->
		<input class="form-control"  id="year" name="year" type="text" placeholder="year"><br><br>
	
	
		<!--<label for="disabledSelect">Name of IIT</label>-->
		
			<select  id="name" name="name">
				<option value="temp"> temp </option>
				<?php
				for ($i=0; $i < $iitcount ; $i++)
				{
					echo "<option value=\"".$iitnames[$i]."\"> ".$iitnames[$i]." </option>" ;
				}
				?>
			</select><br><br>
	
	
		<!--<label for="disabledSelect">Contingent size</label>-->
		<input class="form-control"  id="contingent" name="contingent" type="text" placeholder="contingent_size"><br><br>
	

		<!--<label for="disabledSelect">Score Total</label>-->
		<input class="form-control" type="text"  id="score" name="score" placeholder="Score total"><br><br>
	
	
		<!--<label for="disabledSelect">Sports Officer</label>-->
		<input class="form-control" type="text"  id="sporto" name="sporto" placeholder="Sports officer"><br><br>
	
		<!--<label for="disabledSelect">Sports Secretary</label>-->
		<input class="form-control"  id="sports" name="sports" type="text" placeholder="Sports Secretary"><br><br>


		<input type="hidden" name="hidden" id="hidden" />



<input type="submit" id="form_submit" value="Submit"/>
	


</form>
				<!--<input type="text" placeholder="username" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="button" value="Login">-->
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

</body>

</html>