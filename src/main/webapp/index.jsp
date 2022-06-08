<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file = "views/head.jsp"%>
</head>

<body>

<div id="page">
    <%@ include file = "views/header.jsp"%>
    <div>
        <section id="cover" class="hero_single version_2">
            <div class="wrapper">
                <div class="container">
                    <h3>Search for restaurants</h3>
                    <p>Explore top-rated restaurants in RABAT</p>
                    <form method="post" action="searchRestaurants.phpp">
                        <div class="row no-gutters custom-search-input-2">
                            <div class="col-lg-10">
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="Type the name of the restaurant you're looking for..." name="name">
                                    <input type="hidden" name="typesCuisine">
                                    <input type="hidden" name="location">
                                    <input type="hidden" name="cuisineType">
                                    <input type="hidden" name="rating">
                                    <i class="icon_search"></i>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <input type="submit" class="btn_search" value="Search">
                            </div>

                        </div>
                        <!-- /row -->
                        <p class="btn_home_align" style="text-align: center; margin-top: 5rem;">
                            <a href="listRestaurants.phpp" class="btn_1">View all Restaurents</a>
                        </p>
                    </form>
                </div>
            </div>
        </section>
        <!-- /hero_single -->

        <div class="container container-custom margin_80_0">
            <div class="main_title_2">
                <span><em></em></span>
                <h2>Our Popular restaurants</h2>
                <p>These restaurants are rated by users like you.${errorMessage}</p>
            </div>

            <div id="reccomended" class="owl-carousel owl-theme">
                <!-- item for here-->
                <c:if test="${topFive.size() > 0}">
                    <c:forEach var = "i" begin = "0" end = "${topFive.size() - 1 }">
                        <div class="item">
                            <div class="box_grid">
                                <figure>
                                    <c:if test="${loginedUser != null}">
                                        <c:choose>
                                            <c:when test="${bookmarks == null || bookmarks.isEmpty() == true}">
                                                <a OnClick="location.href='addBookMark.phpp?id=${topFive.get(i).getId()}&fromIndex=true'" class="wish_bt"></a>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var = "v" begin = "0" end = "${bookmarks.size() - 1}">
                                                    <c:choose>
                                                        <c:when test="${bookmarks.get(v).getId() == topFive.get(i).getId()}">
                                                            <a OnClick="location.href='removeBookMark.phpp?id=${topFive.get(i).getId()}&fromIndex=true'" class="wish_bt liked" ></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a OnClick="location.href='addBookMark.phpp?id=${topFive.get(i).getId()}&fromIndex=true'" class="wish_bt"></a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <a href="restaurantDetail.phpp?id=${topFive.get(i).getId()}"><img src="upload/restaurants/${firstImages.get(i)}" class="img-fluid" alt=""><div class="read_more"><span>Read more</span></div></a>
                                </figure>
                                <div class="wrapper">
                                    <h3><a href="restaurant-detail.html">${topFive.get(i).getName()}</a></h3>
                                    <p>${topFive.get(i).getDescription()}</p>
                                    <span class="price">Average <strong>${topFive.get(i).getAverageCost()} DH</strong> /per person</span>
                                </div>
                                <ul>
                                    <li><i class="ti-eye"></i> ${topFive.get(i).getViews()} views</li>
                                    <li><div class="score"><span>${topFive.get(i).getReviews().size()} Reviews</span><strong>${topFive.get(i).getRating()} / 5</strong></div></li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
               <!-- /item -->
            </div>
            <!-- /carousel -->
            <p class="btn_home_align"><a href="listRestaurants.phpp" class="btn_1 rounded">View all Restaurents</a></p>
            <hr class="large">
        </div>
        <!-- /container -->
        </main>
        <!--footer-->
        <%@ include file = "views/footer.jsp"%>
    </div>
        <!-- Sign In Popup -->
        <%@ include file = "views/SignInPopup.jsp"%>



<!-- page -->
<div id="toTop"></div><!-- Back to top button -->

<!-- COMMON SCRIPTS -->
<script src="resources/js/jquery-2.2.4.min.js"></script>
<script src="resources/js/common_scripts.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/assets/validate.js"></script>

</body>
</html>