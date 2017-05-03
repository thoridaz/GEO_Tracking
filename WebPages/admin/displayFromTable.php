<html>
<body>



<?php 


$servername = "localhost";
$username = "root";
$password = "";
$dbname="geo_tracking";
$port="33067";

echo "Να μπουν οι σωστές ρυθμίσεις. Τώρα χρησιμοποιήθηκαν:";

echo "<br>servername=$servername";
echo "<br>username=$username";
echo "<br>password=$password";
echo "<br>port=$port<br><br>";



$conn = new mysqli($servername.':'.$port, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
else
 echo "Connected successfully<br>";

echo "<br>table: ".$_POST["tableName"]."<br>"; 

$sql = "SELECT * FROM ".$_POST["tableName"].";";
$result = $conn->query($sql);

if ($result->num_rows > 0)
 while($row = $result->fetch_array(MYSQLI_NUM)) {
    for ($x = 0; $x <$result->field_count; $x++) {
     printf ("%s ", $row[$x]);}
printf ("<br>");}
 else {
    echo "0 results";}

$conn->close();

if ($_POST["tableName"]=="tbl_streets"){ 
echo '<br><form action="insert_into_tbl_streets.php" method="post">';
echo 'New street name:';
echo '<input type="text" name="newValue"><br>';
echo '<input type="submit">';
echo '</form>';
}
else if ($_POST["tableName"]=="tbl_cities"){
echo '<br><form action="insert_into_tbl_cities.php" method="post">';
echo 'New City:';
echo '<input type="text" name="newValue"><br>';
echo '<input type="submit">';
echo '</form>';
}
else if ($_POST["tableName"]=="tbl_gender"){
 echo '<br><form action="insert_into_tbl_gender.php" method="post">';
 echo 'New Gender:';
 echo '<input type="text" name="newValue"><br>';
 echo '<input type="submit">';
 echo '</form>';
}
else if ($_POST["tableName"]=="tbl_trackermodels"){
 echo '<br><form action="insert_into_tbl_trackermodels.php" method="post">';
 echo 'New Model:';
 echo '<input type="text" name="newValue"><br>';
 echo '<input type="submit">';
 echo '</form>';
}
else if ($_POST["tableName"]=="tbl_msisdn"){
 echo '<br><form action="insert_into_tbl_msisdn.php" method="post">';
 echo 'MSISDN_ID:<input type="text" name="MSISDN_ID"><br>';
 echo 'PIN1:<input type="text" name="PIN1"><br>';
 echo 'PIN2:<input type="text" name="PIN2"><br>';
 echo 'PUK1:<input type="text" name="PUK1"><br>';
 echo 'PUK2:<input type="text" name="PUK2"><br>';
 echo '<input type="submit">';
 echo '</form>';
}
else if ($_POST["tableName"]=="tbl_trackers"){
 echo '<br><form action="insert_into_tbl_trackers.php" method="post">';
 echo 'TrackerIMEI_ID:<input type="text" name="TrackerIMEI_ID"><br>';
 echo 'MSISDN_ID:<input type="text" name="MSISDN_ID"><br>';
 echo 'TrackerModel_ID:<input type="text" name="TrackerModel_ID"><br>';
 echo 'SerialNumber:<input type="text" name="SerialNumber"><br>';
 echo 'AddDate:<input type="text" name="AddDate"><br>';
 echo 'Status:<input type="text" name="Status" value="0"><br>';
 echo 'LastUpdate:<input type="text" name="LastUpdate"><br>';
 echo 'Condition:<input type="text" name="Condition" value="1"><br>';
 echo '<input type="submit">';
 echo '</form>';
}



?>

<br>
 <button onclick="goBack()">Go Back</button>
<script>
function goBack() {
    window.history.back();
}
</script>
</body>
</html> 