<?php 
	$userx = $_SESSION['user'];
	$userIDx = $_SESSION['userID'];
	if(empty($_SESSION['user'])){
		//doesn't allow to browse directly into page if not connected
		header("Location: ..\Startpage\index.html");	
		exit;
	}
	//else{
		//echo $_SESSION['user'];
		//echo $_SESSION['userID'];		
	//}	
?>