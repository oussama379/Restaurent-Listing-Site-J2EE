<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Ansonika">
  <title>PANAGEA - Admin dashboard</title>
	
  <!-- Favicons-->
  <link rel="shortcut icon" href="resources/img_admin/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon" type="image/x-icon" href="resources/img_admin/apple-touch-icon-57x57-precomposed.png">
  <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="resources/img_admin/apple-touch-icon-72x72-precomposed.png">
  <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="resources/img_admin/apple-touch-icon-114x114-precomposed.png">
  <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="resources/img_admin/apple-touch-icon-144x144-precomposed.png">

  <!-- GOOGLE WEB FONT -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800" rel="stylesheet">
	
  <!-- Bootstrap core CSS-->
  <link href="resources/vendor_admin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Main styles -->
  <link href="resources/css_admin/admin.css" rel="stylesheet">
  <!-- Icon fonts-->
  <link href="resources/vendor_admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Plugin styles -->
  <link href="resources/vendor_admin/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Your custom styles -->
  <link href="resources/css_admin/custom.css" rel="stylesheet">
	
</head>

<body class="fixed-nav sticky-footer" id="page-top">
 <!-- Navigation-->
 <nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
  <a class="navbar-brand" href="index.php"><img src="resources/img/logo.png" data-retina="true" alt="" width="150" height="36"></a>
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarResponsive">
    <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
  <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Manage Users">
        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings" data-parent="#mylistings">
          <i class="fa fa-fw fa-gear"></i>
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
          <i class="fa fa-fw fa-gear"></i>
          <span class="nav-link-text">Manage Restaurants</span>
        </a>
        <ul class="sidenav-second-level collapse" id="collapseComponents">
          <li>
            <a href="addRestaurant.phpp">Add Restaurants</a>
          </li>
          <li>
            <a href="listRestaurant.phpp">List Restaurants</a>
          </li>
        </ul>
      </li>
    </ul>
    <ul class="navbar-nav sidenav-toggler">
      <li class="nav-item">
        <a class="nav-link text-center" id="sidenavToggler">
          <i class="fa fa-fw fa-angle-left"></i>
        </a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <form class="form-inline my-2 my-lg-0 mr-lg-2">
          <div class="input-group">
            <input class="form-control search-top" type="text" placeholder="Search for...">
            <span class="input-group-btn">
              <button class="btn btn-primary" type="button">
                <i class="fa fa-search"></i>
              </button>
            </span>
          </div>
        </form>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
          <i class="fa fa-fw fa-sign-out"></i>Logout</a>
      </li>
    </ul>
  </div>
</nav>
<!-- /Navigation-->
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Manage Users</a>
        </li>
        <li class="breadcrumb-item active">List of Users</li>
      </ol>
		<!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> List of Users</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>First name</th>
                  <th>Last name</th>
                  <th>Username</th>
                  <th>Email</th>
                  <th>Role</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>First name</th>
                  <th>Last name</th>
                  <th>Username</th>
                  <th>Email</th>
                  <th>Role</th>
                </tr>
              </tfoot>
              <tbody>
              <tr>
                <td>Oussama</td>
                <td>Hennane</td>
                <td>oussama123</td>
                <td>oussama@gmail.com</td>
                <td>Admin</td>
                <td><a href="#0" class="btn_1 small">Edit</a></td>
                <td><a href="#0" class="btn_1 small">Delete</a></td>
              </tr>
              <c:forEach items="${modelUser.getUsers()}" var="u">
                <tr>
                  <td>${u.firstname}</td>
                  <td>${u.lastname}</td>
                  <td>${u.username}</td>
                  <td>${u.email}</td>
                  <td>${u.role}</td>
                  <td><a href="editUser.php?id=${u.id}" class="btn_1 small">Edit</a></td>
                  <td><a href="deleteUser.php?id=${u.id}" class="btn_1 small">Delete</a></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
	  <!-- /tables-->
       <br>
      <br>

      <c:choose>
        <c:when test="${confirmation == true}">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card dashboard text-white bg-success o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fa fa-fw fa-check"></i>
                </div>
                <div class="mr-5"><h5>Successfully deleted</h5></div>
              </div>
            </div>
          </div>
        </c:when>
        <c:when test="${confirmation == false}">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card dashboard text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fa fa-exclamation-triangle"></i>
                </div>
                <div class="mr-5"><h5>Unsuccessfully deleted</h5></div>
              </div>
            </div>
          </div>
        </c:when>
      </c:choose>
	  </div>
	  <!-- /container-fluid-->
   	</div>
    <!-- /container-wrapper-->


    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © 2022</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor_admin/jquery/jquery.min.js"></script>
    <script src="resources/vendor_admin/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="resources/vendor_admin/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="resources/vendor_admin/chart.js/Chart.min.js"></script>
    <script src="resources/vendor_admin/datatables/jquery.dataTables.js"></script>
    <script src="resources/vendor_admin/datatables/dataTables.bootstrap4.js"></script>
	<script src="resources/vendor_admin/jquery.selectbox-0.2.js"></script>
	<script src="resources/vendor_admin/retina-replace.min.js"></script>
	<script src="resources/vendor_admin/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="resources/js_admin/admin.js"></script>
	<!-- Custom scripts for this page-->
    <script src="resources/js_admin/admin-datatables.js"></script>
	
</body>
</html>
