<?php
	unset($_SESSION['user']);
	unset($_SESSION['userID']);
	session_unset();
	session_start();
	session_destroy();
	header("Location: ..\..\..\Startpage\index.html");	
	exit;
?>


