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
			<div class="bg-white padding margin-top-lg">
				<div class="row">
					<div class="col-md-4 col-lg-3">
						<!--Office Image-->
						<div class="thumbnail">
							<img src="assets/images/img-office.png" alt="...">
							<div class="caption">
								<h5>वैदेशिक रोजगार विभाग</h5>
							</div>
						</div>
					</div>
					<div class="col-md-8 col-lg-9">
						<!--Office Map-->
						<div id="map" style="width:100%;height:279px"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<a href="view-detail.php" title="" class="btn btn-sm btn-primary btn-block margin-top-lg">View Detail</a>
				</div>
				<div class="col-md-3">
					<a href="users.php" title="" class="btn btn-sm btn-primary btn-block margin-top-lg">Users</a>
				</div>
				<div class="col-md-3">
					<a href="submit-file.php" title="" class="btn btn-sm btn-primary btn-block margin-top-lg">Submit File</a>
				</div>
				<div class="col-md-3">
					<a href="programs.php" title="" class="btn btn-sm btn-primary btn-block margin-top-lg">कार्यक्रम</a>
				</div>
			</div>
			<ul class="different-list margin-top-lg">
				<li>
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th rowspan="2">वार्षिक/चौमासिक लक्ष्य र प्रगति</th>
									<th>लक्ष्य</th>
									<th><a href="l-first.php" title="" class="btn btn-xs btn-primary">प्रथम चौमासिक लक्ष्य</a></th>
									<th><a href="l-first2.php" title="" class="btn btn-xs btn-primary">दोस्रो चौमासिक लक्ष्य</a></th>
									<th><a href="l-first3.php" title="" class="btn btn-xs btn-primary">वार्षिक लक्ष्य</a></th>
								</tr>
								<tr>
									<th>प्रगति</th>
									<th><a href="l-second.php" title="" class="btn btn-xs btn-primary">प्रथम चौमासिक प्रगति</a></th>
									<th><a href="l-second2.php" title="" class="btn btn-xs btn-primary">दोस्रो चौमासिक प्रगति</a></th>
									<th><a href="l-second3.php" title="" class="btn btn-xs btn-primary">वार्षिक प्रगति</a></th>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>मासिक लक्ष्य र प्रगति</th>
									<th><a href="view1.php" title="" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i> View</a></th>
									<th><a href="#" title="" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i> Edit</a></th>
								</tr>
								<tr>
									<th>सचिब बैठक प्रगती</th>
									<th><a href="view2.php" title="" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i> View</a></th>
									<th><a href="#" title="" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i> Edit</a></th>
								</tr>
								<tr>
									<th>कार्य सम्पादन सुचक</th>
									<th><a href="view3.php" title="" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i> View</a></th>
									<th><a href="#" title="" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i> Edit</a></th>
								</tr>
								<tr>
									<th> बजेट बक्तब्य</th>
									<th><a href="view4.php" title="" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i> View</a></th>
									<th><a href="#" title="" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i> Edit</a></th>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
			</ul>
		</section>
		<div class="clearfix"></div>
		<!--Main Content Area Ends-->
		
		<?php require_once('app-footer.php');?>
		
		<script>
			function myMap() {
				var myCenter = new google.maps.LatLng(27.687022, 85.327193);
				var mapCanvas = document.getElementById("map");
				var mapOptions = {center: myCenter, zoom: 15};
				var map = new google.maps.Map(mapCanvas, mapOptions);
				var marker = new google.maps.Marker({position:myCenter});
				marker.setMap(map);
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
