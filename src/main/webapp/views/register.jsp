<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />


	<!-- YOUR CUSTOM CSS -->
    <link href="resources/css/custom.css" rel="stylesheet">
	
</head>

<body id="register_bg">
	
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login">
		<aside>
			<figure>
				<a href="<c:url value="/" />"><img src="resources/img/logo_sticky.png" width="155" height="36" data-retina="true" alt="" class="logo_sticky"></a>
			</figure>
			<form autocomplete="off" method="post" action="saveRegister.php">
				<div class="form-group">
					<label>Your First Name</label>
					<input class="form-control" type="text" name="firstname" required>
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>Your Last Name</label>
					<input class="form-control" type="text" name="lastname" required>
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>Your Username</label>
					<input class="form-control" type="text" name="username" required>
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>Your Email</label>
					<input class="form-control" type="email" name="email"
						   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Your password</label>
					<input class="form-control" type="password" id="password1" name="password1" required>
					<i class="icon_lock_alt"></i>
				</div>
				<div class="form-group">
					<label>Confirm password</label>
					<input class="form-control" type="password" id="password2" name="password2" required>
					<i class="icon_lock_alt"></i>
				</div>
				<div id="pass-info" class="clearfix"></div>
<%--				<a href="#0" class="btn_1 rounded full-width add_top_30">Register Now!</a>--%>
				<button type="submit" class="btn_1 rounded full-width add_top_30">Register Now!</button>
				<div class="text-center add_top_10">Already have an account? <strong><a href="login">Sign In</a></strong>
				</div>
			</form>
			
		</aside>
	</div>
	<!-- /login -->
	
	<!-- COMMON SCRIPTS -->
    <script src="resources/js/jquery-2.2.4.min.js"></script>
    <script src="resources/js/common_scripts.js"></script>
    <script src="resources/js/main.js"></script>
	<script src="resources/assets/validate.js"></script>
	
	<!-- SPECIFIC SCRIPTS -->
	<script src="resources/js/pw_strenght.js"></script>
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