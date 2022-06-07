<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file = "head.jsp"%>
</head>

<body>
	
	<div id="page">
		<%@ include file = "header.jsp"%>
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
									<c:if test="${loginedUser != null}">
									<c:choose>
										<c:when test="${bookmarks == null || bookmarks.isEmpty() == true}">
											<a OnClick="location.href='addBookMark.phpp?id=${restaurantsPage.get(i).getId()}&fromList=true'" class="wish_bt"></a>
										</c:when>
										<c:otherwise>
<%--											<c:forEach var = "v" begin = "0" end = "${bookmarks.size() - 1}">--%>
												<c:choose>
<%--													<c:when test="${bookmarks.get(v).getId() == restaurantsPage.get(i).getId()}">--%>
													<c:when test="${bookmarks.contains(restaurantsPage.get(i))}">
														<a OnClick="location.href='removeBookMark.phpp?id=${restaurantsPage.get(i).getId()}&fromList=true'" class="wish_bt liked" ></a>
													</c:when>
													<c:otherwise>
														<a OnClick="location.href='addBookMark.phpp?id=${restaurantsPage.get(i).getId()}&fromList=true'" class="wish_bt"></a>
													</c:otherwise>
												</c:choose>
<%--											</c:forEach>--%>
										</c:otherwise>
									</c:choose>
									</c:if>
									<a href="restaurantDetail.phpp?id=${restaurantsPage.get(i).getId()}"><img src="upload/${firstImages.get(i)}" class="resources/img-fluid" alt="" width="800" height="533"><div class="read_more"><span>Read more</span></div></a>
								</figure>
								<div class="wrapper">
									<h3><a href="restaurant-detail.html">${restaurantsPage.get(i).getName()}</a></h3>
									<p>${restaurantsPage.get(i).getDescription()}</p>
									<span class="price">Average <strong>${restaurantsPage.get(i).getAverageCost()} DH</strong> /per person</span>
								</div>
								<ul>
									<li><i class="ti-eye"></i> ${restaurantsPage.get(i).getViews()} views</li>
									<li><div class="score"><span>${restaurantsPage.get(i).getReviews().size()} Reviews</span><strong>${restaurantsPage.get(i).getRating()} / 5</strong></div></li>
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
		<!--footer-->
		<%@ include file = "footer.jsp"%>
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