<?php 
	if(!isset($_SESSION)){ 
		session_start();	//Start the Session 
	} 
	require('connect.php');
	
	$usermail = trim($_POST['email']);
	$usermail = strip_tags($usermail);
	$usermail = htmlspecialchars($usermail);	
	
	$useridnum = trim($_POST['idnumber']);
	$useridnum = strip_tags($useridnum);
	$useridnum = htmlspecialchars($useridnum);
	
	$usertela = trim($_POST['telephonea']);
	$usertela = strip_tags($usertela);
	$usertela = htmlspecialchars($usertela);	
	
	$usertelb = trim($_POST['telephoneb']);
	$usertelb = strip_tags($usertelb);
	$usertelb = htmlspecialchars($usertelb);
	
	$usertaxid = $_SESSION['userID'];
	$usertag = $_SESSION['user'];

	$info= $usertag." edited his details with: ".$usermail.",".$useridnum.",".$usertela.",".$usertelb;
	$query = "INSERT INTO `tbl_logs` (`UserTaxNumber_ID`, `What`) VALUES ('".$usertaxid."','".$info."')";
	$result = mysqli_query($connection, $query) or die(mysqli_error($connection));
	
	$query = "UPDATE `tbl_userdetails` SET `Email`='".$usermail."', `IDnumber`='".$useridnum."', `TelephoneA`='".$usertela."', `TelephoneB`='".$usertelb."' WHERE `UserTaxNumber_ID`='".$usertaxid."'";
	$result = mysqli_query($connection, $query) or die(mysqli_error($connection));
	if ($result) {
		header("Location: ..\..\index.php");
	}
	
	
?>