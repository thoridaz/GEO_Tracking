<?php
	if(!isset($_SESSION)){ 
		session_start();	//Start the Session if not started already.
	} 
	require('connect.php');
	$query = "SELECT `tbl_assignedtrackers`.`TrackerIMEI_ID`, `tbl_assignedtrackers`.`Nickname` FROM `tbl_assignedtrackers` WHERE `tbl_assignedtrackers`.`UserTaxNumber_ID`= '$userIDx'";
	$tracker_list_result = mysqli_query($connection, $query) or die(mysqli_error($connection));
	//$count = mysqli_num_rows($result);
?>
