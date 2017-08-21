<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Dashboard</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <link rel="stylesheet" href="assets/css/style.css">
		<script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Ek+Mukta:200,300,400,500,600,700,800&amp;subset=devanagari,latin-ext" rel="stylesheet">
    </head>
    <body>
        <?php require_once('app-header.php');?>
		
		<!--Main Content Area Starts-->
		<section id="app-section">
			<!--Statistics-->
			<div class="row">
				<div class="col-md-4">
					<div class="widget-count margin-top-lg">
						<p>
						Total Users
						</p>
						<span>100</span>
					</div>
				</div>
				<div class="col-md-4">
					<div class="widget-count margin-top-lg">
						<p>
						Total Organizations
						</p>
						<span>23</span>
					</div>
				</div>
				<div class="col-md-4">
					<div class="widget-count margin-top-lg">
						<p>
						Total Submission
						</p>
						<span>200</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<!--Map-->
					<div class="bg-white padding margin-top-lg">
						<div id="map" style="width:100%;height:500px">
							
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<!--Map Mark Info-->
					<div class="bg-white padding margin-top-lg">
						<ul class="map-mark-info-list">
							<li>
								<p>
								<strong>कार्यालयको नाम:</strong></br>
								श्रम तथा रोजगार मन्त्रालय 
								</p>
							</li>
							<li>
								<p>
								<strong>कार्यालय प्रमुख:</strong></br>
								बिक्रान्त गिरी
								</p>
							</li>
							<li>
								<p>
								<strong>इमेल:</strong></br>
								l3ikrant@gmail.com
								</p>
							</li>
						</ul>
					</div>
				</div>
				
			</div>
		</section>
		<div class="clearfix"></div>
		<!--Main Content Area Ends-->
		
		<?php require_once('app-footer.php');?>
		<script>
			function myMap() {
				var myCenter = new google.maps.LatLng(27.695088, 85.324814);
				var mapCanvas = document.getElementById("map");
				var mapOptions = {center: myCenter, zoom:15};
				var map = new google.maps.Map(mapCanvas, mapOptions);
				var marker = new google.maps.Marker({position:myCenter});
				marker.setMap(map);
				google.maps.event.addListener(marker,'click',function() {
					take_action();
				});
			}
			function take_action(){
				alert("Take Action");
			}
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDmkU1cjj2GkxzKoYWZV987q0sIGCL3Ps&callback=myMap"></script>
        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <!--<script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
        </script>-->
    </body>
</html>
