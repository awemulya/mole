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
			  <li><a href="l-second.php">वार्षिक/ चौमासिक लक्ष्य</a></li>
			  <li class="active">बजेट</li>
			</ol>
			<div class="bg-white padding margin-top-lg">
				<div class="app-page-header">
					<h4>बजेट थप्नुहोस</h4>
				</div>
				<form>
					<div class="form-group">
						<label for="input1">१. बजेट शिर्षक न. </label>
						<input type="text" class="form-control" id="input1">
					</div>
					<div class="form-group">
						<label for="input2">२. यस अवधिको बजेट रु</label>
						<input type="text" class="form-control" id="input2">
					</div>
					<hr>
					<div class="form-group">
						<label>क. आन्तरिक</label>
					</div>
					<div class="form-group">
						<label for="input3">i. नेपाल सरकार</label>
						<input type="text" class="form-control" id="input3">
					</div>
					<div class="form-group">
						<label for="input4">ii. संस्था</label>
						<input type="text" class="form-control" id="input4">
					</div>
					<div class="form-group">
						<label for="input5">iii. जन सहभागिता</label>
						<input type="text" class="form-control" id="input5">
					</div>
					<hr>
					<div class="form-group">
						<label>ख. वैदेसिक</label>
					</div>
					<div class="form-group">
						<label for="input6">i. ऋण</label>
						<input type="text" class="form-control" id="input6">
					</div>
					<div class="form-group">
						<label for="input7">ii. अनुदान</label>
						<input type="text" class="form-control" id="input7">
					</div>
					<hr>
					<div class="form-group">
						<label for="input8">ग. दार्ति संस्था</label>
						<input type="text" class="form-control" id="input8">
					</div>
					<hr>
					<div class="form-group">
						<label>३. यस अवधिको खर्च रु</label>
					</div>
					<div class="form-group">
						<label for="input9">i. आन्तरिक</label>
						<input type="text" class="form-control" id="input9">
					</div>
					<div class="form-group">
						<label for="input10">ii. वैदेशिक</label>
						<input type="text" class="form-control" id="input10">
					</div>
					<hr>
					<div class="form-group">
						<label for="input11">४. चौमासिक बजेटको खर्च प्रतिसत</label>
						<input type="text" class="form-control" id="input11">
					</div>
					<div class="form-group">
						<label for="input12">५. सुरु देखि यस अवधिसम्मको कुल खर्च(कुल लागतको तुलनामा)</label>
						<input type="text" class="form-control" id="input12">
					</div>
					<div class="form-group">
						<label for="input13">६. बितेको समय प्रतिसतमा (कुल अवधिको तुलनामा)</label>
						<input type="text" class="form-control" id="input13">
					</div>
					<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-save"></i> Save</button>
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
