<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>Panagea | Premium site template for travel agencies, hotels and restaurant listing.</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="resources/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="resources/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="resources/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="resources/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="resources/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
	<link href="resources/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="resources/css/custom.css" rel="stylesheet">
	<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
</head>

<body id="login_bg">
	
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login">
		<aside>
			<figure>
				<a href="index.html"><img src="resources/img/logo_sticky.png" width="155" height="36" data-retina="true" alt="" class="logo_sticky"></a>
			</figure>
			  <form action="login" method="POST">
<%--				<div class="access_social">--%>
<%--					<a href="#0" class="social_bt facebook">Login with Facebook</a>--%>
<%--					<a href="#0" class="social_bt google">Login with Google</a>--%>
<%--					<a href="#0" class="social_bt linkedin">Login with Linkedin</a>--%>
<%--				</div>--%>
<%--				<div class="divider"><span>Or</span></div>--%>
				<div class="form-group">
					<label>Email</label>
					<input type="email" class="form-control" name="email" id="email" required>
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="password" id="password" value="" required>
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_30">
					<div class="checkboxes float-left">
						<label class="container_check">Remember me
						  <input type="checkbox" name="remember" id="remember">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="float-right mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<input type="submit"  class="btn_1 rounded full-width" value="Login to Panagea"/>
				<div class="text-center add_top_10">New to Panagea? <strong><a href="register.html">Sign up!</a></strong></div>
			</form>
			<div class="copy">© 2018 Panagea</div>
		</aside>
	</div>
	<!-- /login -->
		
	<!-- COMMON SCRIPTS -->
    <script src="resources/js/jquery-2.2.4.min.js"></script>
    <script src="resources/js/common_scripts.js"></script>
    <script src="resources/js/main.js"></script>
	<script src="resources/assets/validate.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
	<script>
		window.onload = function() {
			toastr.options = {
				"closeButton": false,
				"debug": false,
				"newestOnTop": false,
				"progressBar": false,
				"positionClass": "toast-bottom-right",
				"preventDuplicates": false,
				"onclick": null,
				"showDuration": "300",
				"hideDuration": "1000",
				"timeOut": "5000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut"
			}
			if ("${errorMessage}"){
				toastr["error"]("", "${errorMessage}")
			}
		}
	</script>
</body>
</html>