<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file = "head.jsp"%>
</head>

<body>
	<div id="page" class="theia-exception">
		<%@ include file = "header.jsp"%>
		<main>
		<section class="hero_in restaurants_detail">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>${restaurant.getName()}</h1>
				</div>
				<span class="magnific-gallery">
					<a href="upload/restaurants/${Images.get(0)}" class="btn_photos" title="Photo title" data-effect="mfp-zoom-in">View photos</a>
					<c:forEach var = "i" begin = "1" end = "${Images.size() - 1 }">
					<a href="upload/restaurants/${Images.get(i)}" title="Photo title" data-effect="mfp-zoom-in"></a>
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
					<div class="col-lg-7">
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
                                    </ul>
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
												<img src="upload/restaurants/${menuImages.get(i)}" alt="">
												<figcaption>
													<div class="caption-content">
														<a href="upload/restaurants/${menuImages.get(i)}" title="Photo title" data-effect="mfp-zoom-in">
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
										<c:if test="${pay.contains('Cards')}"><li>Cards</li><br></c:if>
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
								<c:if test="${reviews.isEmpty() != true}">
                                <c:forEach var = "i" begin = "0" end = "${reviews.size() - 1 }">
                                <div class="review-box clearfix">
                                    <figure class="rev-thumb"><img src="upload/users/${reviews.get(i).getUser().getId()}-PIC.png" alt="">
                                    </figure>
                                    <div class="rev-content">
                                        <div class="rating">
                                            <c:if test="${reviews.get(i).getRating() == 5}">
                                            <i class="icon-star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon-star voted"></i>
                                            </c:if>
                                            <c:if test="${reviews.get(i).getRating() == 4}">
                                            <i class="icon-star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i>
                                            </c:if>
                                            <c:if test="${reviews.get(i).getRating() == 3}">
                                            <i class="icon-star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i>
                                            </c:if>
                                            <c:if test="${reviews.get(i).getRating() == 2}">
                                            <i class="icon-star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i>
                                            </c:if>
                                            <c:if test="${reviews.get(i).getRating() == 1}">
                                            <i class="icon-star voted"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i>
                                            </c:if>
                                        </div>
                                        <div class="rev-info">
                                            ${reviews.get(i).getUser().getUsername()} at ${reviews.get(i).getDateReview()} :
                                        </div>
                                        <div class="rev-text">
                                            <p>${reviews.get(i).getReviewText()}</p>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
								</c:if>
                                <!-- /review-box -->
							</div>
							<!-- /review-container -->
						</section>
						<!-- /section -->
						<hr>

						<c:if test="${loginedUser != null}">
							<div class="add-review">
								<h5>Leave a Review</h5>
								<form  action="submitReview.phpp" method="post">
									<div class="row">
										<c:choose>
										<c:when test="${loginedUser == null}">
											<div class="form-group col-md-6">
												<label>Name and Lastname *</label>
												<input type="text" name="name_review" id="name_review" placeholder="" class="form-control">
											</div>
											<div class="form-group col-md-6">
												<label>Email *</label>
												<input type="email" name="email_review" id="email_review" class="form-control">
											</div>
										</c:when>
										</c:choose>
										<div class="form-group col-md-6">
											<label>Rating </label>
											<div class="custom-select-form">
											<select name="rating" id="rating_review" class="wide">
												<option value="1">&#9733;</option>
												<option value="2">&#9733; &#9733;</option>
												<option value="3">&#9733; &#9733; &#9733;</option>
												<option value="4">&#9733; &#9733; &#9733; &#9733;</option>
												<option value="5">&#9733; &#9733; &#9733;  &#9733; &#9733;</option>
											</select>
											</div>
										</div>
										<div class="form-group col-md-12">
											<label>Your Review</label>
											<textarea name="review_text" id="review_text" class="form-control" style="height:130px;"></textarea>
										</div>
										<div class="form-group col-md-12 add_top_20">
											<input type="hidden" name="id" value="${restaurant.getId()}">
											<input type="submit" value="Submit" class="btn_1" id="submit-review">
										</div>
									</div>
								</form>
							</div>
						</c:if>
					</div>
					<!-- /col -->

					
					<aside class="col-lg-5" id="sidebar">
						<div class="box_detail booking">
							<div class="price">
								<span>${restaurant.getAverageCost()} DH <small>person</small></span>
								<div class="score"><span>${reviews.size()} Reviews</span>
									<c:if test="${Double.isNaN( restaurantRating)}">
									<strong>Not rated yet</strong>
									</c:if>
									<c:if test="${Double.isNaN( restaurantRating) != true}">
										<strong>${restaurantRating} / 5</strong>
									</c:if>
									</div>
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
		<!--footer-->
		<%@ include file ="footer.jsp"%>
	</div>
	<!-- page -->
	<!-- Sign In Popup -->
	<%@ include file = "SignInPopup.jsp"%>

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