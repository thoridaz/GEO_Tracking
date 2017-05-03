<html>
<body>
<?php 

$tableName="tbl_msisdn";
$col1="MSISDN_ID";
$val1=$_POST["MSISDN_ID"];
$col2="PIN1";
$val2=$_POST["PIN1"];
$col3="PIN2";
$val3=$_POST["PIN2"];
$col4="PUK1";
$val4=$_POST["PUK1"];
$col5="PUK2";
$val5=$_POST["PUK2"];
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
`".$col5."`) VALUES (".'"'.$val1.'","'.$val2.'","'.$val3.'","'.$val4.'","'.$val5.'"'.");";
 if ($conn->query($sql) === TRUE) {
     echo "New record created successfully";
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