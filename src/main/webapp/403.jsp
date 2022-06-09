<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file = "views/head.jsp"%>
</head>

<body style="background-color: #0054a6">
	
	<div id="page">
		<%@ include file = "views/header.jsp"%>
	<!-- /header -->
	
	<main>
	<div id="error_page">
			<div class="container">
				<div class="row justify-content-center text-center">
					<div class="col-xl-7 col-lg-9">
						<h2>403 &#128520<i class=""></i></h2>
						<p>Not with us</p>
<%--						<form>--%>
<%--							<div class="search_bar_error">--%>
<%--								<input type="text" class="form-control" placeholder="What are you looking for?">--%>
<%--								<input type="submit" value="Search">--%>
<%--							</div>--%>
<%--						</form>--%>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /error_page -->
	</main>
	<!--/main-->

		<%@ include file = "views/footer.jsp"%>
	<!--/footer-->
	</div>
	<!-- page -->
	
	<!-- Sign In Popup -->
	<%@ include file = "views/SignInPopup.jsp"%>
	<!-- /Sign In Popup -->
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- COMMON SCRIPTS -->
    <script src="resources/js/jquery-2.2.4.min.js"></script>
    <script src="resources/js/common_scripts.js"></script>
    <script src="resources/js/main.js"></script>
	<script src="resources/assets/validate.js"></script>
	
	
	
</body>
</html>