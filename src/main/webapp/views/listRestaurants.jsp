<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

</head>

<body>
	
	<div id="page">

	<header class="header menu_fixed">
		<div id="preloader"><div data-loader="circle-side"></div></div><!-- /Page Preload -->
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
		
		<section class="hero_in restaurants">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>Search For Your future Favorite Restaurants</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		
		<div class="filters_listing sticky_horizontal">
			<div class="container">
				<ul class="clearfix">
					<li>
						<div class="switch-field">
							<input type="radio" id="all" name="listing_filter" value="all" checked data-filter="*" class="selected">
							<label for="all">All</label>
							<input type="radio" id="popular" name="listing_filter" value="popular" data-filter=".popular">
							<label for="popular">Popular</label>
							<input type="radio" id="latest" name="listing_filter" value="latest" data-filter=".latest">
							<label for="latest">Latest</label>
						</div>
					</li>
					
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /filters -->
		
		<div class="collapse" id="collapseMap">
			<div id="map" class="map"></div>
		</div>
		<!-- End Map -->

		<div class="container margin_60_35">
			<form action="searchRestaurants.phpp" method="post">
			<div class="row">
<%--				<form action="" method="post">--%>
				<aside class="col-lg-3">
					<div class="custom-search-input-2 inner-2">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="Name..." name="name" value="<c:if test="${name != null}">${name}</c:if>">
							<i class="icon_search"></i>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" placeholder="Neighborhood...." name="location" value="<c:if test="${location != null}">${location}</c:if>">
							<i class="icon_pin_alt"></i>
						</div>
						<div class="form-group">
						<select class="wide" name="cuisineType">
							<option>All Categories</option>
							<c:if test="${typesCuisine.isEmpty() != true}">
									<c:forEach var = "i" begin = "0" end = "${typesCuisine.size() - 1}">
										<option <c:if test="${cuisineType.equals(typesCuisine.get(i))}">selected</c:if>>${typesCuisine.get(i)}</option>
									</c:forEach>
							</c:if>
						</select>
						</div>
						<br>
						<br>
						<br>
						<div class="form-group">
							<select class="wide" name="rating">
								<option value="0">Rating</option>
								<option value="1"<c:if test="${rating != null && rating == 1}">selected</c:if>>&#9733;</option>
								<option value="2" <c:if test="${rating != null && rating == 2}">selected</c:if>>&#9733; &#9733;</option>
								<option value="3" <c:if test="${rating != null && rating == 3}">selected</c:if>>&#9733; &#9733; &#9733;</option>
								<option value="4" <c:if test="${rating != null && rating == 4}">selected</c:if>>&#9733; &#9733; &#9733; &#9733;</option>
								<option value="5" <c:if test="${rating != null && rating == 5}">selected</c:if>>&#9733; &#9733; &#9733;  &#9733; &#9733;</option>
							</select>
						</div>
						<br>
						<br>
						<br>
						<%--<div class="form-group">
						<select class="wide" name="cuisineType">
							<option>No Time</option>
							<option >Open Now</option>
						</select>
					</div>--%>
					<%--	<div class="filter_type">
							<ul>
								<li>
									<label>
										<input type="checkbox" class="icheck" name="openNow">Open Now
									</label>
								</li>
							</ul>
						</div>--%>
						<input type="submit" class="btn_search" value="Search">
						<a href="listRestaurants.phpp" class="btn_1 medium">Cancel Search</a>
					</div>
				</aside>
<%--				</form>--%>
				<!-- /aside -->
<%--	${restaurantsPage.get(i).id}-PIC1-${restaurantsPage.get(i).images}--%>
				<div class="col-lg-9">
					<div class="isotope-wrapper">
					<div class="row">
                        <c:if test="${restaurantsPage.isEmpty() != true}">
						<c:forEach var = "i" begin = "0" end = "${restaurantsPage.size() - 1 }">
						<div class="col-md-6 isotope-item popular">
							<div class="box_grid">
								<figure>
									<a href="#0" class="wish_bt"></a>
									<a href="restaurantDetail.phpp?id=${restaurantsPage.get(i).getId()}"><img src="upload/${firstImages.get(i)}" class="resources/img-fluid" alt="" width="800" height="533"><div class="read_more"><span>Read more</span></div></a>
								</figure>
								<div class="wrapper">
									<h3><a href="restaurant-detail.html">${restaurantsPage.get(i).getName()}</a></h3>
									<p>${restaurantsPage.get(i).getDescription()}</p>
									<span class="price">Average <strong>${restaurantsPage.get(i).getAverageCost()} DH</strong> /per person</span>
								</div>
								<ul>
									<li><i class="ti-eye"></i> ${restaurantsPage.get(i).getPopularity()} views</li>
									<li><div class="score"><span>350 Reviews</span><strong>${restaurantsPage.get(i).getRating()}.0</strong></div></li>
								</ul>
							</div>
						</div>
						</c:forEach>
                        </c:if>

					</div>
					<!-- /row -->
					</div>
					<!-- /isotope-wrapper -->

