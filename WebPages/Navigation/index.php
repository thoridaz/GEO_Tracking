<?php 
	if(!isset($_SESSION)){ 
		session_start();	//Start the Session 
	} 
	require('assets/php/session.php');
	require('assets/php/accdetails.php');
	//require('assets/php/load_trackers.php');
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Global-Using MySQL and PHP with Google Maps</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<meta http-equiv="content-type" content="IE=edge">
		<meta name="description" content="text/html; charset=UTF-8">
		<meta name="keywords" content="global, template, html, sass, jquery">
		<meta name="author" content="Gewpap">
		<link rel="stylesheet" href="assets/css/main.css">
		<style>
			/* Always set the map height explicitly to define the size of the div
			* element that contains the map. */
			#map {
				height: 100%;
			}
			/* Optional: Makes the sample page fill the window. */
			html, body {
				height: 100%;
				margin: 0;
				padding: 0;
			}
		</style>
	</head>

	<body>
		

		
		
		
		
		<!-- notification for small viewports and landscape oriented smartphones -->
		<!-- <div class="device-notification">
			<a class="device-notification--logo" href="#0">
				<img src="assets/img/logo.png" alt="Global">
				<p>Global</p>
			</a>
			<p class="device-notification--message">Global has so much to offer that we must request you orient your device to portrait or find a larger screen. You won't be disappointed.</p>
		</div>-->

		<div class="perspective effect-rotate-left">
			<div class="container"><div class="outer-nav--return"></div>
				<div id="viewport" class="l-viewport">
					<div class="l-wrapper">
						<header class="header">
							<p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p>
							<a class="header--logo" href="#0">
								<a href="assets/php/logout.php" title="Disconnect">Sign Out</a>
								<p></p><p></p>
								<img src="assets/img/logo.png" alt="5G">
							</a>
							<button class="header--cta cta">Contact Us</button>
							<div class="header--nav-toggle">
								<span></span>
							</div>
						</header>
				
						<ul class="l-main-content main-content">
							<li class="l-section section section--is-active">

							
									<div id="map"></div>
								

							</li>
							<li class="l-section section">
								<div class="trackersearch">
									<h2>Select Search Parameters</h2>
									<div class="work--lockup">
										

										
										<select name="dynamic_data">
										<?php
										$i=0;
										while($row = $tracker_list_result->fetch_assoc()) {
										?>
										<option value="<?=$row["Nickname"];?>"><?=$row["Nickname"]." - ".$row["TrackerIMEI_ID"];?></option>
										<?php
										$i++;
										}
										?>
										</select>

				
			
									</div>
								</div>
							</li>
							<li class="l-section section">
								<div class="profile">
									<h2>View Profile</h2>
									<div class="work--lockup">
										
										<form class="form-signin" method="POST" action="assets/php/editdetails.php">
											<div class="work-request--information">
												<div class="information-name">
													<!--<input id="name" type="text" spellcheck="false">-->
													<label for="name">Gender: <?php echo $user_gender;?>
													</label>
												</div>
												<div class="information-name">
													<label for="name">Name: <?php echo $user_name;?></label>
												</div>
											</div>
											<div class="work-request--information">
												<div class="information-name">
													<label for="name">Surname: <?php echo $user_surname;?></label>
												</div>
												<div class="information-email">
													<label for="name">Father Name: <?php echo $user_fathername;?></label>
												</div>
											</div>
											<div class="work-request--information">
												<div class="information-name">
													<input id="email" type="email" spellcheck="false" name = "email">
													<label for="name">Email: <?php echo $user_email;?></label>
												</div>
												<div class="information-email">
													<input id="idnumber" type="text" spellcheck="false" name = "idnumber">
													<label for="name">ID Number: <?php echo $user_idnumber;?></label>
												</div>
											</div>
											<div class="work-request--information">
												<div class="information-name">
													<input id="telephonea" type="text" spellcheck="false" name = "telephonea">
													<label for="name">Telephone A: <?php echo $user_telephonea;?></label>
												</div>
												<div class="information-email">
													<input id="telephoneb" type="text" spellcheck="false" name = "telephoneb">
													<label for="name">Telephone B: <?php echo $user_telephoneb;?></label>
												</div>
											</div>										
											<div class="work-request--information">
												<div class="information-name">
													<label for="name">City: <?php echo $user_city;?></label>
												</div>
												<div class="information-email">
													<label for="name">Street: <?php echo $user_streetname;?></label>
												</div>
											</div>										
											<div class="work-request--information">
												<div class="information-name">
													<label for="name">Street Number: <?php echo $user_streetnumber;?></label>
												</div>
												<div class="information-email">
													<label for="name">Postal Code: <?php echo $user_postalcode;?></label>
												</div>
											</div>										
											<div class="work-request--information">
												<div class="information-name">
													<!--<input id="taxnumberid" type="text" spellcheck="false" name = "taxnumberid">-->
													<label for="name">Tax Number: <?php echo $user_taxnumber_ID;?></label>
												</div>
												<div class="information-name">
													<input id="button" type="submit" name="submit" value=Save>
												</div>	
											</div>	
																							
										</form>
			
									</div>				
								</div>	
							</li>
							<li class="l-section section">
								<div class="contact">
									<div class="contact--lockup">
										<div class="modal">
											<div class="modal--information">
												<p>107 Patision & 8 Pellinis St, Athens, Greece</p>
												<a href="mailto:support@geo_tracking.com">support@geo_tracking.com</a>
												<a href="tel:+148126287560">+30 210 999 9999</a>
											</div>
											<ul class="modal--options">
												<li><a href="mailto:ouremail@gmail.com">Contact Us</a></li>
											</ul>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<ul class="outer-nav">
				<li class="is-active">Navigation</li>
				<li>Search for Tracker</li>
				<li>View Profile</li>
				<li>Contact Us</li>
				<!--<li>Sign Out</li>-->
			</ul>
		</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
		<script src="assets/js/functions-min.js"></script>
		
		<script>
			var customLabel = {
				tracker: {
					label: 'T'
				},
				poi: {
					label: 'P'
				},
				restaurant: {
					label: 'R'
				},
				gasstation: {
					label: 'G'
				},
				interesting: {
					label: 'I'
				}
			};

			function initMap() {
				var map = new google.maps.Map(document.getElementById('map'), {
					center: new google.maps.LatLng(38.2648779, 23.4727507),
					zoom: 7
				});
				var infoWindow = new google.maps.InfoWindow;

				// Change this depending on the name of your PHP or XML file
				downloadUrl('http://localhost/webpages/Navigation/assets/php/data_load.php', function(data) {
					var xml = data.responseXML;
					var markers = xml.documentElement.getElementsByTagName('marker');
					Array.prototype.forEach.call(markers, function(markerElem) {
						var IMEI = markerElem.getAttribute('TrackerIMEI_ID');
						var Sp = markerElem.getAttribute('Speed');
						var EvTime = markerElem.getAttribute('EventTime');
						var point = new google.maps.LatLng(
							parseFloat(markerElem.getAttribute('Longitude')),
							parseFloat(markerElem.getAttribute('Latitude'))
						);
						// FIX THE LABEL FOR THE POINTS
						var infowincontent = document.createElement('div');
						var strong = document.createElement('strong');
						strong.textContent = IMEI
						infowincontent.appendChild(strong);
						infowincontent.appendChild(document.createElement('br'));
	
						var text = document.createElement('text');
						text.textContent = EvTime
						infowincontent.appendChild(text);
						var icon = customLabel["tracker"] || {};
						var marker = new google.maps.Marker({
							map: map,
							position: point,
							label: icon.label
						});
						marker.addListener('click', function() {
							infoWindow.setContent(infowincontent);
							infoWindow.open(map, marker);
						});
					});
				});
			}

			function downloadUrl(url, callback) {
				var request = window.ActiveXObject ?
				new ActiveXObject('Microsoft.XMLHTTP') :
				new XMLHttpRequest;

				request.onreadystatechange = function() {
					if (request.readyState == 4) {
						request.onreadystatechange = doNothing;
						callback(request, request.status);
					}
				};
				request.open('GET', url, true);
				request.send(null);
			}
		
			function doNothing() {}
		</script>
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHDcpQOKwPI_-DSmat_pI03h4186-0-2A&callback=initMap">
		</script>
		
	</body>
</html>
