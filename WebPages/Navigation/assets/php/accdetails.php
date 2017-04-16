<?php 
	require('connect.php');
	$query = "SELECT `tbl_userdetails`.`UserTaxnumber_ID`, `tbl_gender`.`Gender`, `tbl_userdetails`.`Name`, `tbl_userdetails`.`Surname`, `tbl_userdetails`.`Fathername`, `tbl_userdetails`.`Email`, `tbl_userdetails`.`IDnumber`, `tbl_userdetails`.`TelephoneA`, `tbl_userdetails`.`TelephoneB` FROM `tbl_userdetails` INNER JOIN `tbl_gender` ON `tbl_userdetails`.`Gender_ID` = `tbl_gender`.`Gender_ID` WHERE `tbl_userdetails`.`UserTaxnumber_ID`='$userIDx'";
	$result = mysqli_query($connection, $query) or die(mysqli_error($connection));
	$row = $result->fetch_assoc();
	$count = mysqli_num_rows($result);
	if ($count == 1){
		$user_taxnumber_ID=$row["UserTaxnumber_ID"];
		$user_gender=$row["Gender"];
		$user_name=$row["Name"];
		$user_surname=$row["Surname"];
		$user_fathername=$row["Fathername"];
		$user_email=$row["Email"];
		$user_idnumber=$row["IDnumber"];
		$user_telephonea=$row["TelephoneA"];
		$user_telephoneb=$row["TelephoneB"];
	}
	
	$query = "SELECT `tbl_useraddress`.`UserTaxnumber_ID`,`tbl_cities`.`City`,`tbl_streets`.`StreetName`,`tbl_useraddress`.`StreetNumber`,`tbl_useraddress`.`PostalCode` FROM `tbl_useraddress` INNER JOIN `tbl_cities` ON `tbl_useraddress`.`City_ID` = `tbl_cities`.`City_ID` INNER JOIN `tbl_streets` ON `tbl_useraddress`.`Street_ID` = `tbl_streets`.`Streets_ID` WHERE `tbl_useraddress`.`UserTaxnumber_ID` = '$userIDx'";
	$result = mysqli_query($connection, $query) or die(mysqli_error($connection));
	$row = $result->fetch_assoc();
	$count = mysqli_num_rows($result);
	if ($count == 1){
		$user_city=$row["City"];
		$user_streetname=$row["StreetName"];
		$user_streetnumber=$row["StreetNumber"];
		$user_postalcode=$row["PostalCode"];
	}
	
	$query = "SELECT `tbl_assignedtrackers`.`TrackerIMEI_ID`, `tbl_assignedtrackers`.`Nickname` FROM `tbl_assignedtrackers` WHERE `tbl_assignedtrackers`.`UserTaxNumber_ID`= '$userIDx'";
	$tracker_list_result = mysqli_query($connection, $query) or die(mysqli_error($connection));
	
?>