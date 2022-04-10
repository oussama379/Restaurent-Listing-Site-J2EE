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
        <section class="hero_single version_2">
            <div class="wrapper">
                <div class="container">
                    <h3>Search for restaurants</h3>
                    <p>Expolore top rated restaurants near you</p>
                    <form>
                        <div class="row no-gutters custom-search-input-2">
                            <div class="col-lg-10">
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="Type the name of the restaurant you're looking for...">
                                    <i class="icon_search"></i>
                                </div>
                            </div>
                          <%--  <div class="col-lg-3">
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="Where">
                                    <i class="icon_pin_alt"></i>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <select class="wide">
                                    <option>All Categories</option>
                                    <option>Tours</option>
                                    <option>Hotels</option>
                                    <option>Restaurants</option>
                                </select>
                            </div>--%>
                            <div class="col-lg-2">
                                <input type="submit" class="btn_search" value="Search">
                            </div>
                        </div>
                        <!-- /row -->
                    </form>
                </div>
            </div>
        </section>
        <!-- /hero_single -->

        <div class="container container-custom margin_80_0">
            <div class="main_title_2">
                <span><em></em></span>
                <h2>Our Popular restaurants</h2>
                <p>These restaurants are rated by users like you.</p>
            </div>
            <div id="reccomended" class="owl-carousel owl-theme">
                <!-- item for here-->
                <div class="item">
                    <div class="box_grid">
                        <figure>
                            <a href="#0" class="wish_bt"></a>
                            <a href="tour-detail.html"><img src="resources/img/tour_1.jpg" class="img-fluid" alt="" width="800" height="533"><div class="read_more"><span>Read more</span></div></a>
                            <small>Historic</small>
                        </figure>
                        <div class="wrapper">
                            <h3><a href="tour-detail.html">Arc Triomphe</a></h3>
                            <p>Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu.</p>
                            <span class="price">From <strong>$54</strong> /per person</span>
                        </div>
                        <ul>
                            <li><i class="icon_clock_alt"></i> 1h 30min</li>
                            <li><div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div></li>
                        </ul>
                    </div>
                </div>
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