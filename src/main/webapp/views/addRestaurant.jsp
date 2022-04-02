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
  <link href="resources/vendor_admin/dropzone.css" rel="stylesheet">
  <link href="resources/css_admin/date_picker.css" rel="stylesheet">
  <!-- WYSIWYG Editor -->
  <link rel="stylesheet" href="resources/js_admin/editor/summernote-bs4.css">
  <!-- Your custom styles -->
  <link href="resources/css_admin/custom.css" rel="stylesheet">

</head>

<body class="fixed-nav sticky-footer" id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
	<a class="navbar-brand" href="index.php"><img src="resources/img_admin/logo.png" data-retina="true" alt="" width="150" height="36"></a>
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

  <form class="content-wrapper" action="saveRestaurant.phpp" method="post">
<%--	  <form >--%>
<%--		  enctype="multipart/form-data"--%>
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Add Restaurant</li>
      </ol>
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-file"></i>Restaurant info</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Listing Title</label>
						<input type="text" class="form-control" placeholder="Restaurant Title" name="name">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Cuisine Type</label>
						<input type="text" class="form-control" placeholder="Ex. Traditional dishes " name="typeCuisine">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Tags</label>
						<input type="text" class="form-control" placeholder="Tags should be separated by commas. Ex: Wifi, Alcohol, ...." name="tags">
					</div>
				</div>
			</div>

			<!-- /row-->
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>Phone (Optional)</label>
						<input type="text" class="form-control" name="phone">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Web site (Optional)</label>
						<input type="text" class="form-control" name="webSite">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Email (Optional)</label>
						<input type="text" class="form-control" name="email">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>Facebook link (Optional)</label>
						<input type="text" class="form-control" name="facebook">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Instagram link (Optional)</label>
						<input type="text" class="form-control" name="instagram">
					</div>
				</div>
			</div>
			<!-- /row-->
			<!-- /row-->

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Restaurant Photos</label>
<%--						<form action="/file-upload" class="dropzone"></form>--%>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Menu Photos</label>
<%--						<form action="/file-upload" class="dropzone"></form>--%>
					</div>
				</div>
			</div>
			<!-- /row-->
			<!-- /row-->

		<!-- /box_general-->
		<!-- /box_general-->

