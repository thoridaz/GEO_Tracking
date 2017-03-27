<?php 
	/*$DB_HOST = "localhost"; 
	$DB_NAME = "geo_tracking"; 
	$DB_USER = "root"; 
	$DB_PASSWORD = "secret"; 
	
	$con=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("Database connection failed: " . mysql_error()); 
	$db=mysql_select_db(DB_NAME,$con) or die("Database connection failed: " . mysql_error()); 
	*/
	include("config.php");
	$conn = new mysqli($servername, $username, $password, $dbname);
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	 
	/*define $ID = $_POST['user']; 
	define $Password = $_POST['pass']; 
	*/
	function SignIn() 
	{ 
		session_start(); //starting the session for user profile page 
		if(!empty($_POST['user'])) //checking the 'user' name which is from Sign-In.html, is it empty or have some text 
		{ 
			$sql = "SELECT * FROM tbl_users where (Username = '$_POST[user]') AND (Password = '$_POST[pass]')";
			$result = $conn->query($sql) or die(mysql_error());
			
			if(!empty($result["Username"]) AND !empty($result["Password"])) 
			{ 
				$_SESSION["Username"] = $result["Password"]; 
				echo "SUCCESSFULLY LOGIN TO USER PROFILE PAGE..."; 
			} 
			else 
			{ 
				echo "SORRY... YOU ENTERED WRONG ID OR PASSWORD... PLEASE RETRY..."; 
			} 
			/*$query = mysql_query("SELECT * FROM tbl_users where Username = '$ID' AND Password = '$Password'") or die(mysql_error()); 
			$row = mysql_fetch_array($query) or die(mysql_error()); 
			if(!empty($row['Username']) AND !empty($row['Password'])) 
			{ 
				$_SESSION['Username'] = $row['Password']; 
				echo "SUCCESSFULLY LOGIN TO USER PROFILE PAGE..."; 
			} 
			else 
			{ 
				echo "SORRY... YOU ENTERD WRONG ID AND PASSWORD... PLEASE RETRY..."; 
			} */
		} 
	} 
	if(isset($_POST['submit'])) 
	{ 
		SignIn(); 
	} 
?>