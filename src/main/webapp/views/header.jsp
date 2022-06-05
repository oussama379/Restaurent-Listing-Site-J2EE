

<header class="header menu_fixed">
    <div id="preloader"><div data-loader="circle-side"></div></div><!-- /Page Preload -->
    <div id="logo">
        <a href="index.php">
            <img src="resources/img/logo.png" width="150" height="36" data-retina="true" alt="" class="logo_normal">
            <img src="resources/img/logo_sticky.png" width="150" height="36" data-retina="true" alt="" class="logo_sticky">
        </a>
    </div>
    <ul id="top_menu">

        <c:choose>
            <c:when test="${loginedUser != null}">
                <li>
                    <div class="dropdown dropdown-user">
                        <a href="#0" class="logged" data-toggle="dropdown" title="Logged"><img src="upload/users/${loginedUser.getId()}-PIC.png" alt=""></a>
                        <div class="dropdown-menu">
                            <ul>
                                <li><a href="bookMarks.phpp">My Favorites</a></li>
                                <li><a href="editProfile.php">Edit Profile</a></li>
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
                    <li><span><a href="listRestaurants.phpp">Restaurants</a></span></li>
<%--                    <li><span><a href="bookMarks.phpp">My Favorites</a></span></li>--%>
                    <c:if test="${loginedUser.role.equals('ADMIN')}">
                        <li><span><a href="homeAdmin.admin">Admin Section</a></span></li>
                    </c:if>
                    <c:if test="${loginedUser.role.equals('OWNER')}">
                        <li><span><a href="addRestaurant.phpp">Restaurant add request</a></span></li>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <li><span><a href="index.php">Home</a></span></li>
                    <li><span><a href="listRestaurants.phpp">Restaurants</a></span></li>
                    <li><span><a href="register.php">Register</a></span></li>
                </c:otherwise>
            </c:choose>

        </ul>
    </nav>
</header>
<!-- /header -->