<%--					<p class="text-center"><a href="#0" class="btn_1 rounded add_top_30">Load more</a></p>--%>

                    <c:if test="${restaurantsPage.isEmpty() != true}">
					<c:choose>
						<c:when test="${search == true}">
							<nav aria-label="...">
								<ul class="pagination pagination-sm">
									<li class="page-item <c:if test="${currentPage == 1}"> disabled </c:if> ">
										<a class="page-link" href="searchRestaurants.phpp?page=${currentPage - 1}&name=${name}&cuisineType=${cuisineType}&rating=${rating}&location=${location}" tabindex="-1">Previous</a>
									</li>
									<c:forEach var = "i" begin = "1" end = "${nbPages}">
										<li class="page-item  <c:if test="${currentPage == i}"> active </c:if> ">
											<a class="page-link" href="searchRestaurants.phpp?page=${i}&name=${name}&cuisineType=${cuisineType}&rating=${rating}&location=${location}">${i}</a>
										</li>
									</c:forEach>
									<li class="page-item <c:if test="${currentPage == nbPages}"> disabled </c:if> ">
										<a class="page-link" href="searchRestaurants.phpp?page=${currentPage + 1}&name=${name}&cuisineType=${cuisineType}&rating=${rating}&location=${location}">Next</a>
									</li>
								</ul>
							</nav>
						</c:when>
						<c:otherwise>
							<nav aria-label="...">
								<ul class="pagination pagination-sm">
									<li class="page-item <c:if test="${currentPage == 1}"> disabled </c:if> ">
										<a class="page-link" href="listRestaurants.phpp?page=${currentPage - 1}" tabindex="-1">Previous</a>
									</li>
									<c:forEach var = "i" begin = "1" end = "${nbPages}">
										<li class="page-item  <c:if test="${currentPage == i}"> active </c:if> ">
											<a class="page-link" href="listRestaurants.phpp?page=${i}">${i}</a>
										</li>
									</c:forEach>
									<li class="page-item <c:if test="${currentPage == nbPages}"> disabled </c:if> ">
										<a class="page-link" href="listRestaurants.phpp?page=${currentPage + 1}">Next</a>
									</li>
								</ul>
							</nav>
						</c:otherwise>
					</c:choose>
                    </c:if>
				</div>
				<!-- /col -->

			</div>
			</form>
		</div>

		<!-- /container -->
		
	
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
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- COMMON SCRIPTS -->
    <script src="resources/js/jquery-2.2.4.min.js"></script>
    <script src="resources/js/common_scripts.js"></script>
    <script src="resources/js/main.js"></script>
	<script src="resources/assets/validate.js"></script>
	
	<!-- Map -->
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="resources/js/markerclusterer.js"></script>
	<script src="resources/js/map_restaurants.js"></script>
	<script src="resources/js/infobox.js"></script>
	
	<!-- Masonry Filtering -->
	<script src="resources/js/isotope.min.js"></script>
	<script>
	$(window).load(function(){
	  var $container = $('.isotope-wrapper');
	  $container.isotope({ itemSelector: '.isotope-item', layoutMode: 'masonry' });
	});

	$('.filters_listing').on( 'click', 'input', 'change', function(){
	  var selector = $(this).attr('data-filter');
	  $('.isotope-wrapper').isotope({ filter: selector });
	});
	</script>
	
	<!-- Range Slider -->
	<script>
		 $("#range").ionRangeSlider({
            hide_min_max: true,
            keyboard: true,
            min: 30,
            max: 180,
            from: 60,
            to: 130,
            type: 'double',
            step: 1,
            prefix: "Km. ",
            grid: false
        });
	</script>

	
  
</body>
</html>