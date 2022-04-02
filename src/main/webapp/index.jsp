<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
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
                     <c:if test="${loginedUser.role.equals('Admin')}">
                        <li><span><a href="homeAdmin.admin">Admin Section</a></span></li>
                     </c:if>
                    </c:when>
                    <c:otherwise>
                        <li><span><a href="index.php">Home</a></span></li>
                        <c:if test="${loginedUser.role.equals('Admin')}">
                            <li><span><a href="homeAdmin.admin">Admin Section</a></span></li>
                        </c:if>
                        <li><span><a href="register.php">Register</a></span></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </nav>
    </header>
    <!-- /header -->

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
            <p class="btn_home_align"><a href="tours-grid-isotope.html" class="btn_1 rounded">View all Restaurents</a></p>
            <hr class="large">
        </div>
        <!-- /container -->
        </main>
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
                        <form method="post" action="assets/newsletter.php" name="newsletter_form" id="newsletter_form">
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

</body>
</html>