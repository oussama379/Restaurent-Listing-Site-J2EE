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
    <!-- For Toast -->
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
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
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="homeAdmin.admin">
                    <i class="fa fa-fw fa-home"></i>
                    <span class="nav-link-text">Home</span>
                </a>
            </li>
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
                        <a href="listRestaurantCrud.phpp">List Restaurants</a>
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
<%--        <ol class="breadcrumb">--%>
<%--            <li class="breadcrumb-item">--%>
<%--                <a href="#">Dashboard</a>--%>
<%--            </li>--%>
<%--            <li class="breadcrumb-item active">List of Restaurants</li>--%>
<%--        </ol>--%>
        <div class="mb-4"></div>
        <!-- Example DataTables Card-->
        <div class="box_general">
            <div class="header_box">
                <h2 class="d-inline-block">Restaurant add requests</h2>
<%--                <div class="filter">--%>
<%--                    <select name="orderby" class="selectbox">--%>
<%--                        <option value="Any status">Any status</option>--%>
<%--                        <option value="Pending">Pending</option>--%>
<%--                        <option value="Cancelled">Cancelled</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
            </div>
            <div class="list_general">
                <ul>
                    <c:forEach items="${modelRestaurant.getRestaurants()}" var="r">
                        <a href="restaurantDetail.phpp?id=${r.id}">
                            <li>
                                <figure><img src="upload/restaurants/${r.images.split(":")[0]}" alt=""></figure>
                                <h4>${r.name} <i class="pending">Pending</i></h4>
                                <p>Address : ${r.address}</p>
                                <ul class="buttons">
                                    <li><a href="editRestaurant.phpp?id=${r.id} " class="btn_1 gray mr-3">Edit</a></li>
                                    <li><a href="approveRestaurant.phpp?id=${r.id} " class="btn_1 gray approve">Approve</a></li>
                                    <li><a href="cancelRestaurant.phpp?id=${r.id} " class="btn_1 gray delete">Cancel</a></li>
                                </ul>
                            </li>
                        </a>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <!-- /box_general-->
        <br>
        <br>
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
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script>
    window.onload = function() {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-bottom-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }

        if ("${successMessage}" !== ""){
            toastr["success"]("", "${successMessage}")
        }
        if ("${errorMessage}" !== ""){
            toastr["error"]("", "${errorMessage}")
        }
    }
</script>
</body>
</html>
