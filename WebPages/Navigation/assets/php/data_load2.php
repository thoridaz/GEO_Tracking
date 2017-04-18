<?php
	if(!isset($_SESSION)){ 
		session_start();	//Start the Session 
	}
	require("connect.php");

	// Start XML file, create parent node

	$dom = new DOMDocument("1.0");
	$node = $dom->createElement("markers");
	$parnode = $dom->appendChild($node);

	// Transfer with POST the user's selections and build the select query that returns the all the related rows found in the tbl_locations table
	$ii=0;
	$tfrom = $_POST['start_date'];
	$tuntil = $_POST['end_date'];
	$sql ="SELECT `tbl_locations`.`Location_ID`, `tbl_locations`.`TrackerIMEI_ID`, `tbl_locations`.`Longitude`, `tbl_locations`.`Latitude`, `tbl_locations`.`Speed`, `tbl_locations`.`Altitude`, `tbl_locations`.`Battery`, `tbl_locations`.`EventTime` FROM `tbl_locations` WHERE (";
	foreach($_POST['dynamic_data'] as $tracker) {
		if ($ii == 0){
			$sql += "(`tbl_locations`.`TrackerIMEI_ID` = '".$tracker."')";
		} elseif ($ii > 0) {
			$sql += " or (`tbl_locations`.`TrackerIMEI_ID` = '".$tracker."')";
		}
		$ii++;
	}
	$sql += ") AND (`tbl_locations`.`EventTime` BETWEEN '".$tfrom."' AND '".$tuntil."')";
	
	//$sql = "SELECT Location_ID, TrackerIMEI_ID, Longitude, Latitude, Speed, Altitude, Battery, EventTime FROM tbl_locations";
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