<%--		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa-solid fa-tags"></i>Tags</h2>
			</div>

			<!-- /row-->
		</div>--%>
		<!-- /box_general-->
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-map-marker"></i>Location</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Address</label>
						<input type="text" class="form-control" placeholder="ex. 250, Fifth Avenue..." name="address">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Google Maps Link (Optional)</label>
						<input type="text" class="form-control" placeholder="https://maps.google.com/....." name="googleMaps">
					</div>
				</div>
			</div>
		</div>
		<!-- /box_general-->
		
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-clock-o"></i>Opening</h2>
			</div>
			<div class="row">
				<div class="col-md-2">
					<label class="fix_spacing">Normal Days</label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<div class="styled-select">
						<select name="openingTime">
							<option>Opening Time</option>
							<option>Closed</option>
							<option>1 AM</option>
							<option>2 AM</option>
							<option>3 AM</option>
							<option>4 AM</option>
							<option>5 AM</option>
							<option>6 AM</option>
							<option>7 AM</option>
							<option>8 AM</option>
							<option>9 AM</option>
							<option>10 AM</option>
							<option>11 AM</option>
							<option>12 AM</option>	
							<option>1 PM</option>
							<option>2 PM</option>
							<option>3 PM</option>
							<option>4 PM</option>
							<option>5 PM</option>
							<option>6 PM</option>
							<option>7 PM</option>
							<option>8 PM</option>
							<option>9 PM</option>
							<option>10 PM</option>
							<option>11 PM</option>
							<option>12 PM</option>
						</select>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<div class="styled-select">
						<select name="closingTime">
							<option>Closing Time</option>
							<option>Closed</option>
							<option>1 AM</option>
							<option>2 AM</option>
							<option>3 AM</option>
							<option>4 AM</option>
							<option>5 AM</option>
							<option>6 AM</option>
							<option>7 AM</option>
							<option>8 AM</option>
							<option>9 AM</option>
							<option>10 AM</option>
							<option>11 AM</option>
							<option>12 AM</option>	
							<option>1 PM</option>
							<option>2 PM</option>
							<option>3 PM</option>
							<option>4 PM</option>
							<option>5 PM</option>
							<option>6 PM</option>
							<option>7 PM</option>
							<option>8 PM</option>
							<option>9 PM</option>
							<option>10 PM</option>
							<option>11 PM</option>
							<option>12 PM</option>
						</select>
						</div>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-2">
					<label class="fix_spacing">The Week-End</label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<div class="styled-select">
						<select name="openingTimeWeekEnd">
							<option>Opening Time</option>
							<option>Closed</option>
							<option>1 AM</option>
							<option>2 AM</option>
							<option>3 AM</option>
							<option>4 AM</option>
							<option>5 AM</option>
							<option>6 AM</option>
							<option>7 AM</option>
							<option>8 AM</option>
							<option>9 AM</option>
							<option>10 AM</option>
							<option>11 AM</option>
							<option>12 AM</option>	
							<option>1 PM</option>
							<option>2 PM</option>
							<option>3 PM</option>
							<option>4 PM</option>
							<option>5 PM</option>
							<option>6 PM</option>
							<option>7 PM</option>
							<option>8 PM</option>
							<option>9 PM</option>
							<option>10 PM</option>
							<option>11 PM</option>
							<option>12 PM</option>
						</select>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<div class="styled-select">
						<select name="closingTimeWeekEnd">
							<option>Closing Time</option>
							<option>Closed</option>
							<option>1 AM</option>
							<option>2 AM</option>
							<option>3 AM</option>
							<option>4 AM</option>
							<option>5 AM</option>
							<option>6 AM</option>
							<option>7 AM</option>
							<option>8 AM</option>
							<option>9 AM</option>
							<option>10 AM</option>
							<option>11 AM</option>
							<option>12 AM</option>	
							<option>1 PM</option>
							<option>2 PM</option>
							<option>3 PM</option>
							<option>4 PM</option>
							<option>5 PM</option>
							<option>6 PM</option>
							<option>7 PM</option>
							<option>8 PM</option>
							<option>9 PM</option>
							<option>10 PM</option>
							<option>11 PM</option>
							<option>12 PM</option>
						</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /box_general-->
		
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-dollar"></i>Average Pricing </h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h6>For One Person</h6>
					<table id="pricing-list-container1" style="width:100%;">
						<tr class="pricing-list-item">
							<td>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Price in DH" name="averageCost">
										</div>
								</div>
								</div>
							</td>
						</tr>
					</table>
					</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		</div>
		<button type="submit" class="btn_1 medium">Save</button>
	</div>
<%--	  </form>--%>
  </form>

	  <!-- /.container-fluid-->
    <!-- /.container-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © PANAGEA 2018</small>
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
	<script src="resources/vendor_admin/dropzone.min.js"></script>
	<script src="resources/vendor_admin/bootstrap-datepicker.js"></script>
	<script>$('input.date-pick').datepicker();</script>
  <!-- WYSIWYG Editor -->
  <script src="resources/js_admin/editor/summernote-bs4.min.js"></script>
  <script>
      $('.editor').summernote({
    fontSizes: ['10', '14'],
    toolbar: [
      // [groupName, [list of button]]
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['font', ['strikethrough']],
      ['fontsize', ['fontsize']],
      ['para', ['ul', 'ol', 'paragraph']]
      ],
        placeholder: 'Write here your description....',
        tabsize: 2,
        height: 200
      });
    </script>
	
</body>
</html>