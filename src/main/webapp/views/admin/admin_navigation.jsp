<%@ page import="com.example.restaurantmanagement.utils.AppUtils" %>
<%@ page import="com.example.restaurantmanagement.entities.User" %>
<%
    User loggedUser = AppUtils.getLoginedUser(request.getSession());
    String loggedUserRole2 = loggedUser.getRole();
%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
    <a class="navbar-brand" href="<c:url value="/" />"><img src="resources/img_admin/logo.png" data-retina="true" alt="" width="150" height="36"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
<c:if test='<%= loggedUserRole2.equals("ADMIN") %>'>
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="homeAdmin.admin">
                    <i class="fa fa-fw fa-home"></i>
                    <span class="nav-link-text">Home</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Manage Users">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings" data-parent="#mylistings">
                    <i class="fa fa-fw fa-user"></i>
                    <span class="nav-link-text">Manage Users</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseMylistings">
                    <li>
                        <a href="addUsers.php">Add users</a>
                    </li>
                    <li>
                        <a href="listUsers.php">List users</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Manage Restaurants">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#Components">
                    <i class="fa fa-fw fa-building"></i>
                    <span class="nav-link-text">Manage Restaurants</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseComponents">
                    <li>
                        <a href="addRestaurant.phpp">Add Restaurants</a>
                    </li>
                    <li>
                        <a href="listRestaurantCrud.phpp">List Restaurants</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="listRestReq.phpp">
                    <i class="fa fa-fw fa-file"></i>
                    <span class="nav-link-text">Restaurant add requests</span>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>
</c:if>
        <ul class="navbar-nav ml-auto">
<%--            <li class="nav-item">--%>
<%--                <form class="form-inline my-2 my-lg-0 mr-lg-2">--%>
<%--                    <div class="input-group">--%>
<%--                        <input class="form-control search-top" type="text" placeholder="Search for...">--%>
<%--                        <span class="input-group-btn">--%>
<%--              <button class="btn btn-primary" type="button">--%>
<%--                <i class="fa fa-search"></i>--%>
<%--              </button>--%>
<%--            </span>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </li>--%>
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                    <i class="fa fa-fw fa-sign-out"></i>Logout
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- /Navigation-->