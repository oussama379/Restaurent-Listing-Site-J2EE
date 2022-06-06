<!DOCTYPE html>
<html lang="en">

<head>
  <%@ include file = "admin/admin_head.jsp"%>
</head>

<body class="fixed-nav sticky-footer" id="page-top">
<%--<!-- Navigation-->--%>
  <%@ include file = "admin/admin_navigation.jsp"%>
<%--<!-- /Navigation-->--%>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
<%--      <ol class="breadcrumb">--%>
<%--        <li class="breadcrumb-item">--%>
<%--          <a href="homeAdmin.admin">Home</a>--%>
<%--        </li>--%>
<%--        <li class="breadcrumb-item active">Admin Dashboard</li>--%>
<%--      </ol>--%>
      <div class="mb-4"></div>
	  <!-- Icon Cards-->
      <div class="row">
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card dashboard text-white bg-primary o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-user"></i>
              </div>
              <div class="mr-5"><h5>${usersCount} User</h5></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="listUsers.php">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card dashboard text-white bg-success o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-check"></i>
              </div>
              <div class="mr-5"><h5>${approvedRestaurantsCount} Approved Restaurant</h5></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="listRestaurantCrud.phpp">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card dashboard text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-clock-o"></i>
              </div>
				<div class="mr-5"><h5>${pendingRestaurantsCount} Pending Restaurant</h5></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="listRestReq.phpp">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card dashboard text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-trash"></i>
              </div>
              <div class="mr-5"><h5>${cancelledRestaurantsCount} Cancelled Restaurant</h5></div>
            </div>
<%--            <a class="card-footer text-white clearfix small z-1" href="bookmarks.html">--%>
<%--              <span class="float-left">View Details</span>--%>
<%--              <span class="float-right">--%>
<%--                <i class="fa fa-angle-right"></i>--%>
<%--              </span>--%>
<%--            </a>--%>
          </div>
        </div>
		</div>
		<!-- /cards -->
		<h2></h2>
	  </div>
	  <!-- /.container-fluid-->
   	</div>
    <!-- /.container-wrapper-->

  <%@ include file = "admin/admin_footer.jsp"%>
</body>
</html>
