<?php

require("connect.php");

// Start XML file, create parent node

$dom = new DOMDocument("1.0");
$node = $dom->createElement("markers");
$parnode = $dom->appendChild($node);


// Select all the rows in the tbl_locations table
//$query = "SELECT * tbl_locations WHERE 1";
//$result = mysql_query($query);
$sql = "SELECT Location_ID, TrackerIMEI_ID, Longitude, Latitude, Speed, Altitude, Battery, EventTime FROM tbl_locations";
$result = $connection->query($sql);

if (!$result) {
  die('Invalid query: ' . mysql_error());
}

header("Content-type: text/xml");

if ($result->num_rows > 0) {
	// Iterate through the rows, adding XML nodes for each
    while($row = $result->fetch_assoc()) {
		// Add to XML document node
		$node = $dom->createElement("marker");
		$newnode = $parnode->appendChild($node);
		$newnode->setAttribute("Location_ID", $row['Location_ID']);
		$newnode->setAttribute("TrackerIMEI_ID", $row['TrackerIMEI_ID']);
		$newnode->setAttribute("Latitude", $row['Latitude']);
		$newnode->setAttribute("Longitude", $row['Longitude']);
		$newnode->setAttribute("EventTime", $row['EventTime']);
		$newnode->setAttribute("Speed", $row['Speed']);	
		$newnode->setAttribute("Altitude", $row['Altitude']);			
		$newnode->setAttribute("Battery", $row['Battery']);			
			
		
        //echo "tracker IMEI: " . $row["TrackerIMEI_ID"]. " - Longitude: " . $row["Longitude"]. " //- Latitude: " . $row["Latitude"]. "<br>";
    }
} else {
    echo "0 results";
}

echo $dom->saveXML();

?>