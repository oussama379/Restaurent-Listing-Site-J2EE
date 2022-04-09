<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file = "head.jsp"%>
</head>

<body>
	
	<div id="page">
            <%@ include file = "header.jsp"%>
            <main>
		
		<section class="hero_in tours">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>Your Favorit Restaurants</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

		<div class="container margin_60_35">
			
		<div class="wrapper-grid">
			<div class="row">
				<c:if test="${restaurants.isEmpty() != true}">
					<c:forEach var = "i" begin = "0" end = "${restaurants.size() - 1 }">
						<div class="col-xl-4 col-lg-6 col-md-6">
							<div class="box_grid">
								<figure>
									<a OnClick="location.href='removeBookMark.phpp?id=${restaurants.get(i).getId()}'" class="wish_bt liked" ></a>
									<a href="restaurantDetail.phpp?id=${restaurants.get(i).getId()}"><img src="upload/${firstImages.get(i)}" class="resources/img-fluid" alt="" width="800" height="533"><div class="read_more"><span>Read more</span></div></a>
								</figure>
								<div class="wrapper">
									<h3><a href="restaurant-detail.html">${restaurants.get(i).getName()}</a></h3>
									<p>${restaurants.get(i).getDescription()}</p>
									<span class="price">Average <strong>${restaurants.get(i).getAverageCost()} DH</strong> /per person</span>
								</div>
								<ul>
									<li><i class="ti-eye"></i> ${restaurants.get(i).getViews()} views</li>
                                    <c:forEach var = "i1" begin = "0" end = "${reviewSizesPair.getKey().size() - 1 }">
										<c:if test="${restaurants.get(i).getId() == reviewSizesPair.getKey().get(i1)}">
									<li><div class="score"><span>${reviewSizesPair.getValue().get(i1)} Reviews</span><strong>${ratingsPair.getValue().get(i1)} / 5</strong></div></li>
										</c:if>
									</c:forEach>
										</ul>
							</div>
						</div>
					</c:forEach>
				</c:if>


				<!-- /box_grid -->
			</div>
			<!-- /row -->
			</div>
			<!-- /isotope-wrapper -->
						
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
	
	<script>
		$('.wish_bt.liked').on('click', function (c) {
			// $(this).parent().parent().parent().fadeOut('slow', function (c) {});
			// window.location='http://localhost:8182/Restaurent_Management_war_exploded/bookMarks.phpp';
		});
	</script>
	
	

  
</body>
</html>