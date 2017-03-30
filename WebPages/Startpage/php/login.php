<?php  
	if(!isset($_SESSION)){ session_start(); }	//Start the Session
	require('connect.php');
	
	//It will never let you open index(login) page if session is set
	if ( isset($_SESSION['user'])!="" ) {
		header("Location: ..\..\global-master\index.html");
		exit;
	}
	//If the form is submitted or not.
	//If the form is submitted
	if (isset($_POST['user']) and isset($_POST['pass'])){
		
		//Assigning posted values to variables, preventing sql injections 
		//and clearing user invalid inputs.
		$usertag = trim($_POST['user']);
		$usertag = strip_tags($usertag);
		$usertag = htmlspecialchars($usertag);
		
		$passkey = trim($_POST['pass']);
		$passkey = strip_tags($passkey);
		$passkey = htmlspecialchars($passkey);
		
		//Checking to see if trying to log in as user or admin
		$priv = -1;
		try {
			if ($_POST['onoffswitch'] == "on"){
				//user
				$priv = 1;
			}else{
				//admin
				$priv = 0;
			}
		} catch (Exception $e) {}
		
		$error = false;
		//Check resulting data for existance
		if(empty($usertag)){
			$error = true;
			$yser = "Please enter your username.";
		}
  
		if(empty($passkey)){
			$error = true;
			$passError = "Please enter your password.";
		}
		
		//If there's no error, continue to login
		if ( !($error) ) {
			
			//$passkey = hash('sha256', $passkey); // password hashing using SHA256
			
			//1-user/0-admin
			if ($priv == 1){
				$query = "SELECT `UserTaxnumber_ID`, `Username`, `Password`, `Privilege`, `Status` FROM `tbl_users` WHERE (`Username`='$usertag') AND (`Privilege`='$priv') AND (`Status`=1)";
			} elseif ($priv == 0){
				$query = "SELECT `UserTaxnumber_ID`, `Username`, `Password`, `Privilege`, `Status` FROM `tbl_users` WHERE (`Username`='$usertag') AND (`Privilege`='$priv') AND (`Status`=1)";
			}
			//Checking the values are existing in the database or not
			$result = mysqli_query($connection, $query) or die(mysqli_error($connection));
			$row = $result->fetch_assoc();
			//If credentials are correct returning data must be 1 row
			$count = mysqli_num_rows($result);
			//If the posted password is equal to the database password, then session will be created for the user.
			if ($count == 1 && $row["Password"]==$passkey){
				$_SESSION['user'] = $Usertag;
				$_SESSION['userID'] = $row["UserTaxnumber_ID"];	
				//Checking logged in account privilege before redirecting to corresponding page
				if ($row["Privilege"] == 1){
					header("Location: ..\..\Navigation\index.html");
				}elseif ($row["Privilege"] == 0){
					//EDW PREPEI NA MPEI H ADMIN PAGE
					header("Location: ADMIN PAGE");
				}
			}else{
				echo "<script type='text/javascript'>alert('Invalid Login Details, Try again...');
				window.location.href = '../index.html';</script>";
			}
		}
	}
	//echo "tracker IMEI: " . $row["TrackerIMEI_ID"]. " - Longitude: " . $row["Longitude"]. " - Latitude: " . $row["Latitude"]. "<br>";
	//echo "mesa sto teliko if me username : " . $row["Username"]. " - password: " . //$row["Password"]. " - privilege: " . $row["Privilege"]. "<br>";
	//edw ginetai to redirect
	//header("Location: home.php")p;
	//echo "to count einai: " . $count . "<br>";
	//echo "to to username einai: " . $usertag . "<br>";
	//echo "to switch einai off33" . "<br>";
	//echo "to switch einai on29" . "<br>";
?>
