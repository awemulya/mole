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
			<ol class="breadcrumb no-margin margin-top-lg">
			  <li><a href="index.php">गृह पृष्ठ</a></li>
			  <li><a href="page-office.php">वैदेशिक रोजगार विभाग</a></li>
			  <li><a href="l-second.php">वार्षिक/ चौमासिक प्रगति</a></li>
			  <li class="active">Edit</li>
			</ol>
			<div class="bg-white padding margin-top-lg">
				<div class="app-page-header">
					<h4>श्रम तथा रोजगार मन्त्रालयको भवन निर्माण(भवन निर्माण कार्यालय प्रयोजन)</h4>
					
				</div>
				<form>
					<div class="form-group">
						<label>पहिलो चौमासिक प्रगति</label>
					</div>
					<div class="form-group">
						<label for="input1">परिमाण</label>
						<input type="text" class="form-control" id="input1" placeholder="1">
					</div>
					<div class="form-group">
						<label for="input2">भार</label>
						<input type="text" class="form-control" id="input2" placeholder="2">
					</div>
					<div class="form-group">
						<label for="input3">लागत</label>
						<input type="text" class="form-control" id="input3" placeholder="1">
					</div>
					<div class="form-group">
						<label>भौतिक/आर्थिक प्रगती</label>
					</div>
					<div class="form-group">
						<label for="input1">भौतिक प्रगती</label>
						<input type="text" class="form-control" id="input1" placeholder="3">
					</div>
					<div class="form-group">
						<label for="input2">आर्थिक प्रगती</label>
						<input type="text" class="form-control" id="input2" placeholder="1">
					</div>
					<div class="form-group">
						<label>प्रतिवेदन अवधि सम्म को प्रगति </label>
					</div>
					<div class="form-group">
						<label for="input1">परिमाण</label>
						<input type="text" class="form-control" id="input1" placeholder="3">
					</div>
					<div class="form-group">
						<label for="input2">भारित</label>
						<input type="text" class="form-control" id="input2" placeholder="2">
					</div>
					<div class="form-group">
						<label>हाल सम्मको प्रगती</label>
					</div>
					<div class="form-group">
						<label for="input1">परिमाण</label>
						<input type="text" class="form-control" id="input1" placeholder="1">
					</div>
					<div class="form-group">
						<label for="input2">भारित</label>
						<input type="text" class="form-control" id="input2" placeholder="1">
					</div>
					<div class="form-group">
						<label for="input2">कैफियत</label>
						<textarea class="form-control" id="input2" placeholder=""></textarea>
					</div>
					<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-refresh"></i> Update</button>
				</form>
			</div>
		</section>
		<div class="clearfix"></div>
		<!--Main Content Area Ends-->
		
		<?php require_once('app-footer.php');?>
		
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
