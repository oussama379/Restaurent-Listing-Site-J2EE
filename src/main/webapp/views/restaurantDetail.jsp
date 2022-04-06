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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

    <!-- BASE CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
	<link href="resources/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="resources/css/custom.css" rel="stylesheet">

</head>

<body>
	
	<div id="page" class="theia-exception">
		<header class="header menu_fixed">
			<div id="preloader"><div data-loader="circle-side"></div></div><!-- /Preload -->
			<div id="logo">
				<a href="index.html">
					<img src="resources/img/logo.png" width="150" height="36" data-retina="true" alt="" class="logo_normal">
					<img src="resources/img/logo_sticky.png" width="150" height="36" data-retina="true" alt="" class="logo_sticky">
				</a>
			</div>
			<ul id="top_menu">
				<c:choose>
					<c:when test="${loginedUser != null}">
						<li>
							<div class="dropdown dropdown-user">
								<a href="#0" class="logged" data-toggle="dropdown" title="Logged"><img src="resources/img/avatar.jpg" alt=""></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="logout">Logout</a></li>
										<li><a href="#">${loginedUser.username}</a></li>
									</ul>
								</div>
							</div>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="#sign-in-dialog" id="sign-in" class="login" title="Sign In">Sign In</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<!-- /top_menu -->
			<a href="#menu" class="btn_mobile">
				<div class="hamburger hamburger--spin" id="hamburger">
					<div class="hamburger-box">
						<div class="hamburger-inner"></div>
					</div>
				</div>
			</a>
			<nav id="menu" class="main-menu">
				<ul>
					<c:choose>
						<c:when test="${loginedUser != null}">
							<li><span><a href="index.php">Home</a></span></li>
							<c:if test="${loginedUser.role.equals('ADMIN')}">
								<li><span><a href="homeAdmin.admin">Admin Section</a></span></li>
							</c:if>
						</c:when>
						<c:otherwise>
							<li><span><a href="index.php">Home</a></span></li>
							<c:if test="${loginedUser.role.equals('ADMIN')}">
								<li><span><a href="homeAdmin.admin">Admin Section</a></span></li>
							</c:if>
							<li><span><a href="register.php">Register</a></span></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>

		</header>
		<!-- /header -->
	
	<main>
		<section class="hero_in restaurants_detail">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>${restaurant.getName()}</h1>
				</div>
				<span class="magnific-gallery">
					<a href="upload/${Images.get(0)}" class="btn_photos" title="Photo title" data-effect="mfp-zoom-in">View photos</a>
					<c:forEach var = "i" begin = "1" end = "${Images.size() - 1 }">
					<a href="upload/${Images.get(i)}" title="Photo title" data-effect="mfp-zoom-in"></a>
					</c:forEach>
				</span>
			</div>
		</section>
		<!--/hero_in-->

		<div class="bg_color_1">
			<nav class="secondary_nav sticky_horizontal">
				<div class="container">
					<ul class="clearfix">
						<li><a href="#description" class="active">Description</a></li>
						<li><a href="#reviews">Reviews</a></li>
						<li><a href="#sidebar">Booking</a></li>
					</ul>
				</div>
			</nav>
			<div class="container margin_60_35">
				<div class="row">
					<div class="col-lg-8">
						<section id="description">
							<h2>Description</h2>
							<p>${restaurant.getDescription()}</p>
							<hr>
							<h2>Tags</h2>
							<div class="row">
								<div class="col-lg-6">
									<ul class="bullets">
										<c:forEach var = "i" begin = "0" end = "${tags.size() - 1 }">
											<li>${tags.get(i)}</li>
										</c:forEach>
									</ul>
								</div>
								<%--<div class="col-lg-6">
									<ul class="bullets">
										<c:if test="${tags.get(4) != null}">
										<c:forEach var = "i" begin = "4" end = "${tags.size() - 1 }">
											<li>tags.get(i)</li>
										</c:forEach>
										</c:if>
									</ul>
								</div>--%>
							</div>
							<!-- /row -->
							<hr>
							<h2>Cuisine Type</h2>
							<div class="row">
								<div class="col-lg-6">
									<ul class="bullets">
										<li>${restaurant.getTypeCuisine()}</li>
								</div>
							</div>
							<!-- /row -->
							<hr>
							
							<h3>Menu Photos</h3>
							<!-- <div id="instagram-feed-restaurant" class="clearfix"></div> -->
							<div class="grid">
								<ul class="magnific-gallery">
									<c:forEach var = "i" begin = "0" end = "${menuImages.size() - 1 }">
									<li>
											<figure>
												<img src="upload/${menuImages.get(i)}" alt="">
												<figcaption>
													<div class="caption-content">
														<a href="upload/${menuImages.get(i)}" title="Photo title" data-effect="mfp-zoom-in">
															<i class="pe-7s-albums"></i>
															<p>Menu Photo</p>
														</a>
													</div>
												</figcaption>
											</figure>
									</li>
									</c:forEach>
								</ul>
							</div>
							<!-- <hr> -->
							<!-- <h3>Location</h3>
							<div id="map" class="map map_single add_bottom_30"></div> -->
							<!-- End Map -->
							<hr>
							<h2>Open Hours</h2>
							<br>
							<div class="row">
								<div class="col-lg-6">
									<ul class="bullets">
										<li>Monday to Friday : ${restaurant.getOpeningTime()} - ${restaurant.getClosingTime()} &#128336</li>
										<br>
										<li>Week-End : ${restaurant.getOpeningTimeWeekEnd()} - ${restaurant.getClosingTimeWeekEnd()} &#128336</li>
									</ul>
								</div>
							</div>		
							
							<hr>

							<h2>Payment Methods</h2>
							<br>
							<div class="row">
								<div class="col-lg-6">
									<ul class="bullets">
										<c:if test="${pay.contains('Cards')}"><li><img src="resources/img/cards_all.svg" alt=""></li><br></c:if>
										<c:if test="${pay.contains('Cash')}"><li>Cash</li></c:if>
									</ul>
								</div>
							</div>		
							<br>
							<br>	
						</section>
						<!-- /section -->

						<h3>Reviews</h3>
						<br>
						<section id="reviews">
						
							<div class="reviews-container">
								<!-- /review-box -->
								<div class="review-box clearfix">
									<figure class="rev-thumb"><img src="resources/img/avatar2.jpg" alt="">
									</figure>
									<div class="rev-content">
										<div class="rating">
											<i class="icon-star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i>
										</div>
										<div class="rev-info">
											Ahsan – April 01, 2016:
										</div>
										<div class="rev-text">
											<p>
												Sed eget turpis a pede tempor malesuada. Vivamus quis mi at leo pulvinar hendrerit. Cum sociis natoque penatibus et magnis dis
											</p>
										</div>
									</div>
								</div>
								<!-- /review-box -->
							</div>
							<!-- /review-container -->
						</section>
						<!-- /section -->
						<hr>

							<div class="add-review">
								<h5>Leave a Review</h5>
								<form>
									<div class="row">
										<div class="form-group col-md-6">
											<label>Name and Lastname *</label>
											<input type="text" name="name_review" id="name_review" placeholder="" class="form-control">
										</div>
										<div class="form-group col-md-6">
											<label>Email *</label>
											<input type="email" name="email_review" id="email_review" class="form-control">
										</div>
										<div class="form-group col-md-6">
											<label>Rating </label>
											<div class="custom-select-form">
											<select name="rating_review" id="rating_review" class="wide">
												<option value="1">1 (lowest)</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5" selected>5 (medium)</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10 (highest)</option>
											</select>
											</div>
										</div>
										<div class="form-group col-md-12">
											<label>Your Review</label>
											<textarea name="review_text" id="review_text" class="form-control" style="height:130px;"></textarea>
										</div>
										<div class="form-group col-md-12 add_top_20">
											<input type="submit" value="Submit" class="btn_1" id="submit-review">
										</div>
									</div>
								</form>
							</div>
					</div>
					<!-- /col -->
					
					<aside class="col-lg-4" id="sidebar">
						<div class="box_detail booking">
							<div class="price">
								<span>45$ <small>person</small></span>
								<div class="score"><span>Good<em>350 Reviews</em></span><strong>${restaurant.getRating()}</strong></div>
							</div>
							
						
							
							<a href="#" class="btn_1 full-width outline wishlist"><i class="icon_map"></i> ${restaurant.getGoogleMaps()}</a>
							<a href="#" class="btn_1 full-width outline wishlist"><i class="icon_phone"></i> ${restaurant.getPhone()}</a>
							<a href="#" class="btn_1 full-width outline wishlist"><i class="icon_internet"></i>&#64; ${restaurant.getWebSite()}</a>
							<a href="#" class="btn_1 full-width outline wishlist"><i class="fa fa-envelope"></i>  ${restaurant.getEmail()}</a>
							<a href="#" class="btn_1 full-width outline wishlist"><i class="icon_pin_alt"></i> ${restaurant.getAddress()}</a>
							<!-- <div class="form-group">
								<input class="form-control" type="text" placeholder="Neighborhood...." name="location">
								<input class="form-control" type="text" placeholder="Neighborhood...." name="location">
								<i class="icon_pin_alt"></i>
							</div> -->
							
						</div>
						<ul class="share-buttons">
						<li><a class="fb-share" href="${restaurant.getFacebook()}"><i class="social_facebook"></i>Facebook</a></li>
						<li><a class="twitter-share" href="${restaurant.getInstagram()}"><i class="social_instagram"></i> Instagram</a></li>
						</ul>
					</aside>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->
	</main>
	<!--/main-->
	
	<footer>
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-5 col-md-12 p-r-5">
					<p><img src="resources/img/logo.png" width="150" height="36" data-retina="true" alt=""></p>
					<p>Mea nibh meis philosophia eu. Duis legimus efficiantur ea sea. Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu. Nihil facilisi indoctum an vix, ut delectus expetendis vis.</p>
					<div class="follow_us">
						<ul>
							<li>Follow us</li>
							<li><a href="#0"><i class="ti-facebook"></i></a></li>
							<li><a href="#0"><i class="ti-twitter-alt"></i></a></li>
							<li><a href="#0"><i class="ti-google"></i></a></li>
							<li><a href="#0"><i class="ti-pinterest"></i></a></li>
							<li><a href="#0"><i class="ti-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 ml-lg-auto">
					<h5>Useful links</h5>
					<ul class="links">
						<li><a href="about.html">About</a></li>
						<li><a href="login.html">Login</a></li>
						<li><a href="register.html">Register</a></li>
						<li><a href="blog.html">News &amp; Events</a></li>
						<li><a href="contacts.html">Contacts</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Contact with Us</h5>
					<ul class="contacts">
						<li><a href="tel://61280932400"><i class="ti-mobile"></i> + 61 23 8093 3400</a></li>
						<li><a href="mailto:info@Panagea.com"><i class="ti-email"></i> info@Panagea.com</a></li>
					</ul>
					<div id="newsletter">
					<h6>Newsletter</h6>
					<div id="message-newsletter"></div>
					<form method="post" action="resources/assets/newsletter.php" name="newsletter_form" id="newsletter_form">
						<div class="form-group">
							<input type="email" name="email_newsletter" id="email_newsletter" class="form-control" placeholder="Your email">
							<input type="submit" value="Submit" id="submit-newsletter">
						</div>
					</form>
					</div>
				</div>
			</div>
			<!--/row-->
			<hr>
			<div class="row">
				<div class="col-lg-6">
					<ul id="footer-selector">
						<li>
							<div class="styled-select" id="lang-selector">
								<select>
									<option value="English" selected>English</option>
									<option value="French">French</option>
									<option value="Spanish">Spanish</option>
									<option value="Russian">Russian</option>
								</select>
							</div>
						</li>
						<li>
							<div class="styled-select" id="currency-selector">
								<select>
									<option value="US Dollars" selected>US Dollars</option>
									<option value="Euro">Euro</option>
								</select>
							</div>
						</li>
						<li><img src="resources/img/cards_all.svg" alt=""></li>
					</ul>
				</div>
				<div class="col-lg-6">
					<ul id="additional_links">
						<li><a href="#0">Terms and conditions</a></li>
						<li><a href="#0">Privacy</a></li>
						<li><span>© 2019 Panagea</span></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!--/footer-->
	</div>
	<!-- page -->

	<!-- Sign In Popup -->
	<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
		<div class="small-dialog-header">
			<h3>Sign In</h3>
		</div>
		<form action="login" method="POST">
			<div class="sign-in-wrapper">
				<%--            <a href="#0" class="social_bt facebook">Login with Facebook</a>--%>
				<%--            <a href="#0" class="social_bt google">Login with Google</a>--%>
				<%--            <div class="divider"><span>Or</span></div>--%>
				<div class="form-group">
					<label>Email</label>
					<input type="email" class="form-control" name="email" id="email">
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="password" id="password" value="">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-left">
						<label class="container_check">Remember me
							<input type="checkbox" name="remember">
							<span class="checkmark"></span>
						</label>
					</div>
					<div class="float-right mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<div class="text-center"><input type="submit" value="Log In" class="btn_1 full-width"></div>
				<div class="text-center">
					Don’t have an account? <a href="login">Sign up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label>
						<input type="email" class="form-control" name="email_forgot" id="email_forgot">
						<i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to reset your password to a new preferred one.</p>
					<div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
				</div>
			</div>
		</form>
		<!--form -->
	</div>
	<!-- /Sign In Popup -->

	<!-- /Sign In Popup -->

	<div id="toTop"></div><!-- Back to top button -->

	<!-- COMMON SCRIPTS -->
    <script src="resources/js/jquery-2.2.4.min.js"></script>
    <script src="resources/js/common_scripts.js"></script>
    <script src="resources/js/main.js"></script>
	<script src="resources/assets/validate.js"></script>
	
	<!-- Map -->
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="resources/js/map_single_restaurant.js"></script>
	<script src="resources/js/infobox.js"></script>
	
	<!-- DATEPICKER  -->
	<script>
	$('input[name="dates"]').daterangepicker({
		"singleDatePicker": true,
		"autoApply": true,
		parentEl:'#input_date',
		"linkedCalendars": false,
		"showCustomRangeLabel": false
	}, function(start, end, label) {
	  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});	
	</script>
	
	<!-- INPUT QUANTITY  -->
	<script src="resources/js/input_qty.js"></script>
	
	<!-- INSTAGRAM FEED  -->
	<script>
		$(window).on('load', function() {
			"use strict";
			$.instagramFeed({
				'username': 'restaurantetanit',
				'container': "#instagram-feed-restaurant",
				'display_profile': false,
				'display_biography': false,
				'display_gallery': true,
				'get_raw_json': false,
				'callback': null,
				'styling': true,
				'items': 12,
				'items_per_row': 6,
				'margin': 1
			});
		});
	</script>
	
	
  
</body>
</html>