<?php
	$servername = "localhost";
	$userconname = "root";
	$password = "secret";
	$dbname = "geo_tracking";
	// Opens a connection to a MySQL server
	$connection = mysqli_connect($servername, $userconname, $password);
	if (!$connection){
		die("Database Connection Failed" . mysqli_error($connection));
	}
	// Set the active MySQL database
	$select_db = mysqli_select_db($connection, $dbname);
	if (!$select_db){
		die("Database Selection Failed" . mysqli_error($connection));
	}
?>