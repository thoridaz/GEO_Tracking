<?php 
	session_start();
	$userx = $_SESSION['user'];
	$userIDx = $_SESSION['userID'];
	echo $_SESSION['user'];
	echo $_SESSION['userID'];
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
							<p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p>
							<a class="header--logo" href="#0">
								<img src="assets/img/logo.png" alt="5G">
								<p>5G Co</p>
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
								<div class="trackers">
									<h2>Select trackers to show</h2>
									<div class="trackers--lockup">
										<!--<h3>"user is $userx"</h3>
										<h3>"and his ID is $userIDx"</h3>-->
			
									</div>
								</div>
							</li>
							<li class="l-section section">
								<div class="speriod">
									<h2>Select Search Period</h2>
									<div class="work--lockup">
										
			
									</div>
								</div>
							</li>
							<li class="l-section section">
								<div class="profile">
									<h2>Manage Profile</h2>
									<div class="work--lockup">
										
										
										
										
										
			
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
				<li>Tracker Selection</li>
				<li>Search Period</li>
				<li>Manage Profile</li>
				<li>Contact Us</li>
			</ul>
		</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
		<script src="assets/js/functions-min.js"></script>
		
		<script>
			var customLabel = {
				restaurant: {
					label: 'T'
				},
				bar: {
					label: 'U'
				}
			};

			function initMap() {
				var map = new google.maps.Map(document.getElementById('map'), {
					center: new google.maps.LatLng(-33.863276, 151.207977),
					zoom: 12
				});
				var infoWindow = new google.maps.InfoWindow;

				// Change this depending on the name of your PHP or XML file
				downloadUrl('https://storage.googleapis.com/mapsdevsite/json/mapmarkers2.xml', function(data) {
					var xml = data.responseXML;
					var markers = xml.documentElement.getElementsByTagName('marker');
					Array.prototype.forEach.call(markers, function(markerElem) {
						var name = markerElem.getAttribute('name');
						var address = markerElem.getAttribute('address');
						var type = markerElem.getAttribute('type');
						var point = new google.maps.LatLng(
						parseFloat(markerElem.getAttribute('lat')),
						parseFloat(markerElem.getAttribute('lng')));

						var infowincontent = document.createElement('div');
						var strong = document.createElement('strong');
						strong.textContent = name
						infowincontent.appendChild(strong);
						infowincontent.appendChild(document.createElement('br'));
	
						var text = document.createElement('text');
						text.textContent = address
						infowincontent.appendChild(text);
						var icon = customLabel[type] || {};
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