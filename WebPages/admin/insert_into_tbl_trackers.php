<html>
<body>
<?php 

$tableName="tbl_trackers";
$col1="TrackerIMEI_ID";
$val1=$_POST["TrackerIMEI_ID"];
$col2="MSISDN_ID";
$val2=$_POST["MSISDN_ID"];
$col3="TrackerModel_ID";
$val3=$_POST["TrackerModel_ID"];
$col4="SerialNumber";
$val4=$_POST["SerialNumber"];
$col5="AddDate";
$val5=$_POST["AddDate"];
$col6="Status";
$val6=$_POST["Status"];
$col7="LastUpdate";
$val7=$_POST["LastUpdate"];
$col8="Condition";
$val8=$_POST["Condition"];
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


$sql = "INSERT INTO `".$tableName."` (
`".$col1."`,
`".$col2."`,
`".$col3."`,
`".$col4."`,
`".$col5."`,
`".$col6."`,
`".$col7."`,
`".$col8."`) VALUES (".'"'.$val1.'","'.$val2.'","'.$val3.'","'.$val4.'","'.$val5.'","'.$val6.'","'.$val7.'","'.$val8.'"'.");";
 if ($conn->query($sql) === TRUE) {
     echo "New record in ".$tableName." created successfully";
 } else {
     echo "Error: " . $sql . "<br>" . $conn->error;
 }

$tableNamelog="tbl_logs";
$col1="Log_ID";
$col2="UserTaxNumber_ID";
$col3="When";
$col4="What";
$val1="1";
$val2="2";
$val3=date('Y/m/d H:i:s');
$val4=$username." inserted in ".$tableName;

$sql = "INSERT INTO `".$tableNamelog."` (
`".$col1."`,
`".$col2."`,
`".$col3."`,
`".$col4."`) VALUES (".'"'.$val1.'","'.$val2.'","'.$val3.'","'.$val4.'"'.");";
 if ($conn->query($sql) === TRUE) {
     echo "New record in ".$tableName." created successfully";
 } else {
     echo "Error: " . $sql . "<br>" . $conn->error;
 }

 



$conn->close();
?>

<p><a href="index.php">Home</a></p>

<br>
 <button onclick="goBack()">Go Back</button>
<script>
function goBack() {
    window.history.back();
}
</script>
</body>
</html> 