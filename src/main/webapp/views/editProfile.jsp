<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.restaurantmanagement.utils.AppUtils" %>
<%@ page import="com.example.restaurantmanagement.entities.User" %>
<%
	User currentUser = AppUtils.getLoginedUser(request.getSession());
%>
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

	<style>
		.image_profile {
			border-radius: 50%;
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
		span {
			display: block;
			margin-left: auto;
			margin-right: auto;
		}

	</style>

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
				<a href="<c:url value="/" />"><img src="resources/img/logo_sticky.png" height="36" data-retina="true" alt="" class="logo_sticky"></a>
			</figure>
			<form autocomplete="off" method="post" action="saveEditProfile.php" enctype="multipart/form-data">
					<img src="upload/users/<%= currentUser.getId()%>-PIC.png" height="170" data-retina="true" alt="" class="image_profile">
					<br>
					<input class="form-control form-control-lg" id="picture" name="picture" type="file">
				<hr>
				<div class="form-group">
					<label>Your First Name</label>
					<input class="form-control" type="text" name="firstname" value="<%= currentUser.getFirstname()%>" required>
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>Your Last Name</label>
					<input class="form-control" type="text" name="lastname" value="<%= currentUser.getLastname() %>" required>
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>Your Username</label>
					<input class="form-control" type="text" name="username" value="<%= currentUser.getUsername() %>" required>
					<i class="ti-user"></i>
				</div>
				<hr>
				<div class="form-group">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="emailChange" name="emailChange">
						<label class="form-check-label" for="emailChange">Change email</label>
					</div>
				</div>
				<div class="form-group">
					<label><strong>Old</strong> Email</label>
					<input class="form-control" type="email" name="oldEmail" id="oldEmail" value="<%= currentUser.getEmail() %>" disabled>
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>New Email</label>
					<input class="form-control" type="email" id="email1" name="email1" disabled>
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Confirm New Email</label>
					<input class="form-control" type="email" id="email2" name="email2" disabled>
					<i class="icon_mail_alt"></i>
					<br>
					<span id="message"></span>
				</div>
				<hr>
				<div class="form-group">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="passwordChange" name="passwordChange">
						<label class="form-check-label" for="passwordChange">Change password</label>
					</div>
				</div>
				<div class="form-group">
					<label><strong>Old</strong> password</label>
					<input class="form-control" type="password" id="oldPassword" name="oldPassword" value="" disabled>
					<i class="icon_lock_alt"></i>
				</div>

				<div class="form-group">
					<label>New password</label>
					<input class="form-control" type="password" id="password1" name="password1" disabled>
					<i class="icon_lock_alt"></i>
				</div>
				<div class="form-group">
					<label>Confirm New password</label>
					<input class="form-control" type="password" id="password2" name="password2" disabled>
					<i class="icon_lock_alt"></i>
				</div>
				<div id="pass-info" class="clearfix"></div>
<%--				<a href="#0" class="btn_1 rounded full-width add_top_30">Register Now!</a>--%>
				<button type="submit" class="btn_1 rounded full-width add_top_30">Edit Profile</button>
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
			if ("${succMessage}"){
				toastr["success"]("", "${succMessage}")
			}
			if ("${errorMessage}"){
				toastr["error"]("", "${errorMessage}")
			}
		}
		$('#email1, #email2').on('keyup', function () {
			if ($('#email1').val() == $('#email2').val()) {
				$('#message').html('Emails match').css('color', 'green');
			} else
				$('#message').html('Emails do not match!').css('color', 'red');
		});

		$("#emailChange").change(function() {
			if(this.checked) {
				$("#oldEmail,#email1,#email2").prop('disabled', false);
				$("#oldEmail,#email1,#email2").prop('required', true);
			}else {
				$("#oldEmail,#email1,#email2").prop('disabled', true);
				$("#oldEmail,#email1,#email2").prop('required', false);
			}
		});

		$("#passwordChange").change(function() {
			if(this.checked) {
				$("#oldPassword,#password1,#password2").prop('disabled', false);
				$("#oldPassword,#password1,#password2").prop('required', true);
			}else {
				$("#oldPassword,#password1,#password2").prop('disabled', true);
				$("#oldPassword,#password1,#password2").prop('required', false);
			}
		});


	</script>
	
  
</body>
</html>