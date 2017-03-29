<?php
	$servername = "localhost";
	$userconname = "root";
	$password = "secret";
	$dbname = "geo_tracking";
	$connection = mysqli_connect($servername, $userconname, $password);
	if (!$connection){
		die("Database Connection Failed" . mysqli_error($connection));
	}
	$select_db = mysqli_select_db($connection, $dbname);
	if (!$select_db){
		die("Database Selection Failed" . mysqli_error($connection));
	}
?>