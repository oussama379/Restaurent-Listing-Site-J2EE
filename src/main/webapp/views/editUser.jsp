<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.example.restaurantmanagement.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) request.getAttribute("user"); %>
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
						<input type="text" class="form-control" placeholder="first name" name="firstname" value="<%= user.getFirstname() %>">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Last name</label>
						<input type="text" class="form-control" placeholder="last name" name="lastname" value="<%= user.getLastname() %>">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Username</label>
						<input type="text" class="form-control" placeholder="username" name="username" value="<%= user.getUsername() %>">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Email</label>
						<input type="email" class="form-control" placeholder="email" name="email" value="<%= user.getEmail()%>">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Password</label>
						<input type="password" class="form-control" placeholder="password" name="password" value="<%= user.getPassword() %>">
					</div>
				</div>
				<div class="col-md-6">
				<div class="form-group">
					<label>Role</label>
					<div class="styled-select">
					<select name="role">
                        <option value="ADMIN" <c:if test='<%= user.getRole().equals("ADMIN") %>'>selected</c:if> >Admin</option>
                        <option value="CLIENT" <c:if test='<%= user.getRole().equals("CLIENT") %>'>selected</c:if> >Client</option>
                        <option value="OWNER" <c:if test='<%= user.getRole().equals("OWNER") %>'>selected</c:if> >Restaurant Owner</option>
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

                <input type="hidden" name="id" value="<%= user.getId() %>">
                <button type="submit" class="btn_1 medium">Save</button>
                <a href="listUsers.php" class="btn_1 medium">Cancel</a>
<%--		<p><a href="#0" class="btn_1 medium">Save</a></p>--%>
        </form>
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
  </div>
</body>
</html>
