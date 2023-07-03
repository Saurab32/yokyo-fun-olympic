<?php
	$connection = mysqli_connect("localhost","root","");
	if($connection)
	{
		$database = mysqli_select_db($connection,"newsportal");

	}
	
?>