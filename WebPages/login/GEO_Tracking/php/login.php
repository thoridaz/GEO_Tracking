<?php  //Start the Session
	session_start();
	require('connect.php');
	//3. If the form is submitted or not.
	//3.1 If the form is submitted
	if (isset($_POST['user']) and isset($_POST['pass'])){
		//3.1.1 Assigning posted values to variables.
		$username = $_POST['user'];
		$password = $_POST['pass'];
		//3.1.2 Checking the values are existing in the database or not
		$query = "SELECT * FROM `tbl_users` WHERE (Username='$username') AND (Password='$password')";
 
		$result = mysqli_query($connection, $query) or die(mysqli_error($connection));
		$count = mysqli_num_rows($result);
		//3.1.2 If the posted values are equal to the database values, then session will be created for the user.
		if ($count == 1){
			$_SESSION['username'] = $username;
		}else{
			//3.1.3 If the login credentials doesn't match, he will be shown with an error message.
			$fmsg = "Invalid Login Credentials.";
		}
	}
	//3.1.4 if the user is logged in Greets the user with message
	if (isset($_SESSION['username'])){
		$username = $_SESSION['username'];
		echo "Hi " . $username . "";
		echo "This is the Members Area";
		echo "<a href='logout.php'>Logout</a>";
	}else{}
	//3.2 When the user visits the page first time, simple login form will be displayed.
?>