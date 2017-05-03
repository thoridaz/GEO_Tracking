<?php
	if(!isset($_SESSION)){ 
		session_start();	//Start the Session 
	}
    $userIDx = $_SESSION['userID'];

	if (file_exists("../tmp/tmp_qry_".$userIDx.".xml")) {
		unlink("../tmp/tmp_qry_".$userIDx.".xml");
	}
	
	unset($_SESSION['user']);
	unset($_SESSION['userID']);
	session_unset();
	session_start();
	session_destroy();
	header("Location: ..\..\..\Startpage\index.html");	
	exit;
?>


