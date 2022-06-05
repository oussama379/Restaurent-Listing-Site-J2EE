<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.example.restaurantmanagement.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<% boolean confirmation = (boolean) request.getAttribute("confirmation"); %>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file = "admin/admin_head.jsp"%>
</head>

<body class="fixed-nav sticky-footer" id="page-top">
<!-- Navigation-->
  <%@ include file = "admin/admin_navigation.jsp"%>
<!-- /Navigation-->
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs--> 
<%--      <ol class="breadcrumb">--%>
<%--        <li class="breadcrumb-item">--%>
<%--          <a href="#">Manage Users</a>--%>
<%--        </li>--%>
<%--        <li class="breadcrumb-item active">Add Users</li>--%>
<%--      </ol>--%>
        <div class="mb-4"></div>
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-file"></i>User info</h2>
			</div>
            <form action="saveUser.php" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>First name</label>
						<input type="text" class="form-control" placeholder="first name" name="firstname" value="" required>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Last name</label>
						<input type="text" class="form-control" placeholder="last name" name="lastname" value="" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Username</label>
						<input type="text" class="form-control" placeholder="username" name="username" required>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Email</label>
						<input type="email" class="form-control" placeholder="email" name="email" required>
					</div>
				</div>
			</div>

                <!-- /row-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" placeholder="password" name="password" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" class="form-control" placeholder="password" name="password" required>
                        </div>
                    </div>

                </div>

			<!-- /row-->
			<div class="row">
				<div class="col-md-6">
				<div class="form-group">
					<label>Role</label>
					<div class="styled-select">
					<select name="role">
						<option value="ADMIN">Admin</option>
						<option value="CLIENT">Client</option>
						<option value="OWNER">Restaurant Owner</option>
					</select>
					</div>
				</div>
			</div>
			</div>
			<!-- /row-->
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Profile picture</label>
                        <%--						<form action="/file-upload" class="dropzone dz-clickable"><div class="dz-default dz-message"><span>Drop files here to upload</span></div></form>--%>
                        <input class="form-control form-control-lg" id="picture" name="picture" type="file">
                    </div>
                </div>
            </div>
            <!-- /row-->

                <input type="hidden" name="id" value="0">
                <button type="submit" class="btn_1 medium">Save</button>

<%--		<p><a href="#0" class="btn_1 medium">Save</a></p>--%>
        </form>

           <%-- <c:if test="${confirmation == true}">
            <!-- /confirmation-->
            </c:if>--%>
            <br>
            <br>
<%--            <br>
            <c:choose>
                <c:when test="${confirmation == true}">
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="card dashboard text-white bg-success o-hidden h-100">
                            <div class="card-body">
                                <div class="card-body-icon">
                                    <i class="fa fa-fw fa-check"></i>
                                </div>
                                <div class="mr-5"><h5>Successfully saved</h5></div>
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
                                <div class="mr-5"><h5>Unsuccessfully saved</h5></div>
                            </div>
                        </div>
                    </div>
                </c:when>
            </c:choose>--%>

            <!-- /confirmation-->
	  </div>
	  <!-- /.container-fluid-->
   	</div>
    <!-- /.container-wrapper-->

      <%@ include file = "admin/admin_footer.jsp"%>
	<!-- Custom scripts for this page-->
	<script src="resources/vendor_admin/dropzone.min.js"></script>
	<script src="resources/vendor_admin/bootstrap-datepicker.js"></script>
	<script>$('input.date-pick').datepicker();</script>
  <!-- WYSIWYG Editor -->
  <script src="resources/js_admin/editor/summernote-bs4.min.js"></script>
      <script src="resources/js_admin/toastr.min.js"></script>
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
              if ("${errorMessage}"){
                  toastr["error"]("", "${errorMessage}")
              }
          }
      </script>
  </div>
</body>
</html>
