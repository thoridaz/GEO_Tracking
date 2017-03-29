<?php  //Start the Session
	session_start();
	require('connect.php');
	
	// it will never let you open index(login) page if session is set
	if ( isset($_SESSION['user'])!="" ) {
		header("Location: ..\..\global-master\index.html");
		exit;
	}
	//3. If the form is submitted or not.
	//3.1 If the form is submitted
	if (isset($_POST['user']) and isset($_POST['pass'])){
		
		//3.1.1 Assigning posted values to variables, preventing sql injections 
		//and clearing user invalid inputs.
		$usertag = trim($_POST['user']);
		$usertag = strip_tags($usertag);
		$usertag = htmlspecialchars($usertag);
		
		$passkey = trim($_POST['pass']);
		$passkey = strip_tags($passkey);
		$passkey = htmlspecialchars($passkey);
		
		//Checking to see if loging in as user or admin
		//if (&_POST['onoffswitch']==checked){
			//user
			//$priv = 0
		//}else{
			//admin
			//$priv = 1
		//}
		
		$error = false;
		//Check resulting data for existance
		if(empty($usertag)){
			$error = true;
			$emailError = "Please enter your username.";
		}
  
		if(empty($passkey)){
			$error = true;
			$passError = "Please enter your password.";
		}
		
		// if there's no error, continue to login
		if ( !($error) ) {
			
			//$passkey = hash('sha256', $passkey); // password hashing using SHA256
		
			//3.1.2 Checking the values are existing in the database or not
			$query = "SELECT `UserTaxnumber_ID`, `Username`, `Password`, `Privilege`, `Status` FROM `tbl_users` WHERE Username='$usertag'";
			$result = mysqli_query($connection, $query) or die(mysqli_error($connection));
			$row = $result->fetch_assoc();
			
			//echo "tracker IMEI: " . $row["TrackerIMEI_ID"]. " - Longitude: " . $row["Longitude"]. " - Latitude: " . $row["Latitude"]. "<br>";
			
			// if uname/pass correct it returns must be 1 row
			$count = mysqli_num_rows($result);
			
			//echo "to count einai: " . $count . "<br>";
			//echo "to to username einai: " . $usertag . "<br>";
			
			//3.1.2 If the posted values are equal to the database values, then session will be created for the user.
			//echo "prin to teliko if me username : " . $row["Username"]. " - password: " . $row["Password"]. " - privilege: " . $row["Privilege"]. "<br>";
			if ($count == 1 && $row["Password"]==$passkey){
				$_SESSION['user'] = $Usertag;
				echo "mesa sto teliko if me username : " . $row["Username"]. " - password: " . $row["Password"]. " - privilege: " . $row["Privilege"]. "<br>";
				//edw ginetai to redirect
				//header("Location: home.php")p;
				header("Location: ..\..\global-master\index.html");
			}else{
				//3.1.3 If the login credentials doesn't match, he will be shown with an error message.
				//echo '$errMSG = "Invalid Login Details, Try again..."';
				//echo "lathos login: " . "<br>";
				//echo 'alert("Invalid Login Details, Try again...")';
				echo "<script type='text/javascript'>alert('failed!')</script>";
				header("Location: ..\index.html");				
			}
		}
	}
?